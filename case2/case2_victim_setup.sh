#!/bin/bash
docker run --name=case2_victim_container --cpuset-cpus 0 --cpus 0.1 --cpu-shares 512 -itd ubuntu "/bin/bash"
gcc -o case2_victim case2_victim.c
docker cp case2_victim case2_victim_container:/tmp/
docker cp case2_victim.sh case2_victim_container:/tmp/
docker exec -it case2_victim_container ./tmp/case2_victim.sh
