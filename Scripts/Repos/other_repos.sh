#!/bin/bash
# @Author: Jorge Pinilla López <jorpilo>
# @Date:   31-03-2018 10:44
# @Filename: other_repos.sh
# @Last modified by:   jorpilo
# @Last modified time: 06-04-2018 13:21

# Usage: other_repos distro
# Show other repos menu

source config.conf

if [ ! -f repos/external_repos ]; then
  touch repos/external_repos
fi
while true; do
result_2=$(dialog  --clear --backtitle "Debian-live-builder" --title "Other repos configuration" \
         --menu "You can use the arrows" 0 0 0 \
                 manage "select packages from other repos"  \
                 add "add a new repository"  \
                 delete "delte an external repository"  \
                 exit "exit configuration" 3>&1 1>&2 2>&3 3>$-)
if [ $? -ne 0 ]; then
 clear
 break
fi
case $result_2 in
   manage)
    if [ -s repos/external_repos ]; then
      var=$(dialog --menu "repositories:" 0 0 0 --file repos/external_repos 3>&1 1>&2 2>&3 3>$-)
      if [ $? -ne 0 ]; then
        break
      else
          manage_repo.sh "$var"
      fi
    else
      dialog --title "External repositories" --msgbox "No repositories" 0 0
    fi
       ;;
   add)
     repo_name=$(dialog --title "Repository name" --clear --backtitle "Debian-live-builder" --inputbox "write repository name:" 0 40 "example" 3>&1 1>&2 2>&3 3>$-)
     if [ $? -ne 0 ]; then
       break
     else
       repo_url=$(dialog --title "Main repository" --clear --backtitle "Debian-live-builder" --inputbox "write repository URL:" 0 40 "http://example.com/" 3>&1 1>&2 2>&3 3>$-)
       if [ $? -ne 0 ]; then
         break
       else
         packages=$(dialog --title "Other repository" --clear --backtitle "Debian-live-builder" --inputbox "write repositories packages:" 0 40 "main contrib non-free" 3>&1 1>&2 2>&3 3>$-)
         if [ $? -ne 0 ]; then
           break
        else
           add_other_repo.sh "$repo_name" "$repo_url" "$distro" "$packages"
           if [ $? -eq 1 ]; then
             dialog --title "Error" --msgbox "Repo name already in repos list" 0 0
           fi
           if [ $? -eq 2 ]; then
             dialog --title "Error" --msgbox "Error testing $repo_url" 0 0
           fi
        fi
      fi
    fi
      ;;
   delete)
   if [ -s repos/external_repos ]; then
      reponame=$(dialog --menu "repositories:" 0 0 0 --file repos/external_repos 3>&1 1>&2 2>&3 3>$-)
      if [ $? -ne 0 ]; then
          break
      else
        delete_repo.sh  "$reponame"
      fi
    else
      dialog --title "External repositories" --msgbox "No repositories" 0 0
    fi

     ;;
    exit)
       clear
       break
    ;;
esac
done
