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


def load_data():
    # 데이터 불러오기
    data = {
        '구분': ['70세 이상', '60대', '50대', '40대', '30대', '20대', '20세 미만', '대전'],
        '경제적 어려움': [33.3, 80.0, 38.5, 25.0, 25.0, 45.0, 50.0, 45.7],
        '질병, 건강 악화 시 돌봄': [52.4, 0, 38.5, 25.0, 8.3, 15.0, 0, 22.8],
        '심리적 외로움': [9.5, 10.0, 15.4, 25.0, 16.7, 25.0, 50.0, 16.3],
        '자기 돌봄의 어려움': [4.8, 0, 0, 0, 16.7, 5.0, 0, 4.3],
        '사회적 편견': [0, 0, 0, 25.0, 25.0, 0, 0, 4.3],
        '어려움 없음': [0, 10.0, 7.7, 0, 8.3, 10.0, 0, 6.5]
    }
    df = pd.DataFrame(data)
    return df

def visualize_data(df):
    # 한글 폰트 설정
    #plt.rc('font', family='Malgun Gothic')

    # 데이터 시각화
    fig, ax = plt.subplots(figsize=(10, 6))
    df.set_index('구분').plot(kind='barh', stacked=True, ax=ax, 
                              color=['#FFB6C1', '#87CEFA', '#90EE90', '#FFFF00', '#EECCEE', '#DDFFFF'])

    for p in ax.patches:
        width = p.get_width()
        height = p.get_height()
        x, y = p.get_xy() 
        if width > 0:
            ax.text(x+width/2, 
                    y+height/2, 
                    '{:.1f} %'.format(width), 
                    horizontalalignment='center', 
                    verticalalignment='center')

    ax.set_xlabel('비율 (%)')
    ax.set_ylabel('구분')
    ax.set_title('<연령별 혼자 살 경우 느끼는 어려움>')

    # 범례 위치 조정
    ax.legend(bbox_to_anchor=(1.05, 1), loc='upper left')

    # 시각화한 이미지를 Streamlit에 표시
    st.pyplot(fig)

def write():
    st.title("1인 가구의 불편함")

    headingtext = "> 주거 안정성 부족, 사회적 고립감, 경제적 부담 등이 주된 문제로 식별되었습니다. 특히 대전시 젊은 1인 가구는 **주거 비용과 관련된 문제 및 사회적 네트워크 형성의 어려움을 가장 큰 불편함**으로 호소합니다. 이러한 분석 결과는 대전시 및 관련 기관에서 1인 가구를 위한 정책 개발 및 서비스 제공에 중요한 기초 자료를 제공합니다. \n \n > 저희 팀은 이러한 데이터 기반의 심층 분석을 통해 대전시 1인 가구의 삶의 질을 개선하고 사회적 고립감을 줄이는 실질적이고 지속 가능한 해결책을 제안하고자 합니다."
    st.markdown(headingtext)
    st.divider()
    st.info("연령별 혼자 살 경우 느끼는 어려움")
    
    # 데이터 불러오기
    df = load_data()
    
    # 데이터 시각화
    visualize_data(df)

    graphExplanation = "> 그래프를 통해 1인가구가 가장 많이 느끼는 불편함은 **경제적 어려움, 심리적 외로움, 질병 및 건강 악화시 돌봄**임을 확인할 수 있습니다. \n \n *출처: 여성가족부, 「가족실태조사」*"
    st.markdown(graphExplanation)

if __name__ == "__main__":
    write()
