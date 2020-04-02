# Case 5 (BLOCK irq)
Malicious container running the flexible I/O tester command (`fio`) to spawn a number of processes running sequential read or write actions in order to generate non-neglible workload on multiple kernel threads such as `kworker` and `kswapd`, thereby escaping the constraints imposed by cgroups and potentially impairing the performance of other containers.

**NOTE**: You'd need at least 3GB of free disk space in order to replicate this attack.

**NOTE**: Build Docker image if pulled repository for first time: `sudo docker build -t case5:block .`

Steps to replicate: 
1. Open `top` or `htop` on host machine
2. Start container and pin it on one core: 

`sudo docker run --rm -it --cpuset-cpus=0 case5:block`

3. A script in the container will run for ~90 seconds, executing sequential writes for 45 seconds, and sequential reads for 45 seconds, using the `fio` command.
4. Observe `top` or `htop` on host machine; During the sequential writes, there should be ~16-20% workload on the `kworker` process on the same core the container is running on. Additionally, during the sequential reads, there should be a 3-5% workload on the `kworker` kernel process, as well as a ~20-30% workload on the `kswapd` kernel process during the file allocation process initiated by the sequential reads. This effect would be further amplified on machines with poor I/O performance.
