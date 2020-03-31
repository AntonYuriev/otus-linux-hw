#!/bin/bash

yum install -y httpd

# add template httpd.service
cp /usr/lib/systemd/system/httpd.service /usr/lib/systemd/system/httpd@.service
sed -i 's/sysconfig\/httpd/sysconfig\/httpd-%I/g' /usr/lib/systemd/system/httpd@.service

# create sysconfig files
cp /etc/sysconfig/httpd /etc/sysconfig/httpd-first
cp /etc/sysconfig/httpd /etc/sysconfig/httpd-second
sed -i 's/#OPTIONS=/OPTIONS=-f conf\/httpd-first.conf/g' /etc/sysconfig/httpd-first
sed -i 's/#OPTIONS=/OPTIONS=-f conf\/httpd-second.conf/g' /etc/sysconfig/httpd-second

# create config files
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd-first.conf
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd-second.conf
sed -i 's/Listen 80/Listen 8080/g' /etc/httpd/conf/httpd-second.conf
echo "PidFile /var/run/httpd-second.pid" >> /etc/httpd/conf/httpd-second.conf

systemctl enable --now httpd@first
systemctl enable --now httpd@second
