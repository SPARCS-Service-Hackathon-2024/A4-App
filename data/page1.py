import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.font_manager as fm

# 폰트 파일의 경로를 설정합니다.
font_path = 'NotoSansKR-Regular.ttf'

# FontProperties를 사용하여 폰트를 설정합니다.
font_prop = fm.FontProperties(fname=font_path)

# matplotlib의 rcParams에 FontProperties를 적용합니다.
plt.rcParams['font.family'] = font_prop.get_name()
plt.rcParams['axes.unicode_minus'] = False  # 마이너스 기호 문제 해결

def write():


    # CSV 데이터 로드
    data = pd.read_csv('가구원수별 가구구성과 평균 가구원수.csv', thousands=',', encoding='utf-8')

    # 가구원수별 구성 비율 데이터 추출
    composition_data = data.iloc[3:9, 2:].replace('-', '0').astype(float)
    composition_data.columns = data.iloc[1, 2:]  # 년도를 컬럼명으로 설정
    composition_data.set_index(data.iloc[3:9, 1].values, inplace=True)  # 가구원수를 인덱스로 설정
    composition_data = composition_data.transpose()  # 연도별로 보기 위해 전치

    # 평균 가구원수 데이터 추출
    average_household_size = data.iloc[9, 2:].replace('-', '0').astype(float)
    average_household_size.index = data.iloc[1, 2:]  # 년도를 인덱스로 설정합니다.
    average_household_size.name = '평균 가구원수'  # Series의 이름을 설정합니다.

    # 데이터 로드 (경로는 실제 파일 위치에 맞게 조정해야 합니다.)
    age_group_data = pd.read_csv('주요 연령집단별 1인가구비율.csv', thousands=',', encoding='utf-8')
    age_group_data.columns = age_group_data.iloc[1]  # 년도를 컬럼명으로 설정
    age_group_data = age_group_data.iloc[2:5]  # 첫 번째 행(년도) 제거
    age_group_data.set_index(age_group_data.columns[0], inplace=True)  # 첫 번째 열을 인덱스로 설정
    age_group_data.index.name = None  # 인덱스 이름 제거
    age_group_data.columns.name = None  # 컬럼 이름 제거
    age_group_data = age_group_data.replace('-', '0').astype(float)
    
    ####################################################################################
    #### 여기 아래부터 텍스트 ####
    ####################################################################################
    st.title("전국 1인가구 인구수 추세")

    headingtext ="> 2000년부터 2022년까지의 데이터를 분석한 결과, 전국적으로 **1인 가구의 비율이 15.5%에서 34.5%로 증가**하였습니다. 이는 전체 가구 구성에서 1인 가구의 비중이 점차 증가하고 있음을 시사합니다. \n\n > 특히, **20-30대 및 60-70대 연령대**에서 1인 가구 비율의 증가가 두드러지게 나타났습니다. \n \n"
    st.markdown(headingtext)

    st.divider()

    # Streamlit 컬럼 생성
    col1, col2 = st.columns(2)

    # 첫 번째 컬럼에 가구원수별 구성 비율 막대 그래프를 그립니다.
    with col1:
        st.info("연도별 가구원수별 가구구성 비율")                      #이곳이 그래프 위의 텍스트

        fig, ax = plt.subplots()
        
        # 가구원수별로 색상을 매핑합니다.
        color_map = {
            '1인가구': '#179630',
            '2인가구': '#6E6E6E',
            '3인가구': '#727272',
            '4인가구': '#868686',
            '5인가구': '#9B9B9B',
            '6인 이상가구': '#C6C6C6'
        }
        
        # 막대 그래프에 색상을 적용합니다.
        colors = [color_map.get(label, '#C6C6C6') for label in composition_data.columns]
        composition_data.plot(kind='bar', stacked=True, ax=ax, color=colors)
        ax.set_title('연도별 가구원수별 가구구성 비율')
        ax.set_xlabel('연도')
        ax.set_ylabel('가구구성 비율 (%)')
        ax.set_xticks(range(len(composition_data.index)))

         # x축 레이블을 정수로 변환합니다.
        ax.set_xticklabels(composition_data.index.astype(int), rotation=45)

        # 범례 위치를 변경합니다. 'upper left'는 왼쪽 상단을 의미합니다.
        ax.legend(loc='upper left')
        st.pyplot(fig)
        
        # col1string = "ㅇㅇ"

        # st.text(col1string)



    # 두 번째 컬럼에 평균 가구원수 막대 그래프를 그립니다.
    with col2:
        st.info("연도별 평균 가구원수")                         #이곳이 그래프 위의 텍스트


        fig, ax = plt.subplots()
        # 인덱스를 문자열로 변환하여 'x' 인자에 전달합니다.
        average_household_size.plot(kind='bar', ax=ax, color='#179630')
        ax.set_title('연도별 평균 가구원수')
        ax.set_xlabel('연도')
        ax.set_ylabel('평균 가구원수 (명)')
        ax.tick_params(axis='x', rotation=90)

        # x축 레이블을 정수로 변환합니다.
        ax.set_xticklabels(average_household_size.index.astype(int), rotation=45)
        st.pyplot(fig)

        # col2string = "여기에 두번째 그래프에 대한 설명을 적어주세요."

        # st.text(col2string)
    
    graph1Explanation = "> 1970년부터 2022년까지 **1인 가구의 비율이 점차 증가**하고 있음을 알 수 있습니다. 또 이에 따라 연도별 평균 가구원수 역시 감소세를 보이는 것을 확인할 수 있습니다. \n \n *출처: 통계청, 「인구총조사」*"
    st.markdown(graph1Explanation)
    st.divider()
    
    
    # 꺾은선 그래프 그리기
    st.info("연도별 주요 연령집단별 1인가구비율")                   #이곳이 그래프 위의 텍스트
    fig, ax = plt.subplots()
    # 연도별로 각 연령대의 비율을 나타내기 위한 그래프를 그립니다.
    for index, row in age_group_data.iterrows():
        ax.plot(age_group_data.columns.astype(str), row, marker='o', label=index)
    ax.set_xticks(range(len(age_group_data.columns)))
    ax.set_xticklabels(age_group_data.columns.astype(int), rotation=45)
    ax.set_xlabel('연도')
    ax.set_ylabel('1인가구 비율 (%)')
    ax.legend(title='연령대')
    st.pyplot(fig)

    graph2Explanation = "> 그래프를 통해 전체 인구수 대비 1인 가구 비율이 증가하였음을 알 수 있습니다. **특히 20-30대, 60-70대의 1인 가구 비율이 각각 5% 이상 크게 증가**했을을 확인할 수 있습니다. \n \n *출처: 통계청, 「인구총조사」*"
    st.markdown(graph2Explanation)

# 이 파일을 직접 실행하는 경우에만 아래 코드가 작동합니다.
if __name__ == "__main__":
    write()
