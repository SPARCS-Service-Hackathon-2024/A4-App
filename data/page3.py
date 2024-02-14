import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt

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
    plt.rc('font', family='Malgun Gothic')

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

def main():
    st.title("연령별 혼자 살 경우 느끼는 어려움")
    
    # 데이터 불러오기
    df = load_data()
    
    # 데이터 시각화
    visualize_data(df)

if __name__ == "__main__":
    main()
