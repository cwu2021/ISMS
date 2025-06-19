# 從ISO 27002新版草案變化看國際資安管理標準新走向
https://www.ithome.com.tw/tech/147261 <br>
https://www.ithome.com.tw/news/147193
## 新增11項控制要求，自動化工具執行成關鍵
8.9	組態管理 8.9　	Configuration management
## omd config of Nagios
 - omd stop/start when heavy I/O occurs.
 - reboot then omd start when lots check errors occur.
## CLIENT AND SERVER SETTINGS FOR CONFIGURATION MANAGEMENT
An important part of Red Hat Satellite 6’s configuration process is making sure the Puppet clients (called Puppet agents) can communicate with the Puppet Server (called Puppet master) on either the internal Satellite Capsule or an external Satellite Capsule. <br>
https://access.redhat.com/documentation/en-us/red_hat_satellite/6.4/html/puppet_guide/chap-red_hat_satellite-puppet_guide-client_and_server_settings_for_configuration_management
### The Puppet agent service defaults to run every 30 minutes.
 - https://puppet.com/docs/puppet/7/services_agent_unix.html
 - Run Puppet agent as a cron job when running as a non-root user. 
### Puppet from gems (versions can be chosen)
https://rubygems.org/gems/puppet/versions/4.3.2?locale=zh-TW <br>
$ sudo apt install rubygems <br>
$ sudo gem install puppet -v 4.3.2 <br>
$ sudo gem query --local <br>
http://guides.rubygems.org/command-reference/#gem-list
### Deploy our own software using Puppet? - Server Fault
 - https://serverfault.com/questions/215545/deploy-our-own-software-using-puppet
 - Best to conform config of prebuilt packages.
 - https://www.linuxjournal.com/article/10046
 - Attack Service Management Tools https://www.admin-magazine.com/Archive/2025/85/ASM-tools-and-strategies-for-threat-management
 - The GNU Stow tool in combination with Ansible can help you manage configuration files. https://www.admin-magazine.com/Archive/2025/86/Centrally-manage-configuration-files
### Installing Ruby 1.8.7 in Ubuntu 20.04 (Focal Fossa)
 - https://learn.bitcontroltech.com/2021/05/installing-ruby-1-8-7-in-ubuntu-20-04-focal-fossa/
 - https://wiki.ubuntu.com/Releases
 - JRuby 1.4.0 Released https://www.jruby.org/2009/11/02/jruby-1-4-0.html
 - Ubuntu package for RVM https://github.com/rvm/ubuntu_rvm
 - RVM is not a function; bash --login https://stackoverflow.com/questions/23963018/rvm-is-not-a-function-selecting-rubies-with-rvm-use-will-not-work
 - Windows downloads of rubyinstaller archive https://rubyinstaller.org/downloads/
### Ruby Gem to easily create Nagios Plugins.
 - https://github.com/jhstatewide/ruby-nagios-plugin
 - https://github.com/ripienaar/ruby-nagios
### Ruby library to monitor system resources, and Rails!
 - https://stackoverflow.com/questions/1346578/ruby-library-to-monitor-system-resources
 - http://rubyforge.org/projects/sysutils
 - rake, rails are popular gems!
 - https://github.com/piotrmurach/awesome-ruby-cli-apps
<br>$ sudo apt install rails
(cause rails new myapp from gems may throwout errors)
 - https://ubuntu.com/server/docs/programming-ruby-on-rails 
 - https://travis-ci.community/t/mkmf-rb-cant-find-header-files-for-ruby-at-usr-lib-ruby-include-ruby-h-building-the-travis-gem/4527
 - https://github.com/rails/rails
 - https://www.spreered.com/ask-job-line-bot-2-ruby-crawler/
 - https://github.com/CarolHsu/rumor-checker
## Claw Man 可以施展甩爪跟甩打的夾娃娃機
https://www.mobile01.com/topicdetail.php?f=334&t=6759872
### automation-as-code with Ansible
https://www.admin-magazine.com/Archive/2024/84/Explore-automation-as-code-with-Ansible

## luminance config: W = V x A
以「亮度」來說，照明效果與空間高度及坪數相關，例如客廳、臥室高度多為280~300公分，每坪需要900lm(流明，亮度單位)的燈具才能提供足夠亮度。 柳敦浩說，像有些人家裡挑高，就須適當增加亮度，反之則可選擇較低亮度，例如浴室天花板較低矮，每坪只需700lm亮度的燈具即可。2019年11月7日
 - 六分（standard) vs 三分（shorter)鉸鏈 
### Drier walts 
750W-1000W-1200W <br>
$350-390 --> or $600!
### power adapter debugging
 - eg. 19V/3.42A @--(-@ of +- in/out. smaller amp rewuires battery aid.
 - two/three pin cable from monitor,camera,mac.
### refrigerator checks
如果有冰箱型號，可以查查集水盤在哪
### 資訊設備的耗電量與費用 » 科一電腦
 - 6-9A *110V
https://cck.tw/electricity-used-by-network-equipment
 - SUNBOX 慧光 PDU 8孔15安培機架電源排插 - PChome 24h購物
https://24h.pchome.com.tw/prod/DCAX8I-A9006FTHK
 - Going Green » Linux Magazine
http://www.linux-magazine.com/Issues/2023/270/Green-Coding-Initiatives
### cable STB debugging
 - Set top box indicators
yellow lights of PWR (power?), DS (down streaming?), US (up streaming?), ONLINE
 - normal: all solid lights
 - abnormal: solid PWR + blinking DS. 
### Thus for Random Reboot PC issue:
 - start with the PSU: stable and enough walts.
 - overheating 
 - kernel panic related with RAM or storage
 - other HW components
<br> https://community.spiceworks.com/topic/2488248-random-reboot-pc-issue
### PC Randomly Waking Up From Sleep
https://www.pcmag.com/how-to/stop-your-computer-from-randomly-waking-up-from-sleep-mode <br>
 - power surge / voltage spike
 - network activity
 - 抬起喚醒/距離感應器 https://www.jyes.com.tw/news.php?act=view&id=4286
#### Backgrounded IOS app wakeup by Push notification and exchange data
https://forums.developer.apple.com/forums/thread/690942
