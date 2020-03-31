# Реализовать 2 конкурирующих процесса по CPU, запустить с разными nice

Результат ДЗ - скрипт запускающий 2 процесса с разными nice и замеряющий время выполнения и лог консоли.

Прооверка результата:

```
vagrant up
vagrant ssh
sudo /vagrant/cpu_nice.sh
tail -f cpu-nice.log
```

Вывод cpu-nice.log:

```
nice +19 started: Tue Mar 31 15:00:23 UTC 2020
nice -19 started: Tue Mar 31 15:00:23 UTC 2020
nice -19 finished: Tue Mar 31 15:00:27 UTC 2020
nice -19: 4 ms
nice +19 finished: Tue Mar 31 15:00:30 UTC 2020
nice +19: 7 ms
```