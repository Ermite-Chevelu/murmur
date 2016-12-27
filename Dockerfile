FROM alpine:latest

MAINTAINER Ermite Chevelu <ermite.chevelu@outlook.com>

ARG MUMBLE_VERSION

# Install mumble-server
RUN apk add --no-cache wget ca-certificates && \
    cd /tmp/ && \
    wget https://github.com/mumble-voip/mumble/releases/download/${MUMBLE_VERSION}/murmur-static_x86-${MUMBLE_VERSION}.tar.bz2 && \
    tar -xjf murmur-static_x86-${MUMBLE_VERSION}.tar.bz2 && \
    mkdir -p /usr/share/slice/ /var/lib/murmur/ && \
    mv /tmp/murmur-static_x86-${MUMBLE_VERSION}/murmur.x86 /usr/bin/murmurd && \
    mv /tmp/murmur-static_x86-${MUMBLE_VERSION}/murmur.ini /etc/murmur.ini && \
    mv /tmp/murmur-static_x86-${MUMBLE_VERSION}/ice/Murmur.ice /usr/share/slice/Murmur.ice && \
    sed 's/^database=$/database=\/var\/lib\/murmur\/murmur.sqlite/;\
  		s/^#uname=$/uname=murmur/' \
  		-i /etc/murmur.ini || return 1 && \
    adduser -H -D -s /dev/null murmur && \
    chown murmur:murmur /var/lib/murmur/ && \
    cd && rm -r /tmp/* && \
    apk del --no-cache wget ca-certificates

# Expose apporpriate ports
EXPOSE 64738/tcp 64738/udp 6502/tcp

# Run murmur
ENTRYPOINT ["/usr/bin/murmurd", "-ini", "/etc/murmur.ini", "-fg", "-v"]
