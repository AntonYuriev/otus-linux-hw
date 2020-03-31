#!/bin/bash

sed -i 's/^PasswordAuthentication.*$/PasswordAuthentication yes/' /etc/ssh/sshd_config 
systemctl restart sshd.service

groupadd admin
gpasswd -a vagrant admin
gpasswd -a root admin

useradd test1
chpasswd <<END
test1:qweasz
END

cp /vagrant/pam_script_auth.sh /usr/local/bin/pam_script_auth.sh
chown root:root /usr/local/bin/pam_script_auth.sh 
chmod 755 /usr/local/bin/pam_script_auth.sh

echo "auth       required     pam_exec.so /usr/local/bin/pam_script_auth.sh" >> /etc/pam.d/sshd
echo "auth       required     pam_exec.so /usr/local/bin/pam_script_auth.sh" >> /etc/pam.d/login
echo "auth       required     pam_exec.so /usr/local/bin/pam_script_auth.sh" >> /etc/pam.d/su
