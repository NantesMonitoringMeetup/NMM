# Dockerfile for running a riemann dashboard
# 
# This container only runs the ruby dashboard for riemann, which needs to connect to some
# running riemann server container.
# 
# Inspired by: https://github.com/patrickod/riemann-docker/blob/master/Dockerfile
# Reference: http://riemann.io/quickstart.html
FROM ubuntu:trusty
MAINTAINER arnaud@capital-match.com

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get upgrade -y

# Ruby stuff
RUN apt-get install -y build-essential ruby1.9.1 ruby1.9.1-dev
RUN apt-get install -y libz-dev

# Expose the ports for inbound events and websockets
EXPOSE 4567

RUN gem install riemann-client riemann-tools riemann-dash

ADD config.rb config.rb

CMD /usr/local/bin/riemann-dash config.rb

