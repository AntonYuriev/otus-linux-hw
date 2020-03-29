#!/bin/bash

#configuration
MAX_REPORTED_IP_COUNT=10
MAX_REPORTED_URL_COUNT=10
REPORT_EMAIL=antonyuriev@gmail.com

PREV_RUN_FILE=./prevrun

###

initDateInterval() {
        from_date=0
        to_date=$(date +%s)

        if [[ -e "$PREV_RUN_FILE" ]]; then
        source "$PREV_RUN_FILE"
        fi
}

initDateInterval

echo "Report from $from_date to $to_date"

echo "Top user IP's:"
awk -v tstart="$from_date" -v tend="$to_date" -f date-filter.awk access.log | awk '{ print $1; }' \
   | sort | uniq -c | sort -nr | head -n "$MAX_REPORTED_IP_COUNT"

echo "from_date=$to_date" > "$PREV_RUN_FILE"