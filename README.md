# yocto-rockchip

## Prepare repo

`git submodule update --init --recursive`

## Build

`DOCKER_BUILDKIT=1 docker build --platform linux/amd64 -t yocto-rk:v1 .`

## Run

`docker run -v $PWD:/home/ubuntu --name yocto-rk -it yocto-rk:v1`