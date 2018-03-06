#!/bin/bash
# @Author: Jorge Pinilla López
# @Date:   06-03-2018 10:05
# @Filename: config.sh
# @Last modified by:   Jorge Pinilla López
# @Last modified time: 06-03-2018 10:53
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
--bootappend-live 'boot=live components username='"$UserName"'locales='"$Locales"'keyboard-layouts='"$Keyboard"'live-config.login live-config.user-default-groups='"$Groups"

# Faltan desktops
echo "task-spanish-desktop task-spanish" >> config/package-lists/desktop.list.chroot
echo "task-spanish-kde-desktop" >> config/package-lists/desktop.list.chroot
cd ..
# Configure packages

../packages.sh
echo "Done"
