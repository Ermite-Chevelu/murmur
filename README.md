Lightweight Docker image for Murmur (Mumble server)
===================================================

[![build status](https://gitlab.com/ermite-chevelu/murmur/badges/master/build.svg)](https://gitlab.com/ermite-chevelu/murmur/commits/master)

This image is lightweight and up-to-date Mumble server.

Usage
-----

### Running Murmur

```
$ docker run -d -p 64738:64738/tcp -p 64738:64738/udp registry.gitlab.com/ermite-chevelu/murmur
```

This image uses default configuration file provides by mumble with only two changes:

* Database path is set to : `/var/lib/murmur/murmur.sqlite` (default configuration doewn't provide any path and database file is created in `/etc/`)
* Set `uname=murmur` to not run server as `root`

### Advance configuration and persistence

To use a custom configuration file and persist database run it with :

```
$ docker run -d \
  -p 64738:64738/tcp \
  -p 64738:64738/udp \
  -v /path/to/murmur.ini:/etc/murmur.ini:ro \
  -v /var/lib/murmur/murmur.sqlite \
  --name murmur registry.gitlab.com/ermite-chevelu/murmur
```

### Setup superuser password

To setup the `superuser` password, run this command:

```
$ docker exec murmur murmurd -supw <password>
```
