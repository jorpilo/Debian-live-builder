#!/bin/bash
# @Author: Jorge Pinilla López <jorpilo>
# @Date:   06-04-2018 14:10
# @Filename: clean.sh
# @Last modified by:   jorpilo
# @Last modified time: 06-04-2018 14:17
rm -r packages
rm -r repos
rm -r built
rm config.conf
rm options.conf

  echo "Warning: Creating packages folder"
  mkdir "packages"

  echo "Warning: Creating repos folder"
  mkdir "repos"

  echo "Warning: Creating options file"

  echo "locales=es_ES.UTF-8" >> options.conf
  echo "keyboard-layouts=es" >> options.conf
  echo "username=live-user" >> options.conf
  echo "live-config.login" >> options.conf
  echo "live-config.user-default-groups=audio,cdrom,dip,floppy,video,plugdev,netdev,powerdev,scanner,bluetooth,fuse" >> options.conf

    echo "Warning: Creating repo file"
    echo "#!/bin/bash" >> config.conf
    echo "export Mirror=http://softlibre.unizar.es/debian/" >> config.conf
    echo "export Distro=jessie" >> config.conf
    echo "export Arquitecture=i386" >> config.conf