#!/bin/bash
# @Author: Jorge Pinilla López <jorpilo>
# @Date:   12-03-2018 14:07
# @Filename: configure_packages.sh
# @Last modified by:   jorpilo
# @Last modified time: 06-04-2018 13:54

source config.conf

while true; do
result=$(dialog  --clear --backtitle "Debian-live-builder" --title "Package configuration" \
         --menu "You can use the arrows" 0 0 0 \
                 configure_main "Configure main repository"  \
                 select_main_packages "Select packages from main repository"  \
                 manage_other_repos "Add, delete other repositories and select packages" \
                 exit "exit configuration" 3>&1 1>&2 2>&3 3>$-)


if [ $? -ne 0 ]; then
  clear
  exit 0
fi
case $result in
    configure_main)
    repo_url=$(dialog --title "Main repository" --clear --backtitle "Debian-live-builder" --inputbox "write repository URL:" 0 40 "$Mirror" 3>&1 1>&2 2>&3 3>$-)
    if [ $? -eq 0 ]; then
      New_Mirror=$(change_mirror.sh "$repo_url")
      if [ ! -z "$New_Mirror" ]; then
        Mirror="$New_Mirror"
        sed -i /Mirror/c\Mirror=$Mirror config.conf
      fi
    fi
        ;;
    select_main_packages)
      manage_repo.sh main "$Mirror"
          ;;
      manage_other_repos)
        other_repos.sh "$Distro"
          ;;
      exit)
        clear
        exit 0
        ;;

esac
done
