## What is this?

Ever wanted to have a GUI for your docker containers?
Isolating certain use cases e.g. having a Kali-Linux or a full Arch-Linux at hand.

This is how you set this up in minutes.

## How to?

- get [x11docker](https://github.com/mviereck/x11docker/blob/master/README.md#tldr)

- create or update a Dockerfile like [this](./Dockerfile)

- build image `docker build -t kali-x11 .`

- run `x11docker -I --desktop kali-x11`

## Other x11docker examples with prebuild images

```shell
docker pull x11docker/lxde
x11docker --desktop --size 320x240 x11docker/lxde

dive x11docker/fvwm
x11docker --desktop  x11docker/fvwm

```

