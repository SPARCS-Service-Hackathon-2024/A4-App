import streamlit as st
import page1
import page2
import page3

PAGES = {
    "Page 1": page1,
    "Page 2": page2,
    "Page 3": page3,
}

def main():
    st.sidebar.title('Navigation')
    selection = st.sidebar.radio("Go to", list(PAGES.keys()))
    
    page = PAGES[selection]
    page.write()

if __name__ == "__main__":
    main()
