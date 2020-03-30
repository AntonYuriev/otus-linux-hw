#!/bin/bash

#configuration

ACCESS_LOG="/vagrant/log/access.log"
MAX_REPORTED_IP_COUNT=10
MAX_REPORTED_URL_COUNT=10
REPORT_EMAIL=my@mail.com

###

PREV_RUN_FILE="prevrun"
LOCK_FILE="lock"

cd /vagrant/reporter

#multi-start protection

if [[ -e $LOCK_FILE ]]; then
    echo 'Already running'
    exit 16
fi

trap 'rm -f "$LOCK_FILE"; exit $?;' INT TERM EXIT
touch "$LOCK_FILE"

###

initDateInterval() {
    from_date=0
    to_date=$(date +%s)

    if [[ -e "$PREV_RUN_FILE" ]]; then
        source "$PREV_RUN_FILE"
    fi
}

initDateInterval

./report.sh "$ACCESS_LOG" "$from_date" "$to_date" "$MAX_REPORTED_IP_COUNT" "$MAX_REPORTED_URL_COUNT"
./report.sh "$ACCESS_LOG" "$from_date" "$to_date" "$MAX_REPORTED_IP_COUNT" "$MAX_REPORTED_URL_COUNT" | mail -s "Log report" "$REPORT_EMAIL"

echo "from_date=$to_date" > "$PREV_RUN_FILE"
rm -f "$LOCK_FILE"
