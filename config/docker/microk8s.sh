#!/bin/bash
# kubectl for Docker Users
# https://kubernetes.io/docs/reference/kubectl/docker-cli-to-kubectl/
# https://microk8s.io/docs/getting-started
sudo snap install microk8s --classic --channel=1.21
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
su - $USER
vi ~/.bash_aliases) like this:
# alias kubectl='microk8s kubectl'
kubectl create deployment nginx --image=nginx
kubectl get pods
# https://kubernetes.io/docs/tasks/debug-application-cluster/get-shell-running-container/
kubectl exec --stdin --tty nginx-6799fc88d8-kkxf6 -- /bin/bash
kubectl get pods
# Openshift Local from the SRE book for Redhat developers 
tar xvJf crc*xz
crc setup
crc start
:'
Gemini: The simplest way to set up Kubernetes for local development and learning is by using tools designed for single-node or lightweight clusters.
1. Docker Desktop (for Windows/macOS):
Install Docker Desktop:
Download and install the latest version of Docker Desktop for your operating system.
Enable Kubernetes:
In Docker Desktop settings, navigate to the "Kubernetes" section and check the "Enable Kubernetes" box. Apply and restart. This will set up a single-node Kubernetes cluster.
2. Minikube:
Install Docker or a compatible hypervisor:
Minikube runs a local Kubernetes cluster inside a virtual machine (or Docker). Ensure you have Docker or a hypervisor like VirtualBox installed.
Install Minikube:
Follow the instructions on the Minikube website for your specific operating system to install the Minikube binary.
Start Minikube:
Open your terminal and run the command: minikube start. This will download the necessary components and launch your local Kubernetes cluster.
3. MicroK8s (for Linux, also available for Windows/macOS):
Install MicroK8s: On Linux, use Snap to install: sudo snap install microk8s --classic. For Windows/macOS, download the installers from the MicroK8s website.
Add user to group (Linux): sudo usermod -a -G microk8s $USER && newgrp microk8s
Start MicroK8s: MicroK8s typically starts automatically after installation. You can check its status with microk8s status.
These options provide a quick and easy way to get a functional Kubernetes environment for experimentation and development without the complexities of setting up a multi-node production cluster.
'
