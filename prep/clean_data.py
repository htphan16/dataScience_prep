import numpy as np
import pandas as pd

data = pd.ExcelFile('Dr2_401_500.xlsx')
print(data.sheet_names)

print(data.parse(sheet_name='Sheet1').head(10))

