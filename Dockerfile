FROM alpine:3.5

MAINTAINER Ermite Chevelu

LABEL version=1.2.18 \
      description="Lightweight image with up-to-date Mumble server."

ARG MUMBLE_VERSION=1.2.18

# Install mumble-server
RUN apk add --no-cache curl && \
    cd /tmp/ && \
    curl -L https://github.com/mumble-voip/mumble/releases/download/${MUMBLE_VERSION}/murmur-static_x86-${MUMBLE_VERSION}.tar.bz2 | tar -xj && \
    mkdir -p /usr/share/slice/ /var/lib/murmur/ && \
    mv /tmp/murmur-static_x86-${MUMBLE_VERSION}/murmur.x86 /usr/bin/murmurd && \
    mv /tmp/murmur-static_x86-${MUMBLE_VERSION}/murmur.ini /etc/murmur.ini && \
    mv /tmp/murmur-static_x86-${MUMBLE_VERSION}/ice/Murmur.ice /usr/share/slice/Murmur.ice && \
    sed 's/^database=$/database=\/var\/lib\/murmur\/murmur.sqlite/;\
  		s/^#uname=$/uname=murmur/' \
  		-i /etc/murmur.ini || return 1 && \
    adduser -H -D -s /dev/null murmur && \
    chown murmur:murmur /var/lib/murmur/ && \
    apk del --no-cache curl && \
    rm -rf /tmp/*

# Expose apporpriate ports
EXPOSE 64738/tcp 64738/udp 6502/tcp

# Run murmur
ENTRYPOINT ["/usr/bin/murmurd", "-ini", "/etc/murmur.ini", "-fg", "-v"]
