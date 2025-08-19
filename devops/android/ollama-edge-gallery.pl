=pod
- Google IO (Gemeni 2.5 everywhere), WWDC 2025
- ISS, threatmap.bitdefender maps
- Nokia dumbphones https://www.reddit.com/r/dumbphones/comments/zv24go/nokia_2660_flip/?tl=zh-hant
- AI PC vs GPU https://www.businessweekly.com.tw/Archive/Article?StrId=7012491
 - AI狐報's Post
手機直接跑大模型！Google AI Edge Gallery 讓你離線使用 Gemma3、Qwen2.5，AI陪你上山下海！
近日，Google 推出一款名為「Google AI Edge Gallery」的實驗性 Android 應用程式，讓用戶能在手機上本地部署並執行開源生成式 AI 模型，如 Gemma、Qwen2.5 等，實現完全離線、無須連網的 AI 體驗。
🔧 支援哪些模型？
目前支援的主流模型包括：
- Gemma-3n-E2B /E4B/Gemma3-1B：Google 自研的輕量級語言模型，優化於行動端，具備高速回應與多語處理能力。
- Qwen2.5-1.5B：阿里巴巴開源的中英文強化大模型，部分版本支援多模態輸入，可文字＋圖片混合輸入對話。
所有模型均來自 Hugging Face 社群，使用者可直接下載後於裝置上運行，無需雲端計算。
⚙️ 如何使用？
1. 下載應用程式：目前僅支援 Android 裝置。
2. 選擇模型與大小（B數）：越大的模型效果越強，可根據不同手機效能選擇。
3. 加載模型：首次使用需下載模型檔案，建議在 Wi-Fi 環境下進行。
4. 開始互動：支援文字生成、圖像識別、基本助理功能等，可進行離線問答、內容創作。
🧠 為什麼值得關注？
- 保護隱私：所有輸入資料僅處理於本地，不經過雲端上傳。
- 低延遲體驗：避免等待伺服器回應，使用過程更加即時自然。
- 適用無網環境：山區、飛機、地下室也能使用生成式 AI。
- 成本更低：不需訂閱 GPT 或 Gemini 之類的 API，也不需高性能筆電。
🦊 實測感想
Gemma-3n-E2B/E4B 在手機端的表現相當穩定，能快速生成自然語言回應；Qwen2.5-1.5B 則在圖文混合的任務上令人驚艷。
例如上傳手機一張教堂的相片詢問「這是什麼」，它會快速回覆：「這是一個有前衛設計的玻璃教堂，為網紅拍照打卡聖地。」
雖然模型運行期間會讓手機稍熱，但在不插電的狀況下也能持續運作數十分鐘以上，代表日常使用完全可行。
💬 一起來聊聊 👇👇👇
- 你是否嘗試過在手機上本地運行 AI 模型？體驗如何？
- 你覺得離線 AI 的最大應用場景會是什麼？
- 如果可以在手機上跑 GPT-4o，你最想拿它來幹嘛？
#AI狐報 #GoogleAI #EdgeComputing #Gemma #Qwen2.5 #本地部署AI #離線生成式AI #AI應用 #資料隱私 #隨身AI助手 #AIEdgeGallery #Google #OpenAi #ChatGPT
 - Google開源Gemma 3 270M，挑戰低資源部署
https://www.ithome.com.tw/news/170635
目前Gemma 3系列包含270M、1B、4B、12B與27B等不同規模版本。在Q4_0量化格式下，各模型的記憶體需求分別為240MB、892MB、3.4GB、8.7GB及21GB。Gemma 3 270M版本以最低記憶體門檻與最低功耗，成為目前系列中最適合部署於終端裝置的選擇。

Google也同步發布微調教學資源，包含以Hugging Face Transformers進行全模型訓練的完整流程，支援開發者針對分類、資料抽取、情緒分析等應用進行客製化。社群開發者也已透過transformers.js展示其在瀏覽器端的運行能力，證明Gemma 3 270M在Web環境中亦具備良好效能與可控性。

Gemma團隊表示，Gemma 3 270M適合處理高頻率、任務明確的應用，如情緒分析、實體辨識與查詢分類；能快速微調並部署於資源有限的裝置上，降低延遲與推論成本；模型可在本地執行，特別適合處理敏感資料；亦適用於開發多個專責任務的小型模型。

Gemma 3 270M與尚未開源的Gemma 3n同屬Google推動裝置端AI的戰略佈局。前者主打開源、可微調與跨平臺部署，後者則針對2GB RAM等極端低資源裝置優化，用於即時與離線運行。
