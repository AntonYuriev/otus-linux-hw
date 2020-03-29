#!/bin/bash

yum install -y mailx
mkfifo /var/spool/postfix/public/pickup
service postfix restart