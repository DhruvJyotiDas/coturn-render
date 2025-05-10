FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y coturn && \
    apt-get clean

COPY turnserver.conf /etc/turnserver.conf

EXPOSE 3478/udp
EXPOSE 3478/tcp

CMD ["turnserver", "-c", "/etc/turnserver.conf", "-v"]