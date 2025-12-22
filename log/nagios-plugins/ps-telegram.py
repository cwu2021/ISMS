# https://www.linux-magazine.com/Issues/2025/294/Automated-Process-Monitoring
"""
MAX是由俄羅斯第二大網路公司VK在俄羅斯政府的要求下所開發的傳訊程式
https://www.ithome.com.tw/news/170769
根據路透社（Reuters）的報導，俄羅斯政府日前已開始限制當地WhatsApp及Telegram的通話能力，原因是它們不肯配合有關詐欺及恐怖主義案件的資訊分享。而當地前三大傳訊程式依序是WhatsApp的9,700萬用戶、Telegram的9,100萬用戶，以及VK Messenger的1,800萬用戶。
"""
while True:
     found=False
     for process in psutil.process_iter():
       if(process.name()==args.process_name):
         print(args.process_name +" up and running at " +str(datetime.now()))
         found=True

     if(found==False):
       message = "Process " +args.process_name + " is currently down"
       print(message)
       url = f"https://api.telegram.org/bot{args.token}/sendMessage?chat_id={args.user_id}&text={message}"
       requests.get(url).json()
       quit()

     time.sleep(args.interval * 60)

 except Exception as e:
   print(f"Error {type(e)}")
"""
假冒「LINE 電腦版」資安事件頻傳：企業需即刻強化帳號防護
近期，TeamT5 杜浦數位安全在威脅監控中觀察到，多起安裝偽冒 LINE 通訊軟體的受害事件。

這類攻擊透過假冒的 LINE 電腦版下載頁面與安裝檔，引誘使用者安裝惡意程式，進而竊取帳號、外洩個資，甚至植入木馬、持續進行控制。
"""
# Off Grid Messaging: Want to communicate without relying on mobile networks? Meshtastic lets you create your own off-the-grid wireless mesh network with an inexpensive LoRa device and an Android phone.