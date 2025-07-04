'''
AI and VR
 - https://ithome.com.tw/news/169267
 - https://ithome.com.tw/news/169268
 - DramaBox
 - front end by AI
'''
# created by ChatGPT. running OK with python venv $source activity
import requests
import hashlib
import time

# 定义要监测的网页URL
url = 'https://example.com'  # 请替换为您要监测的网页URL

# 初始化一个哈希值，用于比较网页内容的变化
previous_hash = None

while True:
    try:
        # 发送GET请求获取网页内容
        response = requests.get(url)
        
        # 检查请求是否成功
        if response.status_code == 200:
            # 计算新下载内容的哈希值
            current_hash = hashlib.sha256(response.text.encode()).hexdigest()
            
            # 比较新旧哈希值
            if current_hash != previous_hash:
                print("网页已更新！")
                # 更新哈希值
                previous_hash = current_hash
            else:
                print("网页未更新。")
        else:
            print("无法获取网页内容，状态码：", response.status_code)
        
        # 每隔一段时间进行检查，例如每隔5分钟
        time.sleep(300)  # 300秒 = 5分钟
    except Exception as e:
        print("发生异常：", str(e))
        # 发生异常时继续监测
        continue
