# @Author: Jorge Pinilla López <jorpilo>
# @Date:   06-04-2018 14:03
# @Filename: main.sh
# @Last modified by:   jorpilo
# @Last modified time: 06-04-2018 14:07


#Add folder to PATH
directory=$(pwd)
export PATH=$PATH$( find $directory/Scripts/ -type d -printf ":%p" )


#Check for configuration File
# -------

if [ ! -d "packages" ]; then
  echo "Warning: Creating packages folder"
  mkdir "packages"
fi
if [ ! -d "repos" ]; then
  echo "Warning: Creating repos folder"
  mkdir "repos"
fi
if [ ! -f "options.conf" ]; then
  echo "Warning: Creating options file"

  echo "locales=es_ES.UTF-8" >> options.conf
  echo "keyboard-layouts=es" >> options.conf
  echo "username=live-user" >> options.conf
  echo "live-config.login" >> options.con
  echo "live-config.user-default-groups=audio,cdrom,dip,floppy,video,plugdev,netdev,powerdev,scanner,bluetooth,fuse" >> options.conf

fi
if [ ! -f "config.conf" ]; then
    echo "Warning: Creating repo file"
    echo "#!/bin/bash" >> config.conf
    echo "export Mirror=http://softlibre.unizar.es/debian/" >> config.conf
    echo "export Distro=jessie" >> config.conf
    echo "export Arquitecture=i386" >> config.conf
fi
main-interface.sh
