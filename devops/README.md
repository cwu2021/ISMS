# Best practice, clean PC for customized app. Follow items on the contract.
# Stack Overflow Trends
https://insights.stackoverflow.com/trends?tags=react-native%2Cflutter%2Cionic-framework%2Cxamarin&_ga=2.132343628.330900151.1666453939-101389269.1666453939
 - 10 GitHub repositories to advance your career as a Developer 📚
<br> https://dev.to/iarchitsharma/10-as-a-developer-egn
# Rethinking Unix-like systems
https://www.linux-magazine.com/Issues/2022/258/Distro-Walk-DragonFly-BSD <br>
https://www.linux-magazine.com/Online/Features/Make-It-One-with-Linux
# Math for Machine Learning 
https://mml-book.github.io/book/mml-book.pdf <br>
https://github.com/trekhleb/machine-learning-experiments <br>
https://github.com/topics/deeplearning-demo <br>
https://www.ibm.com/tw-en/topics/blockchain-ai
 - Eliza, a chatbot therapist https://web.njit.edu/~ronkowit/eliza.html
 - 微軟計畫以ChatGPT強化Bing搜尋功能 https://www.ithome.com.tw/news/155008
 - https://github.com/openvinotoolkit/open_model_zoo/blob/master/demos/README.md
 - Amadeus Code as music AI https://www.inside.com.tw/article/30388-AI-free-music-AmadeusCode
## A.14 Development
# Cloudflare Web3 docs
https://developers.cloudflare.com/web3/
## IFPS Gateway
Provides a read-only, HTTP-accessible interface to the Interplanetary File System (IPFS).​​
### IPFS Demo
https://github.com/LorranSutter/IPFS-demo
## Ethereum Gateway
Gives you read and write access to the Ethereum network without installing any software on your computer.
# Relayd and Httpd Mastery
<i>https://www.amazon.com/Relayd-Httpd-Mastery-Michael-Lucas/dp/1642350087</i><br>
httpd as web server proper partitioned for files in chroot and sql, while relayd, pf, CARP as load balancers/failover. Good design sample to check which features are included or not, e.g. Perlrex.
# FCM push notification delay
<i>https://gist.github.com/gdeglin/98aeda28035b45cef04bb6c2cb41a4aa</i><br>
FCM/GCM Notifications require a device to maintain an open connection to Google's servers. Some home and commerical wifi routers interfere with this connection. Some mobile carriers may interfere with this too, but this is rare. If a router terminates this connection, the device may wait 15 minutes before reconnecting and receiving pending notifications.
<i>https://stackoverflow.com/questions/38725622/android-delay-in-receiving-message-in-fcmonmessagereceived</i><br>
To make sure that the connection remains active, Android will send a heartbeat every 28 minutes on mobile connection and every 15 minutes on WiFi. If the heartbeat failed, the connection has been terminated, and FCM will re-establish it and attempt to retrieve any pending push notifications. The higher the heartbeat interval, the less battery consumed and the less times the device has to be woken up from sleep.
