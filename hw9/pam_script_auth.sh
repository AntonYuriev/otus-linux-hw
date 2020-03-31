#!/bin/bash

if id -nG "$PAM_USER" | grep -qw "admin"; then 
    exit 0
else
    day=$(date +%a)

    if [[ "$day" == "Sat" ]] || [[ "$day" == "Sun" ]]; then
 	    exit 1
    else
        exit 0
    fi
fi
