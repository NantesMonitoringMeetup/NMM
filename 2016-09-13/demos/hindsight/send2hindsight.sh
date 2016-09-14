#!/bin/bash

set -x

# Send some syslog thru UDP
echo '<28>Sep 13 08:09:25 makina kernel: Hello' \
  > /dev/udp/127.0.0.1/514
