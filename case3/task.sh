#!/bin/bash

SECTORUN=30
STOPTIME=$(($(date +%s) + SECTORUN))
USERNAME="testuser"

# Create a dummy user

id -u $USERNAME || \
 (echo "testuser:x:1001:1001:,,,:/home/testuser:/bin/bash" \
 | newusers)

# Switch into the user and exit in a loop
# Should trigger the journald logging process in the host

while [[ $(date +%s) -lt $STOPTIME ]]; do
 su - testuser -c "whoami && exit"&
done;
