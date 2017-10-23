Docker container for Direct graph shell
=======================================

I had issues compiling [dgsh](https://github.com/dspinellis/dgsh) on my local machine,
so created docker container for myself and other to just _get and use it_

Just run it
-----------

```
docker run --volume=$PWD/examples:/examples aurelijusb/dgsh /examples/hello.dgsh
```
You should see: `Hello, from dgsh`

Using inside docker
-------------------

I usually run interactive shell with some files mounted:
```
docker run -it --volume=$PWD/examples:/examples aurelijusb/dgsh
```

Using compiled binaries
-----------------------

You can also copy compiled binaries out of container to your own system:
```
docker run --name=dgsh -d dg

sudo docker cp dgsh:/usr/local/bin/dgsh /usr/local/bin/dgsh
sudo mkdir -p /usr/local/libexec
sudo docker cp dgsh:/usr/local/libexec/dgsh/ /usr/local/libexec/dgsh/
sudo docker cp dgsh:/usr/local/include/dgsh.h /usr/local/include/dgsh.h
sudo docker cp dgsh:/usr/local/lib/libdgsh.a /usr/local/lib/libdgsh.a

docker rm -f dgsh
```

Test if `dgsh` works from local (linux) machine:
```
dgsh examples/hello.dgsh
```

Building on your own
--------------------

If you do not trust others, build it on your own
```
docker build -t NAME_YOUR_CONTAINER .
```

Original project
----------------
* https://github.com/dspinellis/dgsh