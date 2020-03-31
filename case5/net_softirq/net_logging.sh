#!/bin/bash

KSOFTIRQD_STATS=stats-ksoftirqd.log
SI_STATS=stats-softinterrupt.log
#NC_STATS=stats-nc.log
truncate -s 0 $KSOFTIRQD_STATS
truncate -s 0 $SI_STATS
#truncate -s 0 $NC_STATS

while true; do
  TOP="$(top -n 1 -b)"
  echo "$TOP" | grep ksoftirqd | awk '{ SUM += $9} END { print SUM }' >> $KSOFTIRQD_STATS
  echo "$TOP" | grep 'si,' >> $SI_STATS
  #echo "$TOP" | grep ' nc' >> $NC_STATS
  sleep 0.5
done
