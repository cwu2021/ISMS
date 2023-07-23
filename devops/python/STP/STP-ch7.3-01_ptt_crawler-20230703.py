#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""

@author: Howard
"""
# ch1-7 STL: Segmenting, Targeting, Positioning ; 4P: Product, Price, Place, Promotion 
# https://github.com/HowardNTUST/Marketing-Data-Science-Application/tree/master/cost_effect_gps_positioning
# 輿情分析 https://choose.blueplanet.com.tw/
# 民調中心 https://www.setn.com/votelist.aspx
# https://news.ltn.com.tw/news/politics/breakingnews/4340492
# https://www.storm.mg/article/2178655
# https://www.ettoday.net/survey/survey.php?id=557
# https://cc.tvbs.com.tw/portal/file/poll_center/2023/20230619/ffa03d95ea51843cc4189b6c1339090b.pdf

import pandas as pd
from ptt import Board, crawl_ptt_page, crawl_ptt_page_auto
from requests.exceptions import ReadTimeout
import numpy as np
import time
import random 
import jieba
jieba.set_dictionary('dict.txt.big')

## 必要設定的欄位
# 1. Board_Name:放入讀者想要爬取的版名
# 2. page_num：看看想要爬取幾頁
KoreaDrama = crawl_ptt_page_auto(Board_Name ='KoreaDrama' ,
                            page_num= 1)

# 要使用utf-8-sig存檔
KoreaDrama.to_csv('KoreaDrama_test.csv',encoding = 'utf-8-sig') #存檔