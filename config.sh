#!/bin/bash
# @Author: Jorge Pinilla López
# @Date:   06-03-2018 10:05
# @Filename: config.sh
# @Last modified by:   jorpilo
# @Last modified time: 07-03-2018 13:17

# Check if we're root and re-execute if we're not.
rootcheck () {
    if [ $(id -u) != "0" ]
    then
        echo "Please run it as root: sudo ./config.sh"
        exit 1
    fi
}

rootcheck
if [ -d "built" ]; then
  echo "Warning: Cleaning built folder"
  rm -rf "built"
fi
echo "Creating built folder"
mkdir built
cd built

Mirror="http://softlibre.unizar.es/debian/"
Locales="es_ES.UTF-8"
Keyboard="es"
UserName="live-user"
Groups="audio,cdrom,dip,floppy,video,plugdev,netdev,powerdev,scanner,bluetooth,fuse"
Desktop=""
lb config --binary-images iso-hybrid\
--mirror-bootstrap $Mirror --mirror-binary $Mirror\
--debian-installer live \
--debootstrap-options "--include=apt-transport-https" \
--bootappend-live 'boot=live components username='"$UserName"'locales='"$Locales"'keyboard-layouts='"$Keyboard"'live-config.login live-config.user-default-groups='"$Groups"

# Faltan desktops
echo "task-spanish-desktop task-spanish" >> config/package-lists/desktop.list.chroot
echo "task-spanish-kde-desktop" >> config/package-lists/desktop.list.chroot
cd ..
# Configure packages

../packages.sh
echo "Done"
