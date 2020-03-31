#!/bin/bash

echo "*********************************************"
echo "Running FIO sequential write for 45 seconds..."
echo "*********************************************"


fio --name=seqwrite --rw=write --direct=1 --ioengine=libaio --bs=4k --numjobs=3 --size=1G --runtime=45 --group_reporting && rm seq*;

echo "Sleeping for 1 second..." && sleep 1

echo "**********************************************"
echo "Running FIO sequential read for 45 seconds..."
echo "*********************************************"


fio --name=seqread --rw=read --direct=1 --ioengine=libaio --bs=32k --numjobs=3 --size=1G --runtime=45 --group_reporting && rm seq*;

