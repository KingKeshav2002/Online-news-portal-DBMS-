import streamlit as st 

import datab
import readarticle
import journ
import cat
import new_art
import emp_res
# global menu
# menu=['new_article','show articles','update article state','categories','article manager','journalist manager','view resume']
# st.set_page_config(
#     page_title="Hello"
# )
# def activitystatus():
#     u_name = st.text_input("UserName:")
#     pwd = st.text_input("password:")
    
#     if st.button("Login"):
        
#         active=datab.login(u_name,pwd)
#         return active
active=0
st.sidebar.success("select above")
def main():
    st.title("Newspaper management Portal")
    st.sidebar.image('wallhaven-oxp8z9.png',use_column_width=True)
    st.sidebar.image('wallhaven-o3915p.jpg',use_column_width=True)
    # st.sidebar.image('wallhaven-nz1rdy.jpg',use_column_width=True)
    placeholder=st.empty()
    # st.text_input()
    with placeholder.container():
        u_name = st.text_input("UserName:")
        pwd = st.text_input("password:",type="password")
        
        if st.button("Login/out"):

            datab.login(u_name,pwd)


    if datab.login(u_name,pwd):
        datab.journ_category(u_name)
        menu=['new_article','show articles','update article state','categories','remove employee']
        with placeholder.container():
            choice=st.selectbox('select activity',menu)

            if choice == 'categories':
                cat.categories()
                cat.categ_add()
            elif choice== 'show articles':
                st.subheader("All articles")
                readarticle.view()
            elif choice== 'update article state':
                st.subheader('article name')
                readarticle.view_edit()
            elif choice==('new_article'):
                st.subheader("NEW ARTICLE")
                new_art.new_article()
            elif choice==('view resume'):
                journ.view_resume()
            elif choice=='remove employee':
                st.subheader("employee termination/resignation")
                emp_res.rem_emp()

            
            
    # if active:
    #     datab.journ_category(u_name)
    #     # menu=['new_article','show articles','update article state','categories','article manager','journalist manager','view resume']
    #     # placeholder.selectbox("select activity",menu)
    #     # with placeholder.container():
    #     choice=placeholder.selectbox("select activity",menu)
    #     if choice == "view resume":
    #         st.subheader("Resume")

    #         # journ.view_resume()


    #     elif choice=='update article':
    #         st.subheader("article name")
    #     elif choice=='show articles':
    #          st.subheader("All articles")
    #          readarticle.view()
    #     # elif choice=='update article state':
    #     #     st.subheader('available articles')
    #     #     readarticle.view_edit()
        

    #     # placeholder.write("new section")
#     # if st.button("Logout"):
#     #         with placeholder.container():
#     #             u_name = st.text_input("UserName:")
#     #             pwd = st.text_input("password:")
#     #             active=0
#     #             if st.button("Login"):

#     #                 active=datab.login(u_name,pwd)


            






if __name__== '__main__':
    main()