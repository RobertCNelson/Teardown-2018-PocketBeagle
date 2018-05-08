#!/bin/bash -e
#set -x

ARCH=$(uname -m)

if [ "x${ARCH}" = "xarmv7l" ] ; then
	#Native arm gcc compiler
	MMC=/dev/mmcblk0
else
	. system.sh
fi

if [ "x${MMC}" = "x" ] ; then
	echo "Error, please set MMC in system.sh"
	exit 1
fi

if [ -f ./deploy/MLO ] ; then
	sudo dd if=./deploy/MLO of=${MMC} count=1 seek=1 bs=128k
fi
if [ -f ./deploy/u-boot.img ] ; then
	sudo dd if=./deploy/u-boot.img of=${MMC} count=2 seek=1 bs=384k
fi

sync
