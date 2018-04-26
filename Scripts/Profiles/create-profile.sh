#!/bin/bash
# @Author: Jorge Pinilla López
# @Date:   26-04-2018 8:40
# @Filename: config.sh
# @Last modified by:   jorpilo
# @Last modified time: 26-04-2018 8:40

# Check if we're root and re-execute if we're not.

# Usage: create-profile.sh profilename packagefile

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
packages=$(echo $2)

debootstrap --arch $Arquitecture $Distro profiles/$1
chroot profiles/$1 "apt install -y $packages"
cd profiles
tar cvzf $1.tar.gz $1
exit 0



