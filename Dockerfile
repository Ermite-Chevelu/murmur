# Alpine linux latest stable version
FROM alpine:latest

MAINTAINER Ermite Chevelu <ermite.chevelu@outlook.com>

# Install murmur
RUN apk add -U murmur=1.2.10-r1

# Forward apporpriate ports
EXPOSE 64738/tcp 64738/udp 6502/tcp

# Run murmur
ENTRYPOINT ["/usr/bin/murmurd", "-fg", "-v"]

## TODO
# mount database -v /src/murmur/db/murmur.sqlite:/var/run/murmur.sqlite (create DB with 'touch /src/murmur/db/murmur.sqlite' on host or copy existing DB)
# mount configuration -v /src/murmur/conf/murmur.ini:/etc/murmur.ini (copy configuration)
# mount ssl cert -v /src/murmur/ssl/:/etc/ssl/private/
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
