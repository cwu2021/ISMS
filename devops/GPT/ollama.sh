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