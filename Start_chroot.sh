~ $ cat Start_Chroot.sh

#!/bin/bash

unset LD_PRELOAD

export DS=/data/data/com.termux/files/home/Ubuntu

su -c mkdir -p  Ubuntu/dev Ubuntu/proc Ubuntu/odm Ubuntu/vendor Ubuntu/system Ubuntu/sys Ubuntu/sdcard Ubuntu/data Ubuntu/dev/pts Ubuntu/apex Ubuntu/apex/com.android.runtime

#su -c echo "nameserver 1.1.1.1" > $DS/etc/resolv.conf

echo "Mounting...."

################

su -c mount -o bind   /dev $DS/dev

su -c mount -o bind  /dev/pts/ $DS/dev/pts/

#su -c mount   /dev/binderfs/ $DS/dev/binderfs/

su -c mount -t proc /proc $DS/proc

su -c mount -o bind /storage/emulated/0 $DS/sdcard

su -c mount -o bind  /sys $DS/sys

su -c mount  /data $DS/data/

su -c mount /odm/ $DS/odm

su -c mount /vendor/ $DS/vendor/

su -c mount /system/ $DS/system/

#su -c mount /system_ext/ $DS/system_ext

#su -c mount  /apex/com.android.runtime $DS/apex/com.android.runtime

#su -c mount /apex/com.android.art\@1// $DS/apex/com.android.art\@1/

################

echo "Starting...."

#Starting script will be here

/system/bin/env -i

su -c /system/bin/chroot  $DS \

/bin/env -i  \

HOME="/root" \

USER="root" \

SHELL="/bin/bash" \

HOME="/root" \

PATH="/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games:/opt/wine/bin:/opt/libhybris/bin/" \

TERM="xterm" \

BASH="/usr/bin/bash" \

SHELL="/usr/bin/bash" \

PREFIX="/usr" \

TMDIR="/tmp" \

LD_LIBRARY_PATH="/lib:/usr/lib:/usr/lib/i386-linux-gnu/:/var/lib:/var/lib/dpkg/:/lib/i386-linux-gnu:/usr/local/lib:/opt/wine/lib:/opt/wine/lib/wine:/opt/wine/lib:/lib:/lib/wine:/lib/wine/fakedlls:/usr/lib/x86_64-linux-gnu/:/lib64:/usr/lib/aarch64-linux-gnu:/usr/local/lib/aarch64-linux-gnu:/usr/local/lib/" \

/bin/bash --login +h

echo "Unmounting"

#################

function unount(){

su -c umount $DS/dev/pts 2>&1 >/dev/null

su -c umount $DS/dev     2>&1 >/dev/null

su -c umount $DS/sdcard  2>&1 >/dev/null

su -c umount $DS/sys     2>&1 >/dev/null

su -c umount $DS/proc    2>&1 >/dev/null

su -c umount $DS/odm     2>&1 >/dev/null

su -c umount $DS/vendor  2>&1 >/dev/null

su -c umount $DS/system  2>&1 >/dev/null

su -c umount $DS/data    2>&1 >/dev/null

su -c umount $DS/system/ 2>&1 >/dev/null

su -c umount $DS/apex/com.android.runtime 2>&1 >/dev/null

su -c umount $DS/apex/* 2>&1 >/dev/null

su -c umount $DS/apex/   2>&1 >/dev/null

su -c umount $DS/system_ext 2>&1 >/dev/null

su -c umount $DS/apex/com.android.art\@1/ 2>&1 >/dev/null

su -c umount $DS/dev/* >/dev/null

}

unount

unount

unount

unount

#################

echo "Done ."
