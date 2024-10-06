# Best practice, clean PC for customized app. Follow items on the contract.
# Stack Overflow Trends
https://insights.stackoverflow.com/trends?tags=react-native%2Cflutter%2Cionic-framework%2Cxamarin&_ga=2.132343628.330900151.1666453939-101389269.1666453939
 - 10 GitHub repositories to advance your career as a Developer 📚
<br> https://dev.to/iarchitsharma/10-as-a-developer-egn
 - 瀑布式(Waterfall Model) & 敏捷式(Agile Model) https://ithelp.ithome.com.tw/m/articles/10281464?sc=iThomeR
# Rethinking Unix-like systems
https://www.linux-magazine.com/Issues/2022/258/Distro-Walk-DragonFly-BSD <br>
https://www.linux-magazine.com/Online/Features/Make-It-One-with-Linux
 - X Window Systen, Xenix, Minix, and UNIX-HATERS 
 <br> https://web.mit.edu/~simsong/www/ugh.pdf
 <br> https://wiki.minix3.org/doku.php?id=www:documentation:read-more
 <br> https://www.pcjs.org/software/pcx86/sys/unix/ibm/xenix/1.0/
 - Google Chrome uses it's own custom UI stack called Aura
 <br> https://stackoverflow.com/questions/874609/which-gui-library-does-google-chrome-use
 <br> https://www.chromium.org/developers/design-documents/aura/aura-overview/
 - Active Gopher servers https://evert.meulie.net/2011/12/01/active-gopher-servers/
# Math for Machine Learning 
https://mml-book.github.io/book/mml-book.pdf <br>
https://github.com/trekhleb/machine-learning-experiments <br>
https://github.com/topics/deeplearning-demo <br>
https://www.ibm.com/tw-en/topics/blockchain-ai
 - Eliza, a chatbot therapist https://web.njit.edu/~ronkowit/eliza.html
 - 微軟計畫以ChatGPT強化Bing搜尋功能 https://www.ithome.com.tw/news/155008
 - 微軟開源 Deep Speed Chat，解鎖千億級ChatGPT https://buzzorange.com/techorange/2023/04/13/deep-speed-chat/
 - https://github.com/openvinotoolkit/open_model_zoo/blob/master/demos/README.md
 - Amadeus Code as music AI https://www.inside.com.tw/article/30388-AI-free-music-AmadeusCode
 - https://mpost.io/top-5-ai-musicaudio-generators-to-create-royalty-free-tracks/
 - Google launches ChatGPT rival called Bard - BBC News https://www.bbc.com/news/technology-64546299
 - ChatGPT prompt curation https://github.com/f/awesome-chatgpt-prompts
 - 格斗之王！AI写出来的AI竟然这么强！https://youtu.be/B7bYZ5ZFbl0
 - 災防數據與機器學習整合應用開發 https://www.itdr.tw/results/2357913791
 - Recraft 直接生成向量圖的 AI！簡報插圖不用圖庫秒做完 https://youtu.be/YafXjy06cSw
 - Mathematics Behind Neural Networks https://towardsdatascience.com/introduction-to-math-behind-neural-networks-e8b60dbbdeba
 - 為您的企業建立多語言的AI聊天機器人 https://mailchi.mp/6059e712b104/newsletter2023-591076?e=54ed525044
 - AIOps, lots of Ops...
https://www.admin-magazine.com/Archive/2024/81/Artificial-admin
 - Microsoft 365 Copilot可被濫用進行釣魚攻擊 | iThome https://www.ithome.com.tw/news/164426

# CAD和EDA工程師基本須知
關於CAD(Computer Aided Design)和EDA(Electronic Design Automation)工程師職缺，兩者可以說是一樣的東西。 主要是針對IC設計產業做輔助設計的程式開發，職缺相關科系為電機、電子、資工為主。 
 -  Perl for IC Design https://github.com/markemer/EDA-Cadence
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
# Relational, NoSQL, Mongo vs Raven.
Raven DB 是 c#寫的nosql，不是最常見的mongodb。小規模是夠用了，mysql這種relational db小規模用了也沒問題，nosql的吞吐能力不會比relational db差。但nosql門檻確實不同於relational db。 https://www.taashee.com/revolutionizing-data-management-7-cutting-edge-features-of-ravendb-you-cant-ignore/ ranking score的比較：mongodb得分400＋，而ravendb在4左右，Popularity差距是很大。當然很少人用不代表不厲害，有些技術用的人少是因為難用但很厲害。 Raven DB只能說是不普及，有維護隱憂。 https://db-engines.com/en/ranking_trend/system/RavenDB
# FCM push notification delay
 - Push Notifications Statistics (2023) https://www.businessofapps.com/marketplace/push-notifications/research/push-notifications-statistics/ iOS push notification reaction rate – 3.4%
<br><i>https://gist.github.com/gdeglin/98aeda28035b45cef04bb6c2cb41a4aa</i><br>
FCM/GCM Notifications require a device to maintain an open connection to Google's servers. Some home and commerical wifi routers interfere with this connection. Some mobile carriers may interfere with this too, but this is rare. If a router terminates this connection, the device may wait 15 minutes before reconnecting and receiving pending notifications.
<i>https://stackoverflow.com/questions/38725622/android-delay-in-receiving-message-in-fcmonmessagereceived</i><br>
To make sure that the connection remains active, Android will send a heartbeat every 28 minutes on mobile connection and every 15 minutes on WiFi. If the heartbeat failed, the connection has been terminated, and FCM will re-establish it and attempt to retrieve any pending push notifications. The higher the heartbeat interval, the less battery consumed and the less times the device has to be woken up from sleep.
