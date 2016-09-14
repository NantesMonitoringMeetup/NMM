#!/bin/bash

set -x

# Send some syslog thru UDP
echo '<28>Sep 13 08:09:25 makina kernel: Hello' \
  > /dev/udp/127.0.0.1/514

# Some more
echo -n '<22>Sep 13 18:09:25 makina sshd[42]: Failed password for invalid user schtroumpf from 10.11.12.13 port 4242 ssh2' > /dev/udp/127.0.0.1/514
