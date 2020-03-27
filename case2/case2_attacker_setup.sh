#!/bin/bash
docker run --name=case2_attacker_container -itd ubuntu "/bin/bash"
gcc -o case2_attacker case2_attacker.c
docker cp case2_attacker case2_attacker_container:/tmp/
docker cp case2_attacker.sh case2_attacker_container:/tmp/
docker exec -it case2_attacker_container ./tmp/case2_attacker.sh
