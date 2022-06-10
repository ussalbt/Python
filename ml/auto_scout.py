import streamlit as st
import pandas as pd
import numpy as np
from PIL import Image
st.title("CAR PRICE FORECAST")
st.write("# dataframes")
df = pd.read_csv("final_scout_not_dummy.csv")
df = df[["make_model","km","Gears","age","hp_kW","price"]]
st.write(df.head()) #dynamic, you can sort, swiss knife
#Project Example
import pickle
filename = 'final_Auto_scout'
model = pickle.load(open(filename, 'rb'))

Age= st.sidebar.number_input("Age:",min_value=0, max_value=4)
Gears = st.sidebar.number_input("Gears:",min_value=1, max_value=7)
Km = st.sidebar.number_input("Km:",min_value=0, max_value=350000)
Hp_Kw = st.sidebar.number_input("Hp_Kw:",min_value=0, max_value=4000)
Make_model=st.selectbox("Make_model", ["Audi A1","Audi A2","Audi A3","Opel Astra","Opel Corsa","Opel İnsignia","Renault Clio","Renault Espace","Renault Duster"])
st.write("You selected this option:", )
my_dict = {
    "Age": Age,
    "Gears": Gears,
    "Km": Km,
    "Hp_Kw" : Hp_Kw,
    "Make_model" : Make_model
}
df=pd.DataFrame.from_dict([my_dict])
st.table(df)

html_temp = """
<div style="background-color:tomato;padding:1.5px">
<h1 style="color:white;text-align:center;">Thank you for visiting </h1>
</div><br>"""
st.markdown(html_temp,unsafe_allow_html=True)
