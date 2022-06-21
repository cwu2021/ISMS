#!/bin/bash
# simple tomcat running sample (with mysqld backend) .
/usr/lib/jvm/default-java/bin/java -Djava.util.logging.config.file=/var/lib/tomcat6/conf/logging.properties -Djava.awt.headless=true -Xmx128m -XX:+UseConcMarkSweepGC -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager -Djava.endorsed.dirs=/usr/share/tomcat6/endorsed -classpath /usr/share/tomcat6/bin/bootstrap.jar -Dcatalina.base=/var/lib/tomcat6 -Dcatalina.home=/usr/share/tomcat6 -Djava.io.tmpdir=/tmp/tomcat6-tomcat6-tmp org.apache.catalina.startup.Bootstrap start
