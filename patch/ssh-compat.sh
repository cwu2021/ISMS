#!/bin/bash
# https://serverfault.com/questions/1092998/ssh-no-matching-host-key-type-found
# backward compatibility for older server < 8.8.
vi ~/.ssh/config
# PubKeyAcceptedKeyTypes=+ssh-dss
# HostKeyAlgorithms +ssh-rsa
