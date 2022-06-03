# yocto-rockchip

## Prepare

- git

  `git submodule update --init --recursive`

- repo (fetch)

  ```sh
  mkdir riscv-yocto && cd riscv-yocto
  repo init -u https://github.com/riscv/meta-riscv -b master -m tools/manifests/riscv-yocto.xml
  repo sync
  repo start work --all
  ```

- Docker

  ```sh
  DOCKER_BUILDKIT=1 docker build --platform linux/amd64 -t yocto-rk:v1 .

  docker run -v $PWD:/home/ubuntu --name yocto-rk -it yocto-rk:v1
  ```

## Run

```sh
source poky/oe-init-build-env

bitbake core-image-minimal
```

## Test

> ref: https://docs.yoctoproject.org/dev-manual/qemu.html

`runqemu qemux86-64 core-image-minimal ext4`
