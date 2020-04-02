# Case 4
Making Docker engine subsystems busy by thrashing tty subsystem

**NOTE**: Build Docker image if pulled repository for first time: `sudo docker build -t case4 .`

1. On host, execute `logging.sh` to start logging CPU usage for `dockerd` and `kworker` processes
2. On host in another terminal, run container: `sudo docker run --cpuset-cpus 0 --rm -it case4`, pinning it to core 0 and allow 100% utilization
3. Inside container, a script will run to thrash the tty device by showing all loaded kernel modules continuously for 30 seconds. Optionally in the meantime, try using `top` or `sudo docker stats` in another terminal on host machine to see the container claiming 100% of core 0.
4. After container exits, `CTRL^C` on host machine to kill `logging.sh`.
5. Check `stats-dockerd.log` and `stats-kworker.log`, both created by `logging.sh`. Each line is the CPU usage of that process (group) every 0.5sec. `dockerd` should claim at max around 60%, whereas kworker around 30%.

