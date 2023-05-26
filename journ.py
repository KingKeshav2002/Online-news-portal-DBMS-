import streamlit as st
import datab
import pandas as pd
# def journ_fn(u_name):
#     return databasenp.journ_category(u_name)

def view_resume():
    
    j_nme = st.text_input("journalist's name")
    data_j=datab.database_resume(j_nme)
    df=pd.DataFrame(data_j,columns=['name','lastname','resume'])    
    st.dataframe(df)
    # return data

