FROM ubuntu:focal

MAINTAINER Soeren Kress <soeren@boundless-mind.com>
ENV DATE=2020-05-18_08:00

# USING THIS CONTAINER
# docker run \
#   --rm -ti --privileged --net=host --pid=host --ipc=host \
#   --device /dev/sdX:/dev/sdX \
#   -v /var/run/libvirt:/var/run/libvirt:rw \
#   -v /var/lib/libvirt:/var/lib/libvirt:rw skress/virt-install /bin/bash
#

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends apt-utils dialog 2>&1 \
    && apt-get install -y vim openssh-client less cpio virtinst libvirt-clients libosinfo-bin libguestfs-tools \
    && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

WORKDIR /root
CMD ["bash"]
