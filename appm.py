import streamlit as st 

import databasenp
import readarticle


# def nextpage(): st.session_state.page += 1
# def restart(): st.session_state.page = 0




# def main(): 
#  if "page" not in st.session_state:
#     st.session_state.page = 0
#  st.title("NEWSPAPER MANAGEMENT PORTAL")

#  placeholder = st.empty()


#  if st.session_state.page == 0:
#    with placeholder.container():
#       #st.title("newspaper management portal")
#       st.sidebar.image('wallhaven-oxp8z9.png',use_column_width=True)
#       st.sidebar.image('wallhaven-o3915p.jpg',use_column_width=True)
#       st.sidebar.image('wallhaven-nz1rdy.jpg',use_column_width=True)
#       u_name = st.text_input("UserName:")
#       pwd = st.text_input("password:")
#       if st.button("Login"):
#          active=databasenp.login(u_name,pwd)
#          #nextpage()
#  elif st.session_state.page == 1:
#    with placeholder.container():
#       from journ import view_resume
#       databasenp.journ_category()
#       if st.button("view resume"):
#          view_resume()


      
#       menu=['new_article','show articles','update article state','categories','article manager','journalist manager','view resume']
#       choice=st.sidebar.selectbox("select activity",menu)
#       if choice == "view resume":
#          st.subheader("journalist's name")
#       elif choice=='update article':
#          st.subheader("article name")
#       elif choice=='show articles':
#          st.subheader("All articles")
#          readarticle.view()
#       elif choice=='update article state':
#          st.subheader('available articles')
#          readarticle.view_edit()


         
   
#       if st.sidebar.button("logout"):
#          restart()

# if __name__ == '__main__': 
#  main() 

# def nextpage(): st.session_state.page += 1
# def restart(): st.session_state.page = 0




def main(): 
#  if "page" not in st.session_state:
#     st.session_state.page = 0
   st.title("NEWSPAPER MANAGEMENT PORTAL")

#  placeholder = st.empty()


#  if st.session_state.page == 0:
#    with placeholder.container():
#       #st.title("newspaper management portal")

      #nextpage()
#  elif st.session_state.page == 1:
   # with placeholder.container():
   #    from journ import view_resume
   #    databasenp.journ_category()
   #    if st.button("view resume"):
   #       view_resume()

   st.sidebar.image('wallhaven-oxp8z9.png',use_column_width=True)
   st.sidebar.image('wallhaven-o3915p.jpg',use_column_width=True)
   st.sidebar.image('wallhaven-nz1rdy.jpg',use_column_width=True)
   # u_name = st.text_input("UserName:")
   # pwd = st.text_input("password:")
   # if st.button("Login"):
   #    active=databasenp.login(u_name,pwd)
   # active=1
   # if active:   
   menu=['new_article','show articles','update article state','categories','article manager','journalist manager','view resume']
   choice=st.sidebar.selectbox("select activity",menu)
   if choice == "view resume":
      st.subheader("journalist's name")
   elif choice=='update article':
      st.subheader("article name")
   elif choice=='show articles':
      st.subheader("All articles")
      readarticle.view()
   elif choice=='update article state':
      st.subheader('available articles')
      readarticle.view_edit()


         
   
      # if st.sidebar.button("logout"):
      #    restart()

if __name__ == '__main__': 
 main() 
