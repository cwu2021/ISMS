# 電腦 windows-AD複寫設定  https://random168.blogspot.com/2017/01/windows-ad.html : dcdiag指令

# 網域狀況
`repadmin /options`;
# 停用
`repadmin /options dcname +DISABLE_OUTBOUND_REPL`;
`repadmin /options dcname +DISABLE_INBOUND_REPL`;
# 啟用
`repadmin /options dcname -DISABLE_OUTBOUND_REPL`;
`repadmin /options dcname -DISABLE_INBOUND_REPL`;

#=begin endnote
=head1 ENDNOTE
 - DNS records of offline domain controller can be manually deleted to prevent further errors, e.g DC not found then netlogon failed of samba clients, if deleting DC from GUI encounters object url errors.
How to Rebuilt Global Catalog?
https://serverfault.com/questions/48964/how-to-rebuilt-global-catalog
    On the domain controller where you want the new global catalog, start the Active Directory Sites and Services snap-in. To start the snap-in, click Start, point to Programs, point to Administrative Tools, and then click Active Directory Sites and Services.
    In the console tree, double-click Sites, and then double-click sitename.
    Double-click Servers, click your domain controller, right-click NTDS Settings, and then click Properties.
    On the General tab, click to select the Global catalog check box to assign the role of global catalog to this server.
    Restart the domain controller.

與這個來源進行複寫之間的時間已超過標記存留期 - AD 複寫問題
https://gavin-tech.blogspot.com/2016/09/ad.html
  1. 開啟「登錄編輯程式」。
  2. 展開「HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NTDS\Parameters」3. 新增一組 DWORD 值，命名為「Allow Replication With Divergent and Corrupt Partner」，並將數值修改為「1」。
  4. 修改後，將 AD 重啟讓它生效。（如有多台 AD 要同步，每一台都需新增該參數。）
  5. 重啟後，再用「Active Directory 站台及服務」的立即複寫，即可正常複寫。
注：如果複寫正常後，以資安考量，記得將該參數改回「0」。
同一網域二個站台的DC複寫
https://jeffprogrammer.wordpress.com/2020/02/22/%E5%90%8C%E4%B8%80%E7%B6%B2%E5%9F%9F%E4%BA%8C%E5%80%8B%E7%AB%99%E5%8F%B0%E7%9A%84dc%E8%A4%87%E5%AF%AB/
在域控制器之間手動復寫數據時發生「目標主體名稱不正確」錯誤
https://learn.microsoft.com/zh-tw/troubleshoot/windows-server/active-directory/target-principal-name-is-incorrect-when-replicating-data
