# Case 4
Making Docker engine subsystems busy by thrashing tty subsystem

1. Run container: `sudo docker run --cpuset-cpus 0 --rm -it ubuntu:bionic`, pinning it to core 0 and allow 100% utilization
2. Copy `task4.sh` into container: `sudo docker cp task4.sh <containerid>:/tmp`
3. Execute `logging.sh` to start logging CPU usage for `dockerd` and `kworker` processes
4. Inside container, run `task4.sh`, which will thrash the tty device by showing all loaded kernel modules continuously. In the meantime, try using `top` or `sudo docker stats` in another terminal on host machine to see the container claiming 100% of core 0.
5. After `task4.sh` finishes execution (30 seconds), on host machine check `stats-dockerd.log` and `stats-kworker.log`, both created by `logging.sh`. Each line is the CPU usage of that process (group) for duration of 0.5sec. `dockerd` should claim at max around 60%, whereas kworker around 30%.

