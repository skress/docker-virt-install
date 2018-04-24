If you want to use virt-install to provision virtual machines (e.g. for KVM) but you don't want to install virt-install and hundreds of dependencies permanently on your host, then you can use this Docker image on your host to create the virtual machines.

Run the container as follows:
```bash
docker run \
   --rm -ti --privileged --net=host --pid=host --ipc=host \
   --device /dev/sdX:/dev/sdX \
   -v /var/run/libvirt:/var/run/libvirt:rw \
   -v /var/lib/libvirt:/var/lib/libvirt:rw skress/virt-install /bin/bash
```

/dev/sdX should be replaced with the device that you want to use for your virtual machine. If you want to use an LVM volume, you need to follow the symlink to the final device file, eg.
```bash
# ls -l /dev/vg00/test
lrwxrwxrwx 1 root root 7 Apr 24 15:16 /dev/vg00/test -> ../dm-5
```

... in this case you would use /dev/dm-5 instead of /dev/sdX.
