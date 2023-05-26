import mysql.connector
import streamlit as st
# from appm import nextpage
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    database="newspaper"
)
titlelist=[]
c = mydb.cursor()
def login(u_name,pwd):
   c.execute("select Name,Lastname from worker where Username='{}' and password='{}'".format(u_name,pwd))
   res=c.fetchone()
   if res is not None:
      # nextpage()
      st.success("congrats")
      #nextpage()
      active=1
      

   else:
      st.error('access denied')
      return

   c.execute("SELECT iseditor FROM journalist,worker where journalist.journalistEmail=worker.email and worker.Username='{}'".format(u_name))
   global iseditor
   iseditor=int(c.fetchone()[0])

   global iscolumnist
   c.execute("SELECT iscolumnist FROM journalist,worker where journalist.journalistEmail=worker.email and worker.Username='{}'".format(u_name))
   iscolumnist=int(c.fetchone()[0])
   # if iseditor==1:
   #    st.subheader("Editor in chief")
   #    st.text("you have editorial access")

   # else:
   #    st.subheader("Journalist")
   #    st.text("you do not have editorial access")

   mydb.commit()
   return active

def journ_category():
   # c.execute("SELECT iseditor FROM journalist,worker where journalist.journalistEmail=worker.email and worker.Username='{}'".format(u_name))
   # iseditor=int(c.fetchone())
   if iseditor==1:
      st.subheader("Editor in chief")
      st.text("you have editorial access")

   else:
      st.subheader("Journalist")
      st.text("you do not have editorial access")

def database_resume(j_nme):
   #c.execute("select Name,Lastname,resume from worker,journalist where Username='{}' and password='{}'".format(u_name,pwd))
   c.execute("SELECT Name,Lastname,resume FROM journalist,worker where journalist.journalistEmail=worker.email and worker.Username='{}'".format(j_nme))
   res=c.fetchone()
   
   mydb.commit()

   if res is not None:
      st.success("success")
      #nextpage()

   else:
      st.error('wrong input')
      return
   
   data=c.fetchall()
   
   return data

def data_view():
   c.execute("select state,title,newspaper,keywords from article")
   readinfo=c.fetchall()
   return readinfo
   mydb.commit()

def live_titles():
   c.execute("select title from article")
   titlecolumn=c.fetchall()
   mydb.commit()
   
   for i in titlecolumn:
      for j in i:
         titlelist.append(j)
   return titlelist  
      


def updatestatus(stat,titleselect):
   if(iseditor):

      #if st.button("confirm"):
      c.execute("update article set state='{}' where title='{}'".format(stat,titleselect))
   
      mydb.commit()
   else:
      st.write("you do not have access to change status")


