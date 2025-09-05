#(run in lxc)
sudo lxd init
lxc launch ubuntu:24.04 ollama
lxc shell ollama
# https://ithelp.ithome.com.tw/articles/10348913
# https://www.server-world.info/en/note?os=Ubuntu_24.04&p=ollama&f=1
curl -fsSL https://ollama.com/install.sh | sh
ollama pull gemma:2b
ollama run gemma:2b
# Note: Google ML learning doc reminds that LLMs hallucinate with all kinds of bias! (Jan 14, 2025) : training module of from online 15hr course.
# NCSA Launches DeltaAI Advanced Computing System https://www.admin-magazine.com/News/NCSA-Launches-DeltaAI-Advanced-Computing-System
# Cloudera Launches RAG Studio https://www.admin-magazine.com/News/Cloudera-Launches-RAG-Studio
# supremacy AI: ChatGPT, DeepMind 2024 Nobel mission shift
# Nexus - A Brief History of Information Network
# LLM can summarize 15-page (8000 words) paper in 10 minutes on a i5 machine. The response is basically correct, and can be scored as 70/100.
# Vulcan Attack：AI 大型語言模型（LLM）資安檢測服務：協助企業在AI應用的早期階段，透過識別漏洞，提供自動化檢測、辨識AI風險，有效識別並修補潛在漏洞，為企業AI應用築起堅固的防線。
# 惡意AI模型潛伏Hugging Face https://www.twcert.org.tw/newepaper/cp-146-10030-5e683-3.html
# 什麼是主權 AI？https://www.oracle.com/tw/artificial-intelligence/sovereign-ai/
# Kick-start your AI projects with Kubeflow https://www.admin-magazine.com/Archive/2025/85/Kick-start-your-AI-projects-with-Kubeflow?utm_source=AU
# Amazon 最新大語言模型 Amazon Nova 以及 AI Agent with AWS 的實例解說
## AI agent: LLM + memory + planning + tools/action
# DigitalOcean launched official MCP Server for App Platform, making it easier than ever to deploy and manage your applications. 
:'
AI agents 正在重塑我們建構與使用商務應用程式的方式。您將深入了解如何透過 Power Apps發揮 AI agents 的生產力潛能——從運用「氛圍編碼」（vibe coding）打造客製化體驗，到透過全新的 agent feed 監管 autonomous agents。

使用 Generative pages ，並透過自然語言打造客製化介面
透過全新agent feed實現agents 監管
運用內建智慧功能，自動化處理表單填寫、資料探索等任務
'