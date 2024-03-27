## Crouching Table, Hidden Network
"You were enlightened?" <br>
"No, I didn't feel the bliss of enlightenment. Instead...I was surrounded by an endless sorrow." ~ the effects of bad data (...or something similar...)
## sc: the Venerable Spreadsheet Calculator | Linux Journal
https://www.linuxjournal.com/article/10699
## Excel 必懂公式 5. COUNTIF 用法
https://www.managertoday.com.tw/articles/view/51429
<br> https://www.calculator.net/sample-size-calculator.html
## HowTo Install Redmine on Ubuntu step by step
https://www.rosehosting.com/blog/install-redmine-on-ubuntu-20-04/
<br> https://www.redmine.org/projects/redmine/wiki/howto_install_redmine_on_ubuntu_step_by_step
## vtiger CRM on Ubuntu 22.04 with email notification 
https://www.rosehosting.com/blog/how-to-install-vtiger-crm-on-ubuntu-22-04/
 - php-gd required for exporting PDF. tcpdf/tool/addfont to replace default freeserif in *php with other CJK fonts.
 - Header..php and SalesOrder..php, replace all serif with droid
<br> https://blog.tiger-workshop.com/android-tcpdf-missing-chinese-english-fonts/
<br> https://books.bod.idv.tw/2012/03/phptcpdfpdf.html
<br> https://stackoverflow.com/questions/8861260/specific-fonts-in-tcpdf-pdf
 - [2/11 at 17:00] [08/Feb/2024:02:46:34 +0000] "POST /index.php HTTP/1.1" 500 5 "http://vtiger.example.com/index.php?module=Invoice&view=Detail&record=15&mode=showDetailViewByMode&requestMode=full&tab_label=Invoice%20Details&app=MARKETING" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"
 - [2/13 at 18:32] 從source code 查這個範圍有點大, 建議看看你們用的這套有沒有什麼error log 可以開來看看
 - [2/13 at 22:34] Solved: missing GD lib. https://discussions.vtiger.com/discussion/191167/invoice-export-to-pdf-http-error-500
 - [2/14 at 18:24] note: 後續還有pdf中文字型問題。我處理的方法是：先google查出vtiger的export to pdf採用tcpdf這個class，它指定字型是SetFont()這個方法。將支援CJK的TTF字型addfont加入tcpdf後，順著export to pdf的url找出對應的php檔案，沿著 required 一路追溯所有相關的php檔案，替換SetFont()字型直到正確顯示中文為止。這樣縮小範圍後的查找時間大約是數小時。vtiger的字型沒做模組化管理，全是hard coded在各種功能之下，得這樣逐個修改php才行。FYI.
 - noauth smtp works. Adding SPF and DKIM records to authorize our domain's Vtiger email server.
<br> https://help.vtiger.com/article/146957259-Automate-Outgoing-Emails-in-Email-Settings?catid=2&subid=18
<br> https://discussions.vtiger.com/discussion/182689/the-scary-mail-could-not-be-sent-to-the-admin-user-please-check-the-admin-emailid-server-settings
<br> https://www.vtexperts.com/mail-could-not-be-sent-to-the-admin-user-please-check-the-admin-emailidserver-settings/
 - Render blocking of js detected by Chrome developer tools, verified by lynx. RSS loaded well via lynx with full internet access. Slow log of php-fm showed 3 php files related with ExtensionStore >10s each.

## Ubuntu: Install SQL Server on Linux - SQL Server | Microsoft Learn
https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-ubuntu
