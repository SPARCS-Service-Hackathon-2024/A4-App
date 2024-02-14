import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.font_manager as fm

# 폰트 파일의 경로를 설정합니다. 예를 들어 'NanumGothic.ttf'
font_path = 'NotoSansKR-Regular.ttf'

# FontProperties를 사용하여 폰트를 설정합니다.
font_prop = fm.FontProperties(fname=font_path)

# matplotlib의 rcParams에 FontProperties를 적용합니다.
plt.rcParams['font.family'] = font_prop.get_name()
plt.rcParams['axes.unicode_minus'] = False  # 마이너스 기호 문제 해결

# Streamlit 페이지 설정
def write():
    
    st.title("가구원수별 가구구성 변화")

    # CSV 데이터 로드
    data = pd.read_csv('가구원수별 가구구성과 평균 가구원수.csv', thousands=',', encoding='utf-8')

    # 필요한 데이터만 추출
    # 첫 번째 행은 제목이므로 건너뜁니다.
    # 첫 번째 열(항목명)과 두 번째 열(단위)은 제외하고 나머지 데이터를 사용합니다.
    # '가구원수별 가구구성(%)' 부분은 세 번째 행부터 시작하므로 data.iloc[2:]를 사용합니다.
    composition_data = data.iloc[3:9, 2:].replace(',', '').replace('-', '0').astype(float)  # 1인가구부터 6인 이상가구까지 추출
    composition_data.columns = data.iloc[1, 2:]  # 두 번째 행을 컬럼명으로 설정
    composition_data.set_index(data.iloc[3:9, 1].values, inplace=True)  # 가구원수를 인덱스로 설정
    composition_data = composition_data.transpose()  # 연도별로 보기 위해 전치

    # 그래프 그리기
    fig, ax = plt.subplots(figsize=(10, 8))
    # 'stacked=True'는 막대를 쌓아서 표시합니다.
    composition_data.plot(kind='bar', stacked=True, ax=ax)
    
    # 그래프 제목과 라벨 설정
    ax.set_title('연도별 가구원수별 가구구성 비율')
    ax.set_xlabel('연도')
    ax.set_ylabel('가구구성 비율 (%)')

    # Streamlit을 통해 그래프 출력
    st.pyplot(fig)

# 이 파일을 직접 실행하는 경우에만 아래 코드가 작동합니다.
if __name__ == "__main__":
    write()
