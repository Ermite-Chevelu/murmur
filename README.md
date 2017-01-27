[![Docker Stars](https://img.shields.io/docker/stars/ermite/murmur.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/ermite/murmur.svg)]()
[![Version](https://images.microbadger.com/badges/version/ermite/murmur.svg)]() [![Layers](https://images.microbadger.com/badges/image/ermite/murmur.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/ermite/murmur.svg)]()

# Supported tags and respective `Dockerfile` links

* `1.2.18`, `latest` [(1.2.18/Dockerfile)](https://github.com/Ermite-Chevelu/murmur/blob/1.2.18/Dockerfile)

# Usage

```
$ docker run -d -p 64738:64738/tcp -p 64738:64738/udp ermite/murmur
```

This image uses default configuration file provides by mumble with only one change:

* Database path is set to : `/var/lib/murmur/murmur.sqlite` (default configuration file doesn't provide any path and database file is created in `/etc/`)

# Advanced configuration

To use custom configuration file simply mount a volume with `murmur.ini` configuration file :

```
$ docker run -d \
  -p 64738:64738/tcp \
  -p 64738:64738/udp \
  -v /local/path/to/murmur.ini:/etc/murmur.ini:ro \
  ermite/murmur
```

# Persistence

 By default, this image mount a volume `/var/lib/murmur/` to persist database.

# Get `SuperUser` password

On the first start, if no database exists, `SuperUser` password is automaticaly set by `murmurd` and can be retrieve in logs with this command :

```
$ docker logs murmur 2>&1 | grep Password
```

Result should be something like :

```
<W>2016-12-30 14:35:11.932 1 => Password for 'SuperUser' set to 'Sh\QMd\l;'
```

# Set `SuperUser` password

To setup `SuperUser` password, execute :

```
$ docker exec murmur /usr/sbin/murmurd -ini /etc/murmur.ini -supw <password>
```
