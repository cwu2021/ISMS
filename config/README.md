# 從ISO 27002新版草案變化看國際資安管理標準新走向
https://www.ithome.com.tw/tech/147261 <br>
https://www.ithome.com.tw/news/147193
## 新增11項控制要求，自動化工具執行成關鍵
8.9	組態管理 8.9　	Configuration management
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

