APT-REPO-SERVER
=========================

apt-repo-server is a debian repository server inside a docker container. It monitors file changing events using inotifywait, then reproduce index Packages.gz automatically.

Usage
=======================

Run server

```
$ docker run -it -v ${PWD}/data:/data -p 80:80 itsamenathan/apt-repo-server
```

Export a debian package
```
$ cp some-random.deb  data
```

Update /etc/apt/sources.list
```
$ sudo echo "deb http://127.0.0.1 ./" >> /etc/apt/sources.list
```
