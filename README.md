[![Docker Stars](https://img.shields.io/docker/stars/ermite/murmur.svg)]() [![Docker Pulls](https://img.shields.io/docker/pulls/ermite/murmur.svg)]()
[![Version](https://images.microbadger.com/badges/version/ermite/murmur.svg)]() [![Layers](https://images.microbadger.com/badges/image/ermite/murmur.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/ermite/murmur.svg)]()

# Supported tags and respective `Dockerfile` links

* `1.2.18`, `latest` [(1.2.18/Dockerfile)](https://github.com/Ermite-Chevelu/murmur/blob/1.2.18/Dockerfile)

# Running Murmur

```
$ docker run -d -p 64738:64738/tcp -p 64738:64738/udp registry.gitlab.com/ermite-chevelu/murmur
```

This image uses default configuration file provides by mumble with only two changes:

* Database path is set to : `/var/lib/murmur/murmur.sqlite` (default configuration file doesn't provide any path and database file is created in `/etc/`)
* Set `uname=murmur` to run server as non `root` user

# Advance configuration and persistence

To use custom configuration file and persist database simply mount a volume with `murmur.ini` configuration file and another to store database file :

```
$ docker run -d \
  -p 64738:64738/tcp \
  -p 64738:64738/udp \
  -v /path/to/murmur.ini:/etc/murmur.ini:ro \
  -v /var/lib/murmur/murmur.sqlite \
  --name murmur registry.gitlab.com/ermite-chevelu/murmur
```

# Get `SuperUser` password

On the first start, if no database already exists, `SuperUser` password can be retrieve with :

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
$ docker exec murmur murmurd -supw <password>
```
