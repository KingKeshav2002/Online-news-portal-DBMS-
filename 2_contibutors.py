import streamlit as st 

import databasenp
import readarticle

# st.set_page_config(
#     page_title="page222"
# )
col1, col2 = st.columns(2)

with col1:
    st.title("PROJECT CONTRIBUTORS")

    st.subheader('KESHAVADITHYA')
    st.write('SRN-PES1UG20EC304')

    # st.title("PROJECT CONTRIBUTORS")

    st.subheader('K S RAGAHVENDRA')
    st.write('SRN-PES1UG20EC302')

    # st.title("PROJECT CONTRIBUTORS")

    st.subheader('KRISHNA S BALU')
    st.write('SRN-PES1UG21EC912')

    st.subheader('GOKUL MVSS')
    st.write('SRN-PES1UG21EC105')

    
with col2:
    st.image('IMG-20220914-WA0001.jpg')
    st.title("FACULTY")

    st.subheader('BHARGHAVI MOKASHI')
    st.write('PESU RR CSE')
    st.write('COURSE CODE UE20CS301')
  


