FROM ubuntu:xenial
WORKDIR /CompSec2CW_random
RUN apt-get update && apt-get install -y fio
COPY ./block.sh /tmp/
WORKDIR /tmp
CMD [ "./block.sh" ]
