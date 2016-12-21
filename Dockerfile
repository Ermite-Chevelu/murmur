FROM alpine:latest

MAINTAINER Ermite Chevelu <ermite.chevelu@outlook.com>

ARG MUMBLE_VERSION

# Install mumble-server
RUN apk add --no-cache wget &&\
    cd /tmp/ &&\
    wget --no-check-certificate https://github.com/mumble-voip/mumble/releases/download/${MUMBLE_VERSION}/murmur-static_x86-${MUMBLE_VERSION}.tar.bz2 &&\
    tar -xjf murmur-static_x86-${MUMBLE_VERSION}.tar.bz2 &&\
    mv /tmp/murmur-static_x86-${MUMBLE_VERSION}/murmur.x86 /usr/bin/murmurd &&\
    mv /tmp/murmur-static_x86-${MUMBLE_VERSION}/murmur.ini /etc/murmur.ini &&\
    mkdir -p /usr/share/slice &&\
    mv /tmp/murmur-static_x86-${MUMBLE_VERSION}/ice/Murmur.ice /usr/share/slice/Murmur.ice &&\
    adduser -S murmur &&\
    rm -r /tmp/* &&\
    apk del --no-cache wget

# Expose apporpriate ports
EXPOSE 64738/tcp 64738/udp 6502/tcp

# Run murmur
ENTRYPOINT ["/usr/bin/murmurd", "-ini", "/etc/murmur.ini", "-fg", "-v"]
