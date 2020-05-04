#!/usr/bin/expect -f

spawn borg init --encryption=repokey /var/borg

expect "Enter new passphrase:"
send -- "secret\r"

expect "Enter same passphrase again:"
send -- "secret\r"

expect "Do you want your passphrase to be displayed for verification?"
send -- "N\r"

expect eof