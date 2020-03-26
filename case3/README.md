# Case 3
Malicious container constantly executing a switch user statement and exiting, triggering the system process `journald` which logs this activity and generates ~20% of extra CPU activity as well as a non-negligible amount of I/O operations, which can impact the performance of the other containers.

Steps to replicate: 

NOTE: If have not done so, grab Docker Ubuntu image: `sudo docker pull ubuntu:bionic`

1. Start container and pin it on one core, as well as enable logging by journald: 
    `sudo docker run --rm -it --cpuset-cpus=0 --log-driver=journald ubuntu:bionic`
2. Open a new terminal and copy the script: `sudo docker cp task.sh <containerid>:/tmp`
3. Open `top` or `htop` on host machine
4. In container, run `./tmp/task.sh`; it will create a user `testuser` and switch and exit into it in a loop for 30 seconds.
5. Observe `top` or `htop` on host machine; The CPU core running the container should have a 100% utilization, whereas the other cores should have an increase in their aggregate usage of 15-20%. Also, there should be a a constant ~3% utilization of the CPU by the `journald` system process, as well as a ~2MB/s I/O throughput as a result of the logging done by this process. This value depends on the I/O performance of the host; it is far more effective on servers with poor I/O performance.