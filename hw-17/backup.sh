#!/bin/sh

export BORG_REPO=ssh://vagrant@192.168.11.151/var/borg
export BORG_PASSPHRASE='secret'

info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }

LOCKFILE=/tmp/lockfile
if [ -e ${LOCKFILE} ] && kill -0 `cat ${LOCKFILE}`; then
    echo "already running"
    exit
fi

# Make sure the lockfile is removed when we exit and then claim it
trap "rm -f ${LOCKFILE}; exit" INT TERM EXIT
echo $$ > ${LOCKFILE}

info "Starting backup"

borg create \
  --stats --progress \
  ::"etc-{now:%Y-%m-%d_%H:%M:%S}" \
  /etc

backup_exit=$?

info "Pruning repository"

borg prune \
  -v --list \
  ${BORG_REPO} \
  --keep-within 30d \
  --keep-monthly 2

prune_exit=$?

# use highest exit code as global exit code
global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))

if [ ${global_exit} -eq 0 ]; then
    info "Backup and Prune finished successfully"
elif [ ${global_exit} -eq 1 ]; then
    info "Backup and/or Prune finished with warnings"
else
    info "Backup and/or Prune finished with errors"
fi

# Delete lockfile
rm -f ${LOCKFILE}

exit ${global_exit}
