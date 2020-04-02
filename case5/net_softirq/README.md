# Case 5 (NET irq)
Populate *iptables* filter table `DOCKER-USER` chain with N\*1000 bogus rules to force incoming packets destined for container waste much CPU resources in `ksoftirqd` and softirq.

**NOTE**: Build Docker image if pulled repository for first time: `sudo docker build -t case5:net .`

## Prerequisite
**This case cannot be demonstrated on a single VM!**

Setting up a seperate VM is recommended. Both this VM and the VM hosting the container must be mutually reachable (i.e. on the same subnet).
One way to achieve this is to add a virtual NIC to both VMs and attache them to "Bridged Adapter" (for VirtualBox).
We will designate IP\_a as external IP of VM hosting the container (Host A), and IP\_B that of the seperate VM (Host B).

## Steps
1. On Host A, run `top` to monitor CPU usage and busy processes. Press `1` to see all cores.
2. On Host A in another terminal, execute `net_modify_iptables.sh <num>`, where `<num>` is the number of bogus rules to insert into *iptables* (by default 5000). This may take a long time depending on number of rules.
3. On Host A in another terminal, run container: `sudo docker run --cpuset-cpus 0 -p <IP_a>:8080:8080/tcp --rm -it case5:net`, pinning it to core 0 and allow 100% utilization
4. The container will be listening for connection at port 8080. Host A is listening for connection to IP\_a at port 8080.
5. On Host B, start transfering 2GB of data at 20mbps to IP\_a port 8080: `dd if=/dev/zero bs=1M count=2000 | pv -L 20m | nc <IP\_a> 8080`
6. On Host A in terminal with `top`, observe that one core will have a high value for *si* (CPU time in software interrupt) and a corresponding busy `ksoftirqd` thread.
7. When Host B finishes transfer, container on Host A will exit. On Host A in terminal running `net_modify_iptables.sh`, press any key to restore *iptables*.
8. Optionally read files `stats-*` to see the recorded CPU usage for `ksoftirqd`. NOTE: data for software interrupt is buggy, use `top` in real-time instead.
