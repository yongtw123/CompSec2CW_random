#!/bin/bash
sudo docker run --name=case2_victim --cpuset-cpus 0 --cpu-shares 512 --rm -it case2:victim
#docker run --name=case2_victim_container --cpuset-cpus 0 --cpu-shares 512 -itd ubuntu:bionic "/bin/bash"
#gcc -o case2_victim case2_victim.c
#docker cp case2_victim case2_victim_container:/tmp/
#docker cp case2_victim.sh case2_victim_container:/tmp/
#docker exec -it case2_victim_container ./tmp/case2_victim.sh
