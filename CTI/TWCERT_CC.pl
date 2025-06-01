=pod
TWCERT_CC 2025年4月資安電子報
 - 開源 GitHub 專案 ChatGPT 漏洞遭大規模濫用，美國為主要攻擊目標
https://www.twcert.org.tw/newepaper/cp-64-10075-d1b36-3.html
資安業者Veriti的研究員發現一個正被積極利用的伺服器端請求偽造（SSRF）漏洞，編號為CVE-2024-27564（CVSS：6.5）。此漏洞允許攻擊者利用ChatGPT(基於 PHP開源GitHub 專案)的pictureproxy.php元件（commit ID為f9f4bbc），通過「url」參數發起任意請求，繞過安全控制，控制ChatGPT請求指定資源，從而可能導致敏感資訊洩漏。
 - 不存在的套件，真實的威脅：LLM 誤導開發者走入 Slopsquatting 陷阱
https://www.twcert.org.tw/newepaper/cp-146-10088-3b6aa-3.html
近年來開發人員在程式開發過程中，時常依賴大型語言模型(LLM)生成的程式碼進行編譯與整合。然而，這些AI模型經常「幻想」不存在的程式碼和函式庫，且這類幻覺具有一定程度的重複性與規律性。資安研究員Seth Larson為此創造「slopsquatting」一詞，專指利用錯誤的函式庫名稱發動的攻擊。若攻擊者針對AI模型所「幻想」的虛假函式庫進行精心設計並發布相應的惡意套件，誘使開發人員將其載入專案中，進而引發嚴重的供應鏈攻擊與軟體安全風險。

