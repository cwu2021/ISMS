@echo off
REM Window+R for cmd on Windows 10 https://www.computerhope.com/issues/ch001041.htm
start music.mp3
REM Groove keyboard shortcuts F7,F8,F9 https://support.microsoft.com/en-us/windows/keyboard-shortcuts-in-apps-139014e7-177b-d1f3-eb2e-7298b2599a34#bkmk_groove
REM how can I use taskkill to close out groove music
Taskkill /IM music.UI.exe /F
REM vlc for more supported formats: ctrl-up/down,f/esc https://wiki.videolan.org/QtHotkeys/
c:\program files\videolan\vlc\vlc.exe --fullscreen video.rmvb
taskkill /im vlc.exe /f
REM convert/save to H.264/AAC by selecting H.264 Video profile then choose aac as Audio.
