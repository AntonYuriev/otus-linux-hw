# Homework

Написать скрипт для крона, который раз в час присылает на заданную почту отчёт, содержащий:

- X IP адресов (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта
- Y запрашиваемых адресов (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта
- все ошибки c момента последнего запуска
- список всех кодов возврата с указанием их кол-ва с момента последнего запуска
- обрабатываемый временной диапазон

Должна быть реализована защита от мультизапуска.

# Как запустить

- прописать адрес электронной почты в reporter/script.sh
- запустить виртуальную машину
- данные придут на почту в течение часа
- также, находясь в виртуальной машине, скрипт можно запустить вручную: /vagrant/reporter/script.sh
