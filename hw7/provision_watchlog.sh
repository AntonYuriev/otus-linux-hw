#!/bin/bash

cp /vagrant/watchlog/watchlog.sh /usr/bin/watchlog.sh
cp /vagrant/watchlog/watchlog.cfg /etc/sysconfig/watchlog
cp /vagrant/watchlog/watchlog.service /etc/systemd/system/watchlog.service
cp /vagrant/watchlog/watchlog.timer /etc/systemd/system/watchlog.timer

systemctl enable --now watchlog.timer
