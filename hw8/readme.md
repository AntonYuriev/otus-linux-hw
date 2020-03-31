# Размещаем свой RPM в своем репозитории

- создать свой RPM (nginx с поддержкой openssl)
- создать свой репо и разместить там свой RPM

Результат выполнения может быть развёрнут с использованием Vagrant. Подготовка виртуальной машины в файле provision.sh

После запуска виртуальной машины можно проверить:

```
[root@hw8 ~]# ll /root/rpmbuild/RPMS/x86_64/
total 4388
-rw-r--r--. 1 root root 2002344 мар 31 13:34 nginx-1.14.1-1.el7_4.ngx.x86_64.rpm
-rw-r--r--. 1 root root 2488556 мар 31 13:34 nginx-debuginfo-1.14.1-1.el7_4.ngx.x86_64.rpm
```

```
[root@hw8 ~]#  yum repolist enabled | grep custom-repo
custom                              custom-repo                                2
```

```
[root@hw8 ~]#  systemctl status nginx
● nginx.service - nginx - high performance web server
   Loaded: loaded (/usr/lib/systemd/system/nginx.service; enabled; vendor preset: disabled)
   Active: active (running) since Вт 2020-03-31 13:34:56 UTC; 5min ago
     Docs: http://nginx.org/en/docs/
  Process: 20756 ExecStart=/usr/sbin/nginx -c /etc/nginx/nginx.conf (code=exited, status=0/SUCCESS)
 Main PID: 20757 (nginx)
   CGroup: /system.slice/nginx.service
           ├─20757 nginx: master process /usr/sbin/nginx -c /etc/nginx/nginx.conf
           └─20758 nginx: worker process

мар 31 13:34:56 hw8 systemd[1]: Starting nginx - high performance web server...
мар 31 13:34:56 hw8 systemd[1]: PID file /var/run/nginx.pid not readable (yet?) after start.
мар 31 13:34:56 hw8 systemd[1]: Started nginx - high performance web server.
```