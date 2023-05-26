import mysql.connector
import streamlit as st
# from appm import nextpage
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    database="newspaper")
titlelist=[]
c = mydb.cursor()
def login(u_name,pwd):
   c.execute("select Name,Lastname from worker where Username='{}' and password='{}'".format(u_name,pwd))
   res=c.fetchone()
   if res is not None:
      st.success("successful")
      return 1
      

   else:
      st.error('access denied')
      active = 0
      return 0
def journ_category(u_name):
   #c.execute("SELECT iseditor FROM journalist,worker where journalist.journalistEmail=worker.email and worker.Username='{}'".format(u_name))
   #global iseditor
   #iseditor=int(c.fetchone()[0])

   global iscolumnist
   c.execute("SELECT iscolumnist FROM journalist,worker where journalist.journalistEmail=worker.email and worker.Username='{}'".format(u_name))
   iscolumnist=int(c.fetchone()[0])
   if iscolumnist==1:
      st.subheader("Editor in chief")
      st.text("you have editorial access")

   else:
      st.subheader("Journalist")
      st.text("you do not have editorial access")

def database_resume(j_nme):
   #c.execute("select Name,Lastname,resume from worker,journalist where Username='{}' and password='{}'".format(u_name,pwd))
   if st.button("view"):
        c.execute("SELECT Name,Lastname,resume FROM journalist,worker where journalist.journalistEmail=worker.email and worker.name='{}'".format(j_nme))
        res1=c.fetchall()
        return res1

def data_view():
   c.execute("select state,title,newspaper,keywords from article")
   readinfo=c.fetchall()
   mydb.commit()
   return readinfo
   

# def live_titles():
#    c.execute("select title from article")
#    titlecolumn=c.fetchall()
#    mydb.commit()
   
#    for i in titlecolumn:
#       for j in i:
#          titlelist.append(j)
#    return titlelist  
      


def updatestatus(stat,titleselect):
    if(iscolumnist):
    # if 1:
      if st.button("confirm"):
        c.execute("update article set state='{}' where title='{}'".format(stat,titleselect))
   
        mydb.commit()
    #   data=c.fetchall()
    #   return data
    else:
       st.write("you do not have access to change status")


def categ():
    c.execute("select id,categorytitle,issubcategoryof from category")
    data=c.fetchall()
    return data

def newart(title,path,position,newspaper,magazine,summary,comments,keywords,category,length):
    if(iscolumnist):
    # if 1:
        try:
            if st.button("submit"):
                c.execute("insert into article values('applied','{}','{}',{},{},{},'{}','{}','{}','{}',{})".format(title,path,length,position,magazine,newspaper,comments,summary,keywords,category)) 
        except:
            st.error("") 
    else:
       st.write("you do not have access to write")   

def cat_addition(id,categorytitle,description,sub):
    if st.button("view"):
        c.execute("insert into category values({},'{}','{}',{})".format(id,categorytitle,description,sub))


def delete_data(fired_emp):
    c.execute('DELETE FROM worker WHERE username="{}"'.format(fired_emp))
    mydb.commit()