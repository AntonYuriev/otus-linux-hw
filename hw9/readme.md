# Запретить всем пользователям, кроме группы admin, логин в выходные (суббота и воскресенье), без учета праздников 

Результат выполнения может быть развёрнут с использованием Vagrant. Подготовка виртуальной машины в файле provision.sh

Создаётся группа admin. Группа добавляется пользователям vagrant и root. Также создаётся пользователь test1, не входящий в группу admin. Дополнительные правила авторизации добавляются при помощи модуля pam_exec и скрипта pam_script_auth.sh