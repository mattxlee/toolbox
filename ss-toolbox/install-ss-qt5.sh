#!/bin/sh
USERID=`id -u`
if [ $USERID != 0 ]; then
  echo "Use root user to run this script."
  return 1
fi

add-apt-repository ppa:hzwhuang/ss-qt5
apt-get update
apt-get install shadowsocks-qt5
