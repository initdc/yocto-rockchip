FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Shanghai \
    LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN set -e \
    && sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
    && apt update

# ref: https://docs.yoctoproject.org/ref-manual/system-requirements.html#ubuntu-and-debian

# RUN set -e \
#     && apt-get build-dep qemu \
#     && apt-get remove oss4-dev

RUN set -e \
    && apt-get install --no-install-recommends -y \
    # sorting by https://build.moz.one
    build-essential chrpath cpio debianutils  \
    diffstat file gawk gcc git iputils-ping  \
    libegl1-mesa liblz4-tool libsdl1.2-dev  \
    locales make mesa-common-dev pylint3  \
    python3 python3-git python3-jinja2  \
    python3-pexpect python3-pip  \
    python3-subunit socat sudo texinfo unzip  \
    wget xterm xz-utils zstd  \
    && apt-get autoremove --purge \
    && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
RUN pip3 install sphinx sphinx_rtd_theme pyyaml

RUN useradd -c 'ubuntu' -m -d /home/ubuntu -s /bin/bash ubuntu
RUN set -e \
    && sed -i -e '/\%sudo/ c \%sudo ALL=(ALL) NOPASSWD: ALL' /etc/sudoers \
    && usermod -aG sudo ubuntu

USER ubuntu
WORKDIR /home/ubuntu/

ENTRYPOINT [ "/bin/bash" ]