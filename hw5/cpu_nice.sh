#!/bin/bash

LOG=cpu-nice.log
BIG_FILE=file.txt

dd if=/dev/urandom of=$BIG_FILE bs=1048576 count=100

nice_high_priority() {
    echo "nice -19 started: `date`" >> $LOG
    highStartMs=$(date +%s)

    nice -n -19 tar -czf nice-19.tar.bz2 $BIG_FILE

    echo "nice -19 finished: `date`" >> $LOG
    highEndMs=$(date +%s)

    echo "nice -19: $(($highEndMs - $highStartMs)) ms" >> $LOG

    rm -f nice-19.tar.bz2
}

nice_low_priority() {
    echo "nice +19 started: `date`" >> $LOG
    lowStartMs=$(date +%s)

    nice -n +19 tar -czf nice+19.tar.bz2 $BIG_FILE

    echo "nice +19 finished: `date`" >> $LOG
    lowEndMs=$(date +%s)

    echo "nice +19: $(($lowEndMs - $lowStartMs)) ms" >> $LOG

    rm -f nice+19.tar.bz2
}

nice_high_priority &
nice_low_priority &
