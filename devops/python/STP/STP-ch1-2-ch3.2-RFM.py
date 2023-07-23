"""
ch1. marketing (AMA, 2017 def.) strategy and data science (1974, 20221)
 - networking strategy : virtual enterprise
 - corporate strategy : expansion, stability, retrenchment, combination
 - business unit strategy : overall cost leadership, differentiation, focus
 ~ please everyone, and you will please no one (George Stephenson, 1825)
 ~ marketing 4P: Product, Price, Place, Promotion
 => marketing tactics: select customers/markets to serve; decide on a vale proposition.
 ~ strategic 3C: Customers, Corporation, Competitors
 ch2. clustering vs classification
 - supervised learning: predicting with linear regression, decision tree, random forest, neural network, gradient boosting tree; classification with decision tree, naive bayes, logistic regression, random forest, support vector machine (SVM), gradient boosting tree.
 - unsupervised learning: clustering with K-means, association with apriori, dimension reduction with PCA. 

ch3 Python 0 到 1 基礎商業數據分析實戰
 https://hahow.in/courses/5e3d127f5b02f600245861d9/main
 http://web.archive.org/web/20190621203039/https://morvanzhou.github.io/tutorials/data-manipulation/
 https://github.com/HowardNTUST/Python-with-STP-Marketing-Strategy
 https://github.com/HowardNTUST/Marketing-Data-Science-Application/blob/master/Python-RFM-RF-basics/01%20-%20RFM%E6%A8%A1%E5%9E%8BPython%E5%AF%A6%E6%88%B0.ipynb

 RFM (Recency 最近消費 Frequency 消費頻率 Monetary 消費金額, 1961) 非常適合分析消費者持續購買的民生用品 (p.3-18)。
"""

# 載入必要套件
import pandas as pd
import seaborn as sns
import RFM

# 動態繪圖套件
import plotly.graph_objs as go
from plotly.offline import download_plotlyjs, init_notebook_mode, plot, iplot
import plotly.offline as pyo
pyo.init_notebook_mode()
import numpy as np
import plotly.express as px
import tools
import seaborn as sns

theOS, ecode = tools.checkPlatform()

"""
最近一次（天）的消費與顧客數量分佈圖

https://howardntust.github.io/Marketing-Data-Science-Application/Python-RFM-RF-basics/%E6%9C%80%E8%BF%91%E4%B8%80%E6%AC%A1%EF%BC%88%E5%A4%A9%EF%BC%89%E7%9A%84%E6%B6%88%E8%B2%BB%E8%88%87%E9%A1%A7%E5%AE%A2%E6%95%B8%E9%87%8F%E5%88%86%E4%BD%88%E5%9C%96.html

 消費頻率與顧客數量分佈圖

https://howardntust.github.io/Marketing-Data-Science-Application/Python-RFM-RF-basics/%E6%B6%88%E8%B2%BB%E9%A0%BB%E7%8E%87%E8%88%87%E9%A1%A7%E5%AE%A2%E6%95%B8%E9%87%8F%E5%88%86%E4%BD%88%E5%9C%96.html

【分群後】最近一次（天）的消費與顧客數量分佈圖
https://howardntust.github.io/Marketing-Data-Science-Application/Python-RFM-RF-basics/%E3%80%90%E5%88%86%E7%BE%A4%E5%BE%8C%E3%80%91%E6%9C%80%E8%BF%91%E4%B8%80%E6%AC%A1%EF%BC%88%E5%A4%A9%EF%BC%89%E7%9A%84%E6%B6%88%E8%B2%BB%E8%88%87%E9%A1%A7%E5%AE%A2%E6%95%B8%E9%87%8F%E5%88%86%E4%BD%88%E5%9C%96.html
"""