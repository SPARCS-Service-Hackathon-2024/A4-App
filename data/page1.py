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
    st.title("Page 1")

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

    # Streamlit 컬럼 생성
    col1, col2 = st.columns(2)

    # 첫 번째 컬럼에 가구원수별 구성 비율 막대 그래프를 그립니다.
    with col1:
        st.subheader("연도별 가구원수별 가구구성 비율")
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
        st.pyplot(fig)

    # 두 번째 컬럼에 평균 가구원수 막대 그래프를 그립니다.
    with col2:
        st.subheader("연도별 평균 가구원수")
        fig, ax = plt.subplots()
        # 인덱스를 문자열로 변환하여 'x' 인자에 전달합니다.
        average_household_size.plot(kind='bar', ax=ax, color='#179630')
        ax.set_title('연도별 평균 가구원수')
        ax.set_xlabel('연도')
        ax.set_ylabel('평균 가구원수 (명)')
        ax.tick_params(axis='x', rotation=90)
        st.pyplot(fig)

# 이 파일을 직접 실행하는 경우에만 아래 코드가 작동합니다.
if __name__ == "__main__":
    write()
