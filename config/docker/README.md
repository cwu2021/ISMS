# Docker on Windows host
 - The Azure hypervisor system is based on Windows Hyper-V https://learn.microsoft.com/en-us/azure/security/fundamentals/hypervisor
 - Networking strategies for Linux on Azure https://www.admin-magazine.com/Archive/2024/83/Networking-strategies-for-Linux-on-Azure
 - appstreamcli on noble generates large wait%! ==> maybe due to lxd,incus consuming simultaneously
 - Update on retirement of TLS 1.0 and TLS 1.1 versions for Azure Services. To avoid potential service disruptions, confirm that your resources that interact with Azure services are using TLS 1.2 or later.
 - Starting 15 October 2024, we will require users to use multifactor authentication (MFA) to sign into the Azure portal, Microsoft Entra admin center, and Intune admin center.
 - with WSL: emulation on Hyper-V (WSL2). https://wiki.ubuntu.com/WSL
 - https://docs.docker.com/desktop/install/windows-install/
# CentOS or RHEL clone alternative.
 - docker run -it --name almalinux almalinux
 - docker run -it --name rockylinux rockylinux:9
 - rpm -qa grep
# Red Hat and Gen AI
 - 擁有深厚作業系統背景的紅帽，對硬體支援非常熟悉，也和雲端供應商、硬體晶片供應商有很好的合作夥伴關係。紅帽技術長Chris Wright用一句話點出紅帽的新戰略：「將底層硬體和熱門模型的軟體架構串連起來，是紅帽在整個GAI世界中的位置。」 https://ithome.com.tw/voice/169265
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
## Managing containers with MicroOS, Cockpit, and Podman
 - https://www.linux-magazine.com/Issues/2025/291/Container-Management
 - Serverless applications with OpenFaaS https://www.admin-magazine.com/Archive/2025/86/Serverless-applications-with-OpenFaaS
