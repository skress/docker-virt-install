FROM ubuntu:artful
MAINTAINER Soeren Kress <soeren@boundless-mind.com>

# USING THIS CONTAINER
# docker run \
#   --rm -ti --privileged --net=host --pid=host --ipc=host \
#   --device /dev/sdX:/dev/sdX \
#   -v /var/run/libvirt:/var/run/libvirt:rw \
#   -v /var/lib/libvirt:/var/lib/libvirt:rw skress/virt-install /bin/bash
#

RUN apt-get update && apt-get install -y vim openssh-client less cpio virtinst libvirt-clients libvirt-bin libosinfo-bin && rm -rf /var/lib/apt/lists/*

WORKDIR /root
CMD ["bash"]
