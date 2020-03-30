#!/bin/bash

DATE=`date`

if grep $WORD $LOG &> /dev/null
then
	logger "$DATE: I found word, Master!"
else
	exit 0
fi
