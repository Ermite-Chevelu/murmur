[![Docker Stars](https://img.shields.io/docker/stars/ermite/murmur.svg)]() [![Docker Pulls](https://img.shields.io/docker/pulls/ermite/murmur.svg)]()
[![Version](https://images.microbadger.com/badges/version/ermite/murmur.svg)]() [![Layers](https://images.microbadger.com/badges/image/ermite/murmur.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/ermite/murmur.svg)]()

# Supported tags and respective Dockerfile links

* `1.2.18`, `latest` [(1.2.18/Dockerfile)](https://github.com/Ermite-Chevelu/murmur/blob/1.2.18/Dockerfile)

# Running Murmur

```
$ docker run -d -p 64738:64738/tcp -p 64738:64738/udp registry.gitlab.com/ermite-chevelu/murmur
```

This image uses default configuration file provides by mumble with only two changes:

* Database path is set to : `/var/lib/murmur/murmur.sqlite` (default configuration doewn't provide any path and database file is created in `/etc/`)
* Set `uname=murmur` to not run server as `root`

# Advance configuration and persistence

To use a custom configuration file and persist database run it with :

```
$ docker run -d \
  -p 64738:64738/tcp \
  -p 64738:64738/udp \
  -v /path/to/murmur.ini:/etc/murmur.ini:ro \
  -v /var/lib/murmur/murmur.sqlite \
  --name murmur registry.gitlab.com/ermite-chevelu/murmur
```

# Setup superuser password

To setup the `superuser` password, execute :

```
$ docker exec murmur murmurd -supw <password>
```
