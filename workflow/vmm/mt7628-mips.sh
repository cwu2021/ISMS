# mips to riscv after 2021 https://en.wikipedia.org/wiki/MIPS_architecture
# Apple Airport is netbsd on MIPS; Darwin userland also runs netbsd.
# https://zh.wikipedia.org/zh-tw/AirPort_Express
# Apple TV spec: 
:'A1427 或修正版 A 為 A1469
推出年份：2012
顏色：黑色
HDMI（720p 或 1080p）
10/100BASE-T 乙太網路
Wi-Fi（802.11a/b/g/n/）
光纖音訊
紅外線接收器
Micro-USB（適用於維修與支援）
Apple Remote（鋁殼）
請參閱 Apple TV（第 3 代）技術規格。

華碩集團品牌 https://24h.pchome.com.tw/prod/DMAAA0-A900H4AN9
'
# Freebsd supports MIPS until 13.
# https://openwrt.org/docs/techref/hardware/soc/soc.mediatek
uname -a
cat /proc/cpuinfo
# https://stackoverflow.com/questions/947897/block-comments-in-a-shell-script
:'
Linux (none) 2.6.36 #1 Thu Apr 18 10:37:52 CST 2019 mips GNU/Linux
system type		: MT7628
processor		: 0
cpu model		: MIPS 24Kc V5.5
BogoMIPS		: 382.97
wait instruction	: yes
microsecond timers	: yes
tlb_entries		: 32
extra interrupt vector	: yes
hardware watchpoint	: yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
ASEs implemented	: mips16 dsp
shadow register sets	: 1
core			: 0
VCED exceptions		: not available
VCEI exceptions		: not available
'
