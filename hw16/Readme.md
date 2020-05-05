# Настраиваем центральный сервер для сбора логов
Цель: В результате выполнения ДЗ студент настроит центральный сервер для сбора логов.
В вагранте поднимаем 2 машины web и log:
- на web поднимаем nginx
- на log настраиваем центральный лог сервер на любой системе на выбор
- настраиваем аудит следящий за изменением конфигов nginx

Используются: filebeat + logstash + elasticsearch + kibana.
Для аудита используется auditd.
Виртуальные машины конфигурируются при помощи ansible.

После запуска вирутальных машин покидаем запросы на вебсервер, а также внесём изменение в nginx.conf -- убдеимся, что логи появляются в kibana:
![Nginx](https://github.com/AntonYuriev/otus-linux-hw/blob/master/hw16/screenshots/request.png?raw=true)
![Request log](https://github.com/AntonYuriev/otus-linux-hw/blob/master/hw16/screenshots/request-log.png?raw=true)
![Auditd log](https://github.com/AntonYuriev/otus-linux-hw/blob/master/hw16/screenshots/auditd-log.png?raw=true)