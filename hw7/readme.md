# Задание 1

Написать сервис, который будет раз в 30 секунд мониторить лог на предмет наличия ключевого слова. Файл и слово должны задаваться в /etc/sysconfig

Результат выполнения может быть развёрнут с использованием Vagrant. Подготовка виртуальной машины в файле provision_watchlog.sh

/watchlog/watchlog.cfg -- файл с конфигурацией для сервиса, на вирутальной машине копируется в /etc/sysconfig
/watchlog/watchlog.sh -- сам скрипт
/watchlog/watchlog.service -- юнит для сервиса
/watchlog/watchlog.timer -- юнит для таймера

После запуска виртуальной машины, результат можно проверить запуском: tail -f /var/log/messages

```
Mar 30 16:35:06 10 systemd: Starting My watchlog service...
Mar 30 16:35:07 10 root: Mon Mar 30 16:35:07 UTC 2020: I found word, Master!
Mar 30 16:35:07 10 systemd: Started My watchlog service.
```

# Задание 2
