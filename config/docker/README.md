# Docker on Windows host
 - with WSL: emulation o Hyper-V (WSL2). https://wiki.ubuntu.com/WSL
 - https://docs.docker.com/desktop/install/windows-install/
# CentOS or RHEL clone alternative.
 - docker run -it --name almalinux almalinux
 - docker run -it --name rockylinux rockylinux:9
 - rpm -qa grep 
# How do I assign a port mapping to an existing Docker container?
 - docker stop test01
 - docker commit test01 test02
 - docker run -p 8080:8080 -td test02
<br> https://stackoverflow.com/questions/19335444/how-do-i-assign-a-port-mapping-to-an-existing-docker-container
