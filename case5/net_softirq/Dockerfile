# Image for Case 5 Part 1 NET Softirq
FROM ubuntu:bionic
RUN apt-get update && apt-get install -y netcat
CMD nc -lvnp 8080 > /dev/null
