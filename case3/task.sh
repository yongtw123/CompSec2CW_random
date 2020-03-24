#!/bin/bash

SECTORUN=30
ITER=1022
STOPTIME=$(($(date +%s) + SECTORUN))
while [[ $(date +%s) -lt $STOPTIME ]]; do
 echo "testuser$ITER:x:$ITER:$ITER:,,,:/home/testuser$ITER:/bin/bash" | newusers && su - testuser$ITER -c "whoami && exit" && (( ITER++))
done;
