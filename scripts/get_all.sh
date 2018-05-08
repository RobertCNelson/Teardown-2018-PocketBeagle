#!/bin/bash -e

web_mirror="http://rcn-ee.online/mirror/"

dl_web () {
	wget --progress=bar:force -c --directory-prefix=./${pre}/ ${web_mirror}${pre}/${file}
}

if [ ! -d ./toolchain ] ; then
	mkdir ./toolchain/
fi

if [ ! -d ./rootfs ] ; then
	mkdir ./rootfs/
fi

#pre="toolchain"
#file="gcc-linaro-6.4.1-2017.08-x86_64_arm-linux-gnueabihf.tar.xz"
#dl_web

#pre="linux"
#file="linux-4.14.tar.xz"
#dl_web

pre="u-boot"
file="u-boot-2018.03.tar.bz2"
dl_web

#pre="rootfs"
#file="debian-9.2-iot-armhf-2017-11-08.tar.xz"
#dl_web

if [ -f ./toolchain/gcc-linaro-6.4.1-2017.08-x86_64_arm-linux-gnueabihf/gcc-linaro-6.4.1-2017.08-linux-manifest.txt ] ; then
	rm -rf ./toolchain/gcc-linaro-6.4.1-2017.08-x86_64_arm-linux-gnueabihf/ || true
	echo "extracting: gcc-linaro-6.4.1-2017.08-x86_64_arm-linux-gnueabihf.tar.xz"
	cd ./toolchain/
	tar xf gcc-linaro-6.4.1-2017.08-x86_64_arm-linux-gnueabihf.tar.xz
	cd ../
else
	echo "extracting: gcc-linaro-6.4.1-2017.08-x86_64_arm-linux-gnueabihf.tar.xz"
	cd ./toolchain/
	tar xf gcc-linaro-6.4.1-2017.08-x86_64_arm-linux-gnueabihf.tar.xz
	cd ../
fi

if [ -f ./u-boot/u-boot-2017.11-rc4/Makefile ] ; then
	rm -rf ./u-boot/u-boot-2017.11-rc4/ || true
	echo "extracting: u-boot-2017.11-rc4.tar.bz2"
	cd ./u-boot/
	tar xf u-boot-2017.11-rc4.tar.bz2
	cd ../
else
	echo "extracting: u-boot-2017.11-rc4.tar.bz2"
	cd ./u-boot/
	tar xf u-boot-2017.11-rc4.tar.bz2
	cd ../
fi

if [ -f ./linux/linux-4.14/Makefile ] ; then
	rm -rf ./linux/linux-4.14/ || true
	echo "extracting: linux-4.14.tar.xz"
	cd ./linux/
	tar xf linux-4.14.tar.xz
	cd ../
else
	echo "extracting: linux-4.14.tar.xz"
	cd ./linux/
	tar xf linux-4.14.tar.xz
	cd ../
fi

if [ -f ./rootfs/debian-9.2-iot-armhf-2017-11-08/armhf-rootfs-debian-stretch.tar ] ; then
	rm -rf ./rootfs/debian-9.2-iot-armhf-2017-11-08/ || true
	echo "extracting: debian-9.2-iot-armhf-2017-11-08.tar.xz"
	cd ./rootfs/
	tar xf debian-9.2-iot-armhf-2017-11-08.tar.xz
	cd ../
else
	echo "extracting: debian-9.2-iot-armhf-2017-11-08.tar.xz"
	cd ./rootfs/
	tar xf debian-9.2-iot-armhf-2017-11-08.tar.xz
	cd ../
fi

