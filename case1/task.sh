#!/bin/bash

SECTORUN=30
STOPTIME=$(($(date +%s) + SECTORUN))
while [[ $(date +%s) -lt $STOPTIME ]]; do
  ./divzero&
done;
