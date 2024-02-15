import streamlit as st
import requests
import pandas as pd
import numpy as np
from streamlit_folium import folium_static
import folium
from folium.plugins import MarkerCluster

import json

# 가구 수 
total_population_by_region_code = {
    "00": 22383187, # 전국
    "11": 4252134,  # 서울특별시
    "26": 1464557,  # 부산광역시
    "27": 1024104,  # 대구광역시
    "28": 31249056,  # 인천광역시
    "29": 634113,  # 광주광역시
    "30": 656236,  # 대전광역시
    "31": 462748,  # 울산광역시
    "36": 156289,   # 세종특별자치시
    "41": 5617507, # 경기도
    "51": 693576,  # 강원도 - 지역코드
    "43": 724108,  # 충청북도
    "44": 966019,  # 충청남도
    "52": 791720,  # 전라북도 (전북특별자치도는 정식 명칭이 아닐 수 있으므로, 전라북도로 표기)
    "46": 797720,  # 전라남도
    "47": 1189287,  # 경상북도
    "48": 1420266,  # 경상남도
    "50": 283747    # 제주특별자치도
}


state_geo = './SIG_WGS84_20220324.json'
sido_geo = './Si_Do_map_utf8.json'

# 시도기준 경계선 JSON 파일
with open(state_geo, encoding='utf-8') as file:
    sidogu_map = json.load(file)

with open(sido_geo, encoding='utf-8') as file:
    sido_map = json.load(file)

# 지도에 표시하기 위한 법정동별 위도,경도 데이터
bjd_data = pd.read_csv('./bjd_info_except_boundary.csv', encoding='EUC-KR')
bjd_data_filtered = bjd_data[['bjd_cd', 'center_long', 'center_lati']]
bjd_data_filtered['bjd_cd'] = bjd_data_filtered['bjd_cd'].astype(str)

# 1인가구 분포 데이터 전처리
single_person_data = pd.read_csv('./single_person_by_region.csv', encoding='EUC-KR')
single_person_data['법정동코드']=single_person_data['법정동코드'].map(lambda x:str(x).zfill(10))
single_person_data['지역코드'] = single_person_data['법정동코드'].str[:2]
cols_to_drop = single_person_data.columns[single_person_data.columns.get_loc('지역코드')+1:]
data_filtered = single_person_data.drop(columns=cols_to_drop)

single_person_ratio = pd.read_csv('./testData.csv')

cols_to_drop = single_person_ratio.columns[single_person_ratio.columns.get_loc('지역코드')+1:]


# 1인 가구 데이터 + 위도경도 데이터
merged_data = pd.merge(data_filtered, bjd_data_filtered, left_on='법정동코드', right_on='bjd_cd', how='left')
# '지역코드'별로 '계' 값을 합산
aggregated_data = merged_data.groupby('지역코드')['계'].sum().reset_index()


# '시도명'이 '대전광역시'인 데이터만 필터링
# 지역별 1인 가구 비율 계산
aggregated_data['1인가구비율'] = aggregated_data.apply(lambda x: (x['계'] / total_population_by_region_code[x['지역코드']]) * 100, axis=1)

data_filtered_daejeon = merged_data[merged_data['시도명'] == '대전광역시']


def write():
    m = make_m()
    m2 = make_m2()

    st.title('지역별 1인 가구 비율 알아보기')
    st.write('지역별 1인 가구의 비율 표')
    st.dataframe(single_person_ratio)
    # Streamlit에서 지도 표시
    st.write('전국 지도에 나타낸 1인 가구의 비율')
    folium_static(m2)
    st.write('대전 지도에 버블로 나타낸 1인 가구의 수')
    folium_static(m)
    



if __name__ == "__main__":
    write()


def make_m():
    # 대전 지도의 중심을 계산하기 위한 평균 위도와 경도
    avg_lat = data_filtered_daejeon["center_lati"].mean()
    avg_lon = data_filtered_daejeon["center_long"].mean()
    # m : 대전 지도
    m = folium.Map(location=[avg_lat, avg_lon], zoom_start=13)
    # 마커 클러스터 생성
    marker_cluster = MarkerCluster().add_to(m)

    # merged_data 내 각 행에 대해 반복하여 버블 추가
    for idx, row in data_filtered_daejeon.dropna(subset=["center_long", "center_lati"]).iterrows():
        # '계' 값을 반영하여 popup 메시지 생성
        popup_message = f"{row['시도명']} {row['시군구명']} {row['읍면동명']}: 계 = {row['계']}"
        
        
        # CircleMarker 추가
        folium.CircleMarker(
            location=[row['center_lati'], row['center_long']],
            radius=5,  # 예시 반지름
            color='blue',
            fill=True,
            fill_color='blue',
            fill_opacity=0.6,
            popup=popup_message,  # 각 CircleMarker에 '계' 값 표시
        ).add_to(marker_cluster)

    return m

def make_m2():
    # m2 : 전국 지도
    m2 = folium.Map(location=[35.8, 128.071503], zoom_start=7,)
    # 대전광역시 위치에 마커 추가
    folium.Marker(
        [36.3504119, 127.3845475],
        popup='대전광역시',
        tooltip='대전광역시'
    ).add_to(m2)

    # m2 지도에 행정구역별로 경계선 설정
    ch = folium.Choropleth(
        # geo json 파일로 sido_map 을 사용
        geo_data=sido_map,
        # choropleth 옵션을 쓸 것임
        name='choropleth',
        # data로는 population.csv 파일을 사용 (df로 불러옴)
        data=single_person_ratio,
        # csv 파일에서 사용할 컬럼 값
        columns=['지역코드', '비중'], 
        # 시도명 - CTP_KOR_NM 매핑
        key_on='feature.properties.CTPRVN_CD',
        # geo json 색깔 설정
        fill_color='YlGn',
        # 지도 투명하게  
        fill_opacity=0.7,
        # 경계선 투명하게
        line_opacity=1,  
        # 경계선 굵기
        line_weight=1.0,
        # 경계선 색
        line_color='#000',
        # 범례 이름
        legend_name='시도별 1인 가구 수',  
        highlight=True, # 하이라이트 설정
        ).add_to(m2)
    
    folium.LayerControl().add_to(m2)
    return m2
    