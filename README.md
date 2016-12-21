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

This image uses default configuration file provides by mumble with only two changes:

* Database path is set to : `/var/lib/murmur/murmur.sqlite` (default configuration creates database file in `/etc/`)
* Set `uname=murmur` to not run server as `root`

To use a custom configuration file and persist database run it with :

```
$ docker run -d \
-p 64738:64738/tcp \
-p 64738:64738/udp \
-v /path/to/murmur.ini:/etc/murmur.ini:ro \
-v /var/lib/murmur/murmur.sqlite \
registry.gitlab.com/ermite-chevelu/murmur
```
