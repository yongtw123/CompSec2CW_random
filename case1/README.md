# Case 1
Bombard container with divide-by-zero exceptions to trigger core dumps and exhaust `apport` daemon on host machine

NOTE: If have not done so, grab Docker Ubuntu image: `sudo docker pull ubuntu:bionic`

1. Start container: `sudo docker run --rm -it ubuntu:bionic`
2. Copy files over in another terminal: `sudo docker cp hi2 task.sh <containerid>:/tmp`
3. Open `top` or `htop` on host machine
4. In container, run `task.sh`; it will spawn as many `hi2` as it can for 30 seconds
5. Observe `top` or `htop` on host machine; all CPUs should be consumed to 100% by bunch of `apport` processes
6. Repeat steps 1-5 with CPU resource limit such as `--cpuset-cpus 0`, `--cpus 0.1`, `--pids-limit 50`; should still observe very high amplification

