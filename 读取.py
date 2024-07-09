import pandas as pd
import openpyxl
file_path=r'E:\2023美赛\Problem_C_Data_Wordle.xlsx'
de = pd.read_excel(file_path,usecols=[3])
print(de)
print(type(de))
