#!/usr/bin/env bash 

CURRENT=$(df $1 | grep -E '[0-9]+%'| awk '{print }' | sed 's/%//g')
THRESHOLD=85

if [ "$CURRENT" -gt "$THRESHOLD" ] ; then 
    mail -s 'Low Disk Space Alert' santiago.mok@intel.com << EOF
    Path $1 remaining is critically low. Used: $CURRENT%
    EOF
fi
