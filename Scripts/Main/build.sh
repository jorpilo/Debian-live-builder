#!/bin/bash
# @Author: Jorge Pinilla López
# @Date:   06-03-2018 10:05
# @Filename: config.sh
# @Last modified by:   jorpilo
# @Last modified time: 06-04-2018 14:12

# Check if we're root and re-execute if we're not.

rootcheck () {
        if [ $(id -u) != "0" ]
        then
            echo 1
        else
          echo 0
        fi
    }

if [ $(rootchecks) -ne 0 ]; then
    exit 1
fi
source config.conf
if [ -d "built" ]; then
  echo "Warning: Cleaning built folder"
  rm -rf "built"
fi
echo "Creating built folder"
mkdir built
cd built


Options= $(echo config.conf)
Mirror= $(echo main-repo.conf)

Desktop=""
lb config --binary-images iso-hybrid \
--mirror-bootstrap $Mirror --mirror-binary $Mirror \
--debian-installer live \
--arquitectures $Arquitecture \
--distribution $Distro \
--debootstrap-options "--include=apt-transport-https" \
--bootappend-live 'boot=live components $Options'

# Faltan desktops
echo "task-spanish-desktop task-spanish" >> config/package-lists/desktop.list.chroot
echo "task-spanish-kde-desktop" >> config/package-lists/desktop.list.chroot
cd ..
# Configure packages

packages.sh
echo "Done"

cd built
lb build