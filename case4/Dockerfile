FROM ubuntu:bionic
RUN apt-get update && apt-get install -y kmod
WORKDIR ~/CompSec2CW_random
COPY ./task4.sh /tmp/
WORKDIR /tmp
CMD [ "./task4.sh" ]
