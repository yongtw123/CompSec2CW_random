# Case 3
Malicious container constantly executing a switch user statement and exiting, triggering the system process `journald` which logs this activity and generates ~20% of extra CPU activity as well as a non-negligible amount of I/O operations, which can impact the performance of the other containers.

**NOTE**: Build Docker image if pulled repository for first time: `sudo docker build -t case3 .`

Steps to replicate: 
1. Open `top` or `htop` on host machine
2. Start container and pin it on one core, as well as enable logging by journald:

        `sudo docker run --rm --cpuset-cpus=0 --log-driver=journald -it case3`

3. A script in the container will run, creating a user `testuser` and switching and exiting to/from it in a loop for 30 seconds.
4. Observe `top` or `htop` on host machine; The CPU core running the container should have a 100% utilization, whereas the other cores should have an increase in their aggregate usage of 15-20%. Also, there should be a a constant ~3% utilization of the CPU by the `journald` system process, as well as a ~2MB/s I/O throughput as a result of the logging done by this process. This value depends on the I/O performance of the host; it is far more effective on servers with poor I/O performance.

