Lightweight Docker image for Murmur (Mumble server)
===================

[![build status](https://gitlab.com/ermite-chevelu/murmur/badges/master/build.svg)](https://gitlab.com/ermite-chevelu/murmur/commits/master)

This image is lightweight and up-to-date Mumble server.

Usage
-------------------

To run it:

```
$ docker run -d -p 64738:64738/tcp -p 64738:64738/udp registry.gitlab.com/ermite-chevelu/murmur
```

This image uses default configuration file provides by mumble, that is not ideal. To use a custom configuration file and persist database run it with :

```
$ docker run -d \
-p 64738:64738/tcp \
-p 64738:64738/udp \
-v /path/to/murmur.ini:/etc/murmur.ini:ro \
-v /path/to/murmur.sqlite \
registry.gitlab.com/ermite-chevelu/murmur
```

A user `murmur` exists and for security reason it is recommanded to use it to run Mumble server. To do this, add `uname=murmur` in your configuration file.
