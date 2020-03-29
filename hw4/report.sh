#!/bin/bash

access_log=$1
from_date=$2
to_date=$3
max_reported_ip_count=$4
max_reported_url_count=$5

echo "From: $(date -d @$from_date)"
echo "To:   $(date -d @$to_date)"
echo

echo "Top user IP's:"
awk -v tstart="$from_date" -v tend="$to_date" -f date-filter.awk "$access_log" | awk '{ print $1; }' \
   | sort | uniq -c | sort -nr | head -n "$max_reported_ip_count"

echo

echo "Top requested URL's:"
awk -v tstart="$from_date" -v tend="$to_date" -f date-filter.awk "$access_log" | awk '{ print $7; }' \
   | sort | uniq -c | sort -nr | head -n "$max_reported_url_count"

echo

echo "HTTP response codes:"
awk -v tstart="$from_date" -v tend="$to_date" -f date-filter.awk "$access_log" | awk '{ print $9; }' \
   | sort | uniq -c | sort -nr
