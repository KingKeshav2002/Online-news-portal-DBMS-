import streamlit as st
import datab
import pandas as pd

def categories():
    data=datab.categ()
    df=pd.DataFrame(data,columns=['id','title','sub_of'])
    st.dataframe(df)

def categ_add():
    id=st.number_input("enter an id:")
    categorytitle=st.text_input("enter title")
    description=st.text_input("explain")
    sub=st.number_input("sub category of:")
    datab.cat_addition(id,categorytitle,description,sub)

