#!/bin/bash
# https://www.linuxandubuntu.com/home/migrate-docker-containers-to-new-server
docker ps
docker commit 434ccd9f15a4 apache-image
docker save apache-image > apache-image.tar
scp apache-image.tar $new_server
docker load < image-name.tar
docker run -d --name container_name -p 80:80 image-name
