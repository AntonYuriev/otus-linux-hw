#!/bin/bash

cp /vagrant/service3/exit_code_143.sh /usr/bin/exit_code_143.sh
cp /vagrant/service3/hw.service /etc/systemd/system/hw.service

systemctl enable --now hw.service