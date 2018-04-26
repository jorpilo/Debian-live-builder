# @Author: Jorge Pinilla López <jorpilo>
# @Date:   06-04-2018 14:10
# @Filename: main-inteface.sh
# @Last modified by:   jorpilo
# @Last modified time: 06-04-2018 14:17


rootcheck () {
        if [ $(id -u) != "0" ]
        then
            echo 1
        else
          echo 0
        fi
    }


while true; do
result=$(dialog  --clear --backtitle "Debian-live-builder" --title "Package configuration" \
         --menu "You can use the arrows" 0 0 0 \
                 build "Build the iso"  \
                 configure "Configure iso"  \
                 packages "Select packages and repositoies"  \
                 clean "Clean all folders" \
                 exit "exit configuration" 3>&1 1>&2 2>&3 3>$-)


if [ $? -ne 0 ]; then
  clear
  rm hB
  exit 0
fi
case $result in
    build)
    if [ $(rootcheck) -eq 0 ]; then
      build.sh
    else
      echo "" | sudo -S ./Scripts/Main/build.sh
      if [ $? -ne 0 ]; then
          password=$(dialog --title "Password" \
          --clear \
          --passwordbox "Enter your password (password not showing)" 0 0 3>&1 1>&2 2>&3 3>$-)
          echo $password | sudo -S ./Scripts/Main/build.sh|| dialog --title "Error" --msgbox "Error: $?" 0 0
      fi
    fi
        ;;
    configure)
      configure.sh
          ;;
    packages)
        configure_packages.sh
          ;;
    clean)
        clean.sh
        dialog --title "Clean" --msgbox "Folders and options cleaned" 0 0
          ;;
      exit)
        clear
        rm hB
        exit 0
        ;;

esac
done
