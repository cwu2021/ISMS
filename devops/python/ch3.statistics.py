# functions required (p.075) 
import numpy as np
import scipy as sp
import pandas as pd
from pandas import Series, DataFrame

# visualization
import matplotlib.pyplot as plt
import matplotlib as mpl
import seaborn as sns
sns.set()
%matplotlib inline

# digit precision
%precision 3

# data fetching (p.078)
url = 'https://my.url/data.zip'
r = requests.get(url, stream=True)
z = zipfile.ZipFile(io.BytesIO(r.content))
z.extractall()

#student_data_math = pd.read_csv('student-mat.csv')
student_data_math = pd.read_csv('student-mat.csv', sep=';')
student_data_math.head()

# 箱型圖: G1,G2,G3 (p.090 最大值，第3四分位，中位，第1四分位，最小值)
plt.boxplot([student_data_math['G1'], student_data-math['G2'], student_data-math['G3']])
plt.grid(True)

# 散佈圖 (p.098)
plt.plot(student_data_math['G1'], student_data_math['G3'], 'o')
plt.xlabel('G1 grade')
plt.ylabel('G3 grade')
plt.grid(True)

# Regression (p.099)
from sklearn import linear_model
reg = linear_model.linearRegression()
X = student_data_math.loc[:, ['G1']].values
Y = student_data_math['G3'].values
reg.fit(X, Y)
print('迴歸係數:', reg.coef_)
print('截距:', reg.intercept_)
plt.scatter(X, Y)
plt.xlabel('G1 grade')
plt.ylabel('G3 grade')
plt.plot(X, reg.predict(X))
plt.grid(True)
print('決定係數:', reg.score(X, Y))