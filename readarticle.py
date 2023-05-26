import pandas as pd
import streamlit as st
import datab

def view():
    data=datab.data_view()
    df=pd.DataFrame(data,columns=['state','title','newspaper','keywords'])
    st.dataframe(df)

def view_edit():
    data=datab.data_view()
    df=pd.DataFrame(data,columns=['state','title','newspaper','keywords'])
    st.dataframe(df)

    # titlelist=datab.live_titles()
    # titleselect=st.selectbox("title-select",titlelist)
    
    i=st.slider('select index',0,len(df)-1,1)
    
    titleselect=df.at[i,'title']
    status=['accepted','rejected','in-review']
    stat=st.selectbox("confirm status",status)
    if st.button("confirm"):
        datab.updatestatus(stat,titleselect)
        # df=pd.DataFrame()