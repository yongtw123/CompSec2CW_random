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
