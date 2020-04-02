# Case 1
Bombard container with divide-by-zero exceptions to trigger core dumps and exhaust `apport` daemon on host machine

**NOTE**: Build Docker image if pulled repository for first time: `sudo docker build -t case1 .`

1. On host, open `top` or `htop`
2. Start container: `sudo docker run --rm -it case1`. The container will start generating divide-by-zero exceptions for 30 seconds.
3. Observe `top` or `htop` on host machine; all CPUs should be consumed to 100% by bunch of `apport` processes.
4. Repeat steps 1-3 with CPU resource limit such as ones below. Should still oboserve very high workload amplification.
    - Pin to core 0: `--cpuset-cpus 0`
    - Pin to core 0 **and** 10% of a core: `--cpuset-cpus 0 --cpus 0.1`
    - Limit number of PIDs to 50: `--pids-limit 50`
