#!/bin/bash
sudo docker run --name=case2_attacker --cpuset-cpus 0 --cpu-shares 512 --rm -it case2:attacker
#docker run --name=case2_attacker_container --cpuset-cpus 0 --cpu-shares 512 -itd ubuntu:bionic "/bin/bash"
#gcc -o case2_attacker case2_attacker.c
#docker cp case2_attacker case2_attacker_container:/tmp/
#docker cp case2_attacker.sh case2_attacker_container:/tmp/
#docker exec -it case2_attacker_container ./tmp/case2_attacker.sh
