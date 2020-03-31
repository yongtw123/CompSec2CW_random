#!/bin/bash

DOCKERD_STATS=stats-dockerd.log
KWORKER_STATS=stats-kworker.log
truncate -s 0 $DOCKERD_STATS
truncate -s 0 $KWORKER_STATS

while true; do
  TOP="$(top -n 1 -b)"
  echo "$TOP" | grep dockerd | awk '{ SUM += $9} END { print SUM }' >> $DOCKERD_STATS
  echo "$TOP" | grep kworker | awk '{ SUM += $9} END { print SUM }' >> $KWORKER_STATS
  sleep 0.5
done
