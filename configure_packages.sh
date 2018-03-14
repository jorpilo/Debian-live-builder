#!/bin/bash
# @Author: Jorge Pinilla López <jorpilo>
# @Date:   12-03-2018 14:07
# @Filename: configure_packages.sh
# @Last modified by:   jorpilo
# @Last modified time: 14-03-2018 10:32




Architecture="i386"
Distro="stretch"
Mirror="http://ftp.de.debian.org/"

change_mirror()
{
  Test_mirror=$(dialog --title "Main repository" --clear --backtitle "Debian-live-builder" --inputbox "write main repository:" 0 40 "$1" 3>&1 1>&2 2>&3 3>$-)
  if [ $? -ne 0 ]; then
    main
  else
    echo "Testing mirror"
    wget -q --spider www.google.es
    if [ $? -ne 0 ]; then
      dialog --title "Error" --msgbox "No internet" 0 0
      main
    fi
    wget -q --spider $Test_mirror/debian
    if [ $? -ne 0 ]; then
      dialog --title "Error" --msgbox "Bad url" 0 0
      change_mirror
    else
      dialog --title "Accepted" --msgbox "Accepted" 0 0
      echo "$Test_mirror"
    fi
fi

}
listrepo()
{
  wget -q --spider $1/debian/
  if [ $? -ne 0 ]; then
    dialog --title "Error" --msgbox "No internet" 0 0
    main
  fi
   wget -q -O repos/main.gz $1/debian/dists/jessie/non-free/binary-amd64/Packages.gz
   if [ $? -ne 0 ]; then
     dialog --title "Error" --msgbox "No internet" 0 0
     main
   fi
   zcat repos/main.gz | awk ' /Package:/{print $2} /Description:/{print substr($0, index($0,$2))}' > repos/$2.raw
   sed -i "s/'//g" repos/main.raw
   sed -i 's/"//g' repos/main.raw
   rm repos/main.check
   if [ ! -f packages/$2.packages ]; then
    echo "" > packages/$2.packages
  fi
    while read package; do
        read description
        echo \""$description"\" >> test
        grep -q -w $package packages/$2.packages
        if [ $? -eq 0 ]; then
            echo "$package" \""$description"\" on >> repos/main.check
        else
            echo "$package" \""$description"\" off >> repos/main.check
        fi
    done < repos/$2.raw
    packages=$(dialog --checklist "Choose toppings:" 0 0 0 --file repos/main.check 3>&1 1>&2 2>&3 3>$-)
    printf "%s\n" $packages  > packages/$2.packages
}

other_repos()
{
  result=$(dialog  --clear --backtitle "Debian-live-builder" --title "Other repos configuration" \
           --menu "You can use the arrows" 0 0 0 \
                   list "list other repositories"  \
                   add "add a new repository"  \
                   delete "delte one repository" \
                   exit "exit configuration" 3>&1 1>&2 2>&3 3>$-)
 if [ $? -ne 0 ]; then
   clear
   main
 fi
 case $result in
     list)
       dialog --title "External repositories" --msgbox $(cat repos/external_repos) 0 0
         ;;
     add)
      add_repo=$(dialog --title "new repository" --clear --backtitle "Debian-live-builder" --inputbox "write new repository:" 0 40  3>&1 1>&2 2>&3 3>$-)
      if [ $? -ne 0 ]; then
        other_repos
      else
        grep -q -w $add_repo repos/external_repos
        if [ $? -eq 0 ]; then
            dialog --title "Error" --msgbox "Repo name already in repos list" 0 0
            other_repos
        else
            mkdir packages/$add_repo
            repo=$(change_mirror "$repo")
            packages=$(dialog --title "Other repository" --clear --backtitle "Debian-live-builder" --inputbox "write repositories packages:" 0 40 "main contrib non-free" 3>&1 1>&2 2>&3 3>$-)
            if [ $? -ne 0 ]; then
              rm -rf packages/$add_repo
              other_repos
            else
              echo "deb $repo $Distro $packages" > packages/$add_repo/$add_repo.list



            fi
        fi
    fi
           ;;
     delete)
     ;;
      exit)
         clear
         main
         ;;
 esac

}



main()
{
result=$(dialog  --clear --backtitle "Debian-live-builder" --title "Package configuration" \
         --menu "You can use the arrows" 0 0 0 \
                 configure_main "Configure main repository"  \
                 select_main_packages "Select packages from main repository"  \
                 other_repos "Item n° 3" \
                 select_others_packages "Item n° 4" \
                 exit "exit configuration" 3>&1 1>&2 2>&3 3>$-)


if [ $? -ne 0 ]; then
  clear
  exit 0
fi
case $result in
    configure_main)
      Mirror=$(change_mirror "$Mirror")
        ;;
    select_main_packages)
      listrepo "$Mirror" main
          ;;
      other_repos)

          ;;
      select_others_packages)
          ;;
      exit)
        clear
        exit 0
        ;;
esac
main
}
main
