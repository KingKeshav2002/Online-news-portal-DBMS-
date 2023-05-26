import pandas as pd
import streamlit as st
import datab

def new_article():
    title=st.text_input("enter title")
    path=st.text_input("enter path")
    position=st.slider('choose position',0,20,1)

    newspaper=st.radio("choose your paper",('Mega City News','Daily News','Top News'))
    magazine=st.slider('choose mag',0,10,1)
    summary=st.text_input("enter summary")
    comments=st.text_input("enter comments")
    keywords=st.text_input("enter keywords")
    category=st.slider('choose category',0,7,1)
    length=len(path)
    datab.newart(title,path,position,newspaper,magazine,summary,comments,keywords,category,length)
