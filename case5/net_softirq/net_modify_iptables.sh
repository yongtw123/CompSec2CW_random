#!/bin/bash

IPTABLES_BACKUP=iptables.bak
RULECOUNT=${1:-5000}
sudo iptables-save > ./$IPTABLES_BACKUP

# Add bogus iptables rules
# NOTE: variable treated literally in brace expansion...
#sudo iptables -F DOCKER-USER
for i in $(seq 1 $RULECOUNT); do
  sudo iptables -t filter -I DOCKER-USER 1 -d 172.17.0.2/32 ! -i docker0 -o docker0 -p tcp -m tcp --dport $((20000 + i)) -j ACCEPT
done
# Allow inter-container communication
#sudo iptables -A DOCKER-USER -s 172.17.0.0/16 -d 172.17.0.0/16 -j ACCEPT
# Drop everything else
#sudo iptables -A DOCKER-USER -j DROP

./net_logging.sh&
LOGGING_P=$!

read -n 1 -s -r -p "Press any key to restore (AFTER container quits):"
echo

kill "$LOGGING_P"
sudo iptables-restore < ./$IPTABLES_BACKUP
sudo rm -f ./$IPTABLES_BACKUP
