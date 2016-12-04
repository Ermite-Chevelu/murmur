FROM ubuntu:16.10

MAINTAINER Ermite Chevelu <ermite.chevelu@outlook.com>

# Install murmur
RUN apt-get update \
    && apt-get install --no-install-recommends -y mumble-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Forward apporpriate ports
EXPOSE 64738/tcp
EXPOSE 64738/udp
EXPOSE 6502/tcp

# Run murmur
ENTRYPOINT ["/usr/sbin/murmurd", "-fg", "-v"]
