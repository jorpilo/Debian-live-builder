#!/bin/bash
# @Author: Jorge Pinilla López
# @Date:   26-04-2018 8:40
# @Filename: config.sh
# @Last modified by:   jorpilo
# @Last modified time: 26-04-2018 8:40

# Usage: install-profile path-to-chroot
# NOT WORKING!!

mkdir $1/tmp
chmod 1777 $1/tmp
mkdir $1/tmp/.X11-unix
chmod 1777 $1/tmp/.X11-unix
ln -f /tmp/.X11-unix/X? $1/tmp/.X11-unix/X?

xauth extract $1/.Xauthority host/unix:1
xauth -f $1/.Xauthority list
xauth extract - host/unix:1 | sudo xauth -f $1/.Xauthority merge -
export XAUTHORITY=$1/.Xauthority