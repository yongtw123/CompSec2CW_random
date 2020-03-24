# Case 1

- Grab Docker Ubuntu image: `sudo docker pull ubuntu:bionic`
- Start container: `sudo docker run -it ubuntu:bionic`
- Copy files over in another terminal: `sudo docker cp hi2 task.sh <containerid>:/tmp`
- Open `top` or `htop`
- In container, run `task.sh`; it will spawn as many `hi2` as it can for 30 seconds
- Observe `top` or `htop`; all CPUs should be consumed to 100% by bunch of `apport` processes

