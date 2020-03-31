#!/bin/bash

yum install -y \
  redhat-lsb-core \
  wget \
  rpmdevtoools \
  rpm-build \
  createrepo \
  yum-utils \
  gcc

# get and extract nginx rpm source package
wget https://nginx.org/packages/centos/7/SRPMS/nginx-1.14.1-1.el7_4.ngx.src.rpm
rpm -i nginx-1.14.1-1.el7_4.ngx.src.rpm

# get openssl
wget https://www.openssl.org/source/openssl-1.1.1f.tar.gz
tar -xvf openssl-1.1.1f.tar.gz --directory /usr/lib

# get dependencies
yum-builddep /root/rpmbuild/SPECS/nginx.spec -y

# build nginx rpm
sed -i 's|--with-debug|--with-openssl=/usr/lib/openssl-1.1.1f|' /root/rpmbuild/SPECS/nginx.spec
rpmbuild -bb /root/rpmbuild/SPECS/nginx.spec

# install and run nginx from own rpm
yum localinstall -y /root/rpmbuild/RPMS/x86_64/nginx-1.14.1-1.el7_4.ngx.x86_64.rpm
sed -i '/index  index.html index.htm;/a autoindex on;' /etc/nginx/conf.d/default.conf
systemctl enable --now nginx

# create repo
mkdir /usr/share/nginx/html/repo
cp /root/rpmbuild/RPMS/x86_64/nginx-1.14.1-1.el7_4.ngx.x86_64.rpm /usr/share/nginx/html/repo/
wget http://www.percona.com/downloads/percona-release/redhat/0.1-6/percona-release-0.1-6.noarch.rpm -O /usr/share/nginx/html/repo/percona-release-0.1-6.noarch.rpm
createrepo /usr/share/nginx/html/repo/

cat >> /etc/yum.repos.d/custom.repo << EOF
[custom]
name=custom-repo
baseurl=http://localhost/repo
gpgcheck=0
enabled=1
EOF