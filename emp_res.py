import pandas as pd
import streamlit as st
import datab


def rem_emp():
    val=st.text_input('enter username')
    datab.delete_data(val)
    
