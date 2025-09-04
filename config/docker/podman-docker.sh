#!/bin/bash
# DO080 Containers, Kubernetes and Red Hat OpenShift Technical Overview
# https://www.redhat.com/en/services/training/do080-deploying-containerized-applications-technical-overview
# redhat based, podman CLI the same as docker.
# -d for background. -it for interactive terminal.
sudo podman search rhel
sudo podman pull rhel
sudo podman images
sudo podman run rhel7:7.5 echo "Hello world"
# Docker vs Podman
# https://ithelp.ithome.com.tw/articles/10238749
# https://darumatic.com/blog/podman_introduction
# Run rootless Podman containers https://www.admin-magazine.com/Archive/2025/85/Run-rootless-Podman-containers-as-systemd-services?utm_source=AU
# Replacing Kubernetes with systemd https://blog.yaakov.online/replacing-kubernetes-with-systemd/