#!/bin/bash
echo "Start to Implement Case2 Data Synchronization On Attacker Container!"
apt-get update
yes | apt-get install bc
for i in $(seq 1 100)
do
time echo "scale=5000; 4*a(1)" | bc -l -q
done &
./tmp/case2_attacker


