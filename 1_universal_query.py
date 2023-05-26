import streamlit as st
import mysql.connector
import pandas as pd
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    database="newspaper")
c = mydb.cursor()
st.title("Universal queries")
st.markdown("this field implements whatever raw queries one wants to apply on the database implemented")

query=st.text_input("Enter your query here")
if st.button("Apply"):
    try:
        c.execute(query)
        st.success("successful")
        mydb.commit()
    except:
        st.error("query unsuccessful")

selectquery=st.text_input("Enter your selection query here")
if st.button('view selection'):
    c.execute(selectquery)
    d=c.fetchall()
    df=pd.DataFrame(d)
    st.dataframe(df)





