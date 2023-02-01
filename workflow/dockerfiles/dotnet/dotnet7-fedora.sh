#!/bin/bash
# https://fedoramagazine.org/using-dotnet-7-on-fedora/
sudo dnf install -y dotnet-sdk-7.0
dotnet new web -o HelloContainer
cd HelloContainer
sudo dnf install -y podman
podman build -t hello-container .
podman run -it -p 8080:8080 hello-container
# firefox http://localhost:8080
