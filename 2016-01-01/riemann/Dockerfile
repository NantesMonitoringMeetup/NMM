# Dockerfile for running a riemann server
# 
# This container only runs the riemann server itself, not the dashboard server. Clients and 
# servers need to link to the running container in order to use it.
# 
# Inspired by: https://github.com/patrickod/riemann-docker/blob/master/Dockerfile
# Reference: http://riemann.io/quickstart.html
FROM ubuntu:trusty
MAINTAINER arnaud@capital-match.com

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y curl default-jre-headless

# Download the latest .deb and install
RUN curl https://aphyr.com/riemann/riemann_0.2.10_all.deb > /tmp/riemann_0.2.10_all.deb
RUN dpkg -i /tmp/riemann_0.2.10_all.deb

# Expose the ports for inbound events and websockets
EXPOSE 5555
EXPOSE 5555/udp
EXPOSE 5556

# Share the config directory as a volume
VOLUME /etc/riemann
ADD riemann.config /etc/riemann/riemann.config

# Set the hostname in /etc/hosts so that Riemann doesn't die due to unknownHostException
CMD /usr/bin/riemann /etc/riemann/riemann.config
