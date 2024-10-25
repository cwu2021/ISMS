# Docker on Windows host
 - The Azure hypervisor system is based on Windows Hyper-V https://learn.microsoft.com/en-us/azure/security/fundamentals/hypervisor
 - Update on retirement of TLS 1.0 and TLS 1.1 versions for Azure Services. To avoid potential service disruptions, confirm that your resources that interact with Azure services are using TLS 1.2 or later.
 - with WSL: emulation on Hyper-V (WSL2). https://wiki.ubuntu.com/WSL
 - https://docs.docker.com/desktop/install/windows-install/
# CentOS or RHEL clone alternative.
 - docker run -it --name almalinux almalinux
 - docker run -it --name rockylinux rockylinux:9
 - rpm -qa grep 
# Gentoo with portage 
 - docker run -it --name gentoo gentoo/stage3 /bin/bash
<br> https://wiki.gentoo.org/wiki/Project:Docker
 - emerge --sync
<br> https://wiki.gentoo.org/wiki/Project:Portage/Sync
 - emerge --search pdf
 - emerge ffmpeg
<br> https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Working#Installing_software
# How do I assign a port mapping to an existing Docker container?
 - docker stop test01
 - docker commit test01 test02
 - docker run -p 8080:8080 -td test02
<br> https://stackoverflow.com/questions/19335444/how-do-i-assign-a-port-mapping-to-an-existing-docker-container
# Docker and Kubernetes: How They Work Together
https://www.docker.com/blog/docker-and-kubernetes/