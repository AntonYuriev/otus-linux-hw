# Попасть в систему без пароля несколькими способами

## Способ 1. init=/bin/sh

- При загрузке VM в меню Grub нажимаем 'e', что позволит отредактировать опции загрузки
- В конце строки начинающейся с linux16 добавляем init=/bin/sh (см. change_root_pswd.1.1.png)
- Нажимаем сtrl-x для загрузки в систему

Далее сменим пароль root:

```
mount -o remount,rw /
passwd root
touch /.autorelabel
```

см. change_root_pswd.1.2.png

После чего можно перезагрузиться и войти в систему с новым паролем.

## Способ 2. rd.break

- При загрузке VM в меню Grub нажимаем 'e', что позволит отредактировать опции загрузки
- В конце строки начинающейся с linux16 добавлāем rd.break
- Нажимаем сtrl-x для загрузки в систему и попадаем в emergency mode

Корневая система смонтирована в /sysroot в режиме read only. Для смены пароля необходимо перемонтировать её в режиме RW и сделать chroot:

```
mount -o remount,rw /sysroot
chroot /sysroot
passwd root
touch /.autorelabel
```

см. change_root_pswd.2.png

После чего можно перезагрузиться и войти в систему с новым паролем.

## Способ 3. rw init=/sysroot/bin/sh

- При загрузке VM в меню Grub нажимаем 'e', что позволит отредактировать опции загрузки
- В строке начинающейся с linux16 заменяем ro на rw init=/sysroot/bin/sh (см. change_root_pswd.3.1.png)
- Нажимаем сtrl-x для загрузки в систему

Корневая система смонтирована в /sysroot в режиме RW. Далее сменим пароль root:

```
chroot /sysroot
passwd root
touch /.autorelabel
```

см. change_root_pswd.3.2.png

# Установить систему с LVM, после чего переименовать VG

см. vg_rename.log

- переименовываем VolGroup00 на OtusRoot
- правим /etc/fstab, /etc/default/grub, /boot/grub2/grub.cfg
- пересоздаем initrd image
- перезагружаемся

