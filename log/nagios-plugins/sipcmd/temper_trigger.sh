#!/bin/bash

usernum=
userpass=
sipserver=
sipport=

declare -i temp=`/your/temper/code.sh`
#if [ $temp -gt 15 ];then
# modified due to high humidity after typhoon, Aug 10, 2021.
# if [ $temp -gt 25 ];then
# modified due to high temperature this year , Jul 28, 2022.
if [ $temp -gt 26 ];then
sipcmd -u $usernum -c $userpass -P sip -w $sipserver:$sipport -x "c5551;ws3000;vsiptest.wav;h"
fi
