#!/bin/ksh
# latest version of Oracle Java without license fee is 8u202. AdoptOpenJDK can be used for later versions.
# https://stackoverflow.com/questions/55930547/openjdk-and-java-webstart
# https://www.wowza.com/docs/manually-install-and-troubleshoot-java-on-wowza-streaming-engine
# https://adoptopenjdk.net/migration.html
doas pkg_add -v jdk
# Update candidates: quirks-4.53 -> quirks-4.53
# quirks-4.53 signed on 2021-09-28T09:08:28Z
# Ambiguous: choose package for jdk
# a     0: <None>
#       1: jdk-1.8.0.302.b08.1p0v0
#       2: jdk-11.0.12.7.1v0
#       3: jdk-16.0.2.7.1v0
# jdk-1.8.0.302.b08.1p0v0: ok
# New and changed readme(s):
#       /usr/local/share/doc/pkg-readmes/jdk-1.8.0
# --- +jdk-1.8.0.302.b08.1p0v0 -------------------
# You may wish to add /usr/local/jdk-1.8.0/man to /etc/man.conf
java -jar cal.jar
# cal utility based on newer java.
# https://github.com/frossm/cal
java -XshowSettings:system -version
# cgroups v2 support on Linux 
# https://developers.redhat.com/articles/2022/04/19/java-17-whats-new-openjdks-container-awareness#why_container_awareness_is_important
# Console Java Errors | Proxmox Support Forum
# https://forum.proxmox.com/threads/console-java-errors.14777/
# vncterm , not compatible with Firefox 51/jre 8u181 32bit.
# https://www.oracle.com/webfolder/s/digest/8u181checksum.html
# https://ftp.mozilla.org/pub/firefox/releases/51.0.1/win32/en-US/
# https://support.mozilla.org/en-US/questions/1281896
# https://www.java.com/zh-TW/download/help/enable_browser.html
# https://www.java.com/zh-TW/download/help/firefox_java.html
