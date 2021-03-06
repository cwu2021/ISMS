## SDN (control/data) -> NFV -> vxlan.
## similar as PaaS -> docker
### The Community Distribution of Kubernetes that powers Red Hat OpenShift
https://www.okd.io/guides/aws-ipi/ <br>
This describes the resources used by OpenShift after performing an installation using the default options for the installer.
#### Infrastructure
##### Compute
- 3 control plane nodes
  - instance type m4.xlarge, or m5.xlarge if previous not available in the region
- 3 compute nodes
  - instance type m4.large, or m5.large if previous not available in the region
##### Networking
- 1 virtual private cloud
- 1 public subnet per availability zone in the region
- 1 private subnet per availability zone in the region
- 1 NAT gateway per availability zone
- 1 elastic IP address per NAT gateway
- 3 elastic load balancers
- 1 external network load balancer for the master API server
- 1 internal network load balancer for the master API server
- 1 classic load balancer for the router
- 21 elastic network interfaces, plus 1 interface per availability zone
- 1 virtual private cloud gateway
- 10 distinct security groups

# dockerfiles
https://ithelp.ithome.com.tw/articles/10191016?sc=hot <br>
https://github.com/wsargent/docker-cheat-sheet

一. 建立 Dockerfile
建立寫 Dockerfile 會用到的資料夾，指令如下

$ mkdir docker-test
$ cd docker-test
下載JDK 的安裝檔放在 docker-test資料夾裡，使用的版本是 jdk-8u152

撰寫Dockerfile

$ vi Dockerfile
Dockerfile 的內容如下

FROM centos:7
MAINTAINER jack

RUN yum install -y wget

RUN cd /

ADD jdk-8u152-linux-x64.tar.gz /

RUN wget http://apache.stu.edu.tw/tomcat/tomcat-7/v7.0.82/bin/apache-tomcat-7.0.82.tar.gz
RUN tar zxvf apache-tomcat-7.0.82.tar.gz

ENV JAVA_HOME=/jdk1.8.0_152
ENV PATH=$PATH:/jdk1.8.0_152/bin
CMD ["/apache-tomcat-7.0.82/bin/catalina.sh", "run"]
以上的 Dockerfile 主要有用到的指令說明如下
FROM： 使用到的 Docker Image 名稱，今天使用 CentOS

MAINTAINER： 用來說明，撰寫和維護這個 Dockerfile 的人是誰，也可以給 E-mail的資訊

RUN： RUN 指令後面放 Linux 指令，用來執行安裝和設定這個 Image 需要的東西

ADD： 把 Local 的檔案複製到 Image 裡，如果是 tar.gz 檔複製進去 Image 時會順便自動解壓縮。Dockerfile 另外還有一個複製檔案的指令 COPY 未來還會再介紹

ENV： 用來設定環境變數

CMD： 在指行 docker run 的指令時會直接呼叫開啟 Tomcat Service

撰寫完 Dockerfile 之後資料夾的結構如下圖
https://ithelp.ithome.com.tw/upload/images/20171208/20103456l7crq2otz2.png
二. Build Docker Image
預設在和 Dockerfile 檔案同層的資料夾底下輸入， docker build 指令，如下
$ docker build -t mytomcat . --no-cache
使用 --no-cache 的主要原因，是避免在 Build Docker image 時被 cache 住，而造成沒有 build 到修改過的 Dockerfile。

Build 完的結果如下圖：
https://ithelp.ithome.com.tw/upload/images/20171208/20103456dpjWol6ILh.png

Build 完 Docker Image 之後，使用 docker images 指令查看是否有 build 成功如下圖
https://ithelp.ithome.com.tw/upload/images/20171208/20103456EE1uDr0ky4.png
三. 在 Build 完 Docker Image 之後就可以執行 Docker Container，這時Tomcat 的 Service 也會跟者被執行起來，指令如下
$ docker run mytomcat
Tomcat Service 會被執行起來的主要原因是在 Dockerfile 裡面有寫 CMD 指令，呼叫啟動 Tomcat Service
