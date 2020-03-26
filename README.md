# Computer Security II CW

Houdini’s Escape: Breaking the Resource Rein of Linux Control Groups  
Gao et al.

**Team: random**

## Environment setup
[How to install and use docker on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04)

## Writing and running C code in container
- [Shipping C programs in Docker](https://medium.com/@mfcollins3/shipping-c-programs-in-docker-1d79568f6f52)
- [How to compile and run C/C++ code in Linux](https://www.cyberciti.biz/faq/howto-compile-and-run-c-cplusplus-code-in-linux/)

## On how to limit resources
[How to limit resources using cgroups on CentOS 6](https://www.digitalocean.com/community/tutorials/how-to-limit-resources-using-cgroups-on-centos-6)

## Optional: how Docker images work
[What are Docker OS images and why would I want to use them in my Dockerfile?](http://artemstar.com/2017/07/23/docker-os-images/)

TLDR; Use OS images with the necessary libraries and binaries built-in!

## The Battleplan
Each person will choose at least 1 case from the 5 as laid out by the authors of paper.
Each person then will implement the code necessary (be it C, C++, Python, Rust, or whatever) to trigger the exploitation.
A very small sample Dockerfile is in `case1`, but obviously there's more to it.

**May the force be with us**

## Code snippets / Notes

### Build image defined by Dockerfile

Build image defined via `Dockerfile`, which is assumed to be in current directory: `sudo docker build -t <tagname>:<tagsuffix> .`

### Run container
Create container instance with image: `sudo docker run -it <tagname>:<tagsuffix>`, i for interactive session, t for allocating tty.

- `--rm` to remove container on exit
- `--cpuset-cpus 0` to pin container to one core (core 0)
- `--cpus 0.1` to limit CPU usage of container to a tenth of a core
- `--pids-limit 50` to limit number of PIDs container can use to 50

### List containers
`sudo docker ps -a`

### Show container stats (CPU/MEM etc.)
`sudo docker stats`

### Basic testing process
Basic idea is to write some code that trigger the scenario, copy it into a running container (`sudo docker cp <src> <containerid>:<dest>`), then run it (`docker run`). To automate the procedure, a Dockerfile should be created, which defines the base image (ex. `FROM ubuntu:bionic`), the files to copy (`COPY`), and the commands to run (`EXEC`/`RUN`). Note that if no `EXEC` or `RUN` command is written in `Dockerfile`, by default a shell will be spawned when container is created and run (this is called an "entrypoint").

