# Dockerfile for running a stunnel server that will encrypt
# communication to other services on a remote host, e.g. riemann server
# 
FROM ubuntu:trusty
MAINTAINER arnaud@capital-match.com

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y stunnel4

# Expose the ports for inbound events and websockets
EXPOSE 5555
EXPOSE 5556

# Share the config directory as a volume
VOLUME /etc/stunnel

CMD stunnel4
