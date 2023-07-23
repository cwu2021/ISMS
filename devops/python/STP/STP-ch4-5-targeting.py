"""
ch4-1 Defining the Business: The Starting Point of Strategic Planning (Abell, 1980)
 - single-segment concentration
 - selective segment specialization
 - product specialization
 - market specialization
 - full market coverage

ch4-2 Judging the quality of customer segments: segmentation effectiveness (Dibb et al, 2010)
 - Homogeneous, Size and Potential Profitability, Stability, Accessibility, Compatibility (Fit), Actionability

ch4-3 precision marketing ~ personal
 - tools;evidence-base, better understanding, dynamic;precision, satisfied;loyalty;conversion, profit;success.

ch5 選擇目標市場程式實作 : Random Forest, XGBoost, LightGBM https://github.com/HowardNTUST/Marketing-Data-Science-Application/blob/master/contract/%E9%81%B8%E6%93%87%E7%9B%AE%E6%A8%99%E5%B8%82%E5%A0%B4%E7%A8%8B%E5%BC%8F%E5%AF%A6%E4%BD%9C.ipynb
"""

# 載入必要套件
# Importing the libraries
#from util import get_dummies
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split, GridSearchCV, StratifiedKFold
from sklearn.ensemble import RandomForestClassifier, VotingClassifier
from lightgbm import LGBMClassifier
from xgboost import XGBClassifier
from sklearn.metrics import confusion_matrix, classification_report, roc_auc_score, precision_recall_curve, roc_curve, auc

import matplotlib.pyplot as plt
plt.rcParams['font.sans-serif'] = ['Microsoft JhengHei'] 
plt.rcParams['axes.unicode_minus'] = False  
from matplotlib.font_manager import FontProperties 
import seaborn as sns 
myfont=FontProperties(fname='Microsoft JhengHei',size=14) 
sns.set(font=myfont.get_family()) 
sns.set_style("darkgrid",{"font.sans-serif":['Microsoft JhengHei']}) 