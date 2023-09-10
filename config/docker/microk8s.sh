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