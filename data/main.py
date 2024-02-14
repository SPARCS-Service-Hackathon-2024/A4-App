import streamlit as st
import page1
import page2
import page3

# 페이지 모듈을 리스트로 관리
PAGES = [page1, page2, page3]


# 현재 페이지 인덱스를 세션 상태에 저장하는 함수
def save_current_page_index(index):
    st.session_state.current_page_index = index

# 메인 함수
def main():
    #st.title('Navigation')

    # 세션 상태 초기화
    if 'current_page_index' not in st.session_state:
        st.session_state.current_page_index = 0  # 첫 페이지부터 시작

    # 현재 페이지를 세션 상태에서 가져옴
    current_page = PAGES[st.session_state.current_page_index]
    current_page.write()  # 현재 페이지 로드

    col1, col2 = st.columns([1, 5])

    # 이전 페이지 버튼
    with col1:
        if st.button('Previous'):
            if st.session_state.current_page_index > 0:
                save_current_page_index(st.session_state.current_page_index - 1)
                st.rerun()

    # 다음 페이지 버튼
    with col2:
        if st.button('Next'):
            if st.session_state.current_page_index < len(PAGES) - 1:
                save_current_page_index(st.session_state.current_page_index + 1)
                st.rerun()

if __name__ == "__main__":
    main()
