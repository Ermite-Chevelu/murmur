FROM ubuntu:16.10

MAINTAINER Ermite Chevelu <ermite.chevelu@outlook.com>

ENV MUMBLE_VERSION 1.2.16-2build1

# Install mumble-server
RUN apt-get -qq update \
    && apt-get -y -V -qq install --no-install-recommends \
      mumble-server=${MUMBLE_VERSION} \
    && apt-get -qq clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose apporpriate ports
EXPOSE 64738/tcp 64738/udp 6502/tcp

# Run murmur
ENTRYPOINT ["/usr/sbin/murmurd", "-ini", "/etc/mumble-server.ini", "-fg", "-v"]
