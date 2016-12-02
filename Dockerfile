# Alpine linux latest stable version
FROM alpine:latest

MAINTAINER Ermite Chevelu <ermite.chevelu@outlook.com>

#
LABEL net.ermite.doker.murmur.description="Image with Mumble server"
LABEL net.ermite.doker.murmur.vendor="Ermite Chevelu"
LABEL net.ermite.doker.murmur.version="0.1.0"
LABEL net.ermite.doker.murmur.release-date="2016-12-01"

#
RUN apk add -U murmur=1.2.10-r1

# Forward apporpriate ports
EXPOSE 64738/tcp 64738/udp

# Run murmur
ENTRYPOINT ["/usr/bin/murmurd", "-fg", "-v"]

## TODO
# mount database -v /src/murmur/db/murmur.sqlite:/var/run/murmur.sqlite (create DB with 'touch /src/murmur/db/murmur.sqlite' on host or copy existing DB)
# and configuration -v /src/murmur/conf/murmur.ini:/etc/murmur.ini (copy configuration)
#
# expose ICE port -p 6502 (default conf bind ice port on loopback address)
# or better add containers in new network
#
# 1) Create new network
#   $ docker network create <network-name>
#
# 2) Connect containers to network
#   $ docker run --net=<network-name> ...
# or
#   $ docker network connect <network-name> <container-name>
#
# 3) Ping container by name
#   docker exec -ti <container-name-A> ping <container-name-B>
