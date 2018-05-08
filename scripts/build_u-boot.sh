#!/bin/bash -e

CORES=$(getconf _NPROCESSORS_ONLN)
ARCH=$(uname -m)

if [ "x${ARCH}" = "xarmv7l" ] ; then
	#Native arm gcc compiler
	CC=
	CORES=2
else
	export CC=`pwd`/toolchain/gcc-linaro-6.4.1-2017.08-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
fi

cd ./u-boot/u-boot-2018.03/

if [ ! -f ./.rcnee.patched ] ; then
	patch -p1 < ../0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
	patch -p1 < ../0002-U-Boot-BeagleBone-Cape-Manager.patch
	touch ./.rcnee.patched
fi

make ARCH=arm CROSS_COMPILE=${CC} distclean
make ARCH=arm CROSS_COMPILE=${CC} am335x_evm_defconfig
time make -j${CORES} ARCH=arm CROSS_COMPILE=${CC}

if [ ! -d ../../deploy/ ] ; then
	mkdir ../../deploy/
fi

if [ -f ./MLO ] ; then
	cp -v ./MLO ../../deploy/MLO
fi

if [ -f ./u-boot.img ] ; then
	cp -v ./u-boot.img ../../deploy/u-boot.img
fi

cd ../../

ls -lh ./deploy/
