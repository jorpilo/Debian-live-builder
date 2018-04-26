#!/bin/bash
# @Author: Jorge Pinilla López <jorpilo>
# @Date:   31-03-2018 10:38
# @Filename: list_repo.sh
# @Last modified by:   jorpilo
# @Last modified time: 06-04-2018 13:50

#Usage: manage_repo reponame (for /repos/external_repos)
#       manage_repo reponame repourl 
#Create a file in packages/name/name.package with the packages selected from the repo


if [ $# -eq 2 ]; then
  repo=($1 "$2")
else
  var=$(grep "$1" repos/external_repos | head -1)
  repo=($var)
fi
wget -q --spider ${repo[1]}
if [ $? -ne 0 ]; then
  dialog --title "Error" --msgbox "No internet" 0 0
  exit 1
fi
 wget -q -O /tmp/${repo[0]}.gz ${repo[1]}/dists/$Distro/main/binary-$Arquitecture/Packages.gz
 if [ $? -ne 0 ]; then
   dialog --title "Error" --msgbox "Couldn't download packages from ${repo[1]}" 0 0
   exit 1
 fi
 zcat /tmp/${repo[0]}.gz | awk '/Package:/{print $2} /Description:/{$1 = ""; print $0}' > /tmp/${repo[0]}.raw
 sed -i "s/'//g" /tmp/${repo[0]}.raw
 sed -i 's/"//g' /tmp/${repo[0]}.raw

 echo ${repo[0]}
 if [ ! -d packages/${repo[0]} ]; then
  mkdir packages/${repo[0]}
 fi
 if [ ! -f packages/${repo[0]}/${repo[0]}.packages ]; then
  echo "" > packages/${repo[0]}/${repo[0]}.packages
  echo "Create packages file"
fi
  while read package; do
      read description
      echo \""$description"\" >> test
      grep -q -w $package packages/${repo[0]}/${repo[0]}.packages
      if [ $? -eq 0 ]; then
          echo "$package" \""$description"\" on >> /tmp/${repo[0]}.check
      else
          echo "$package" \""$description"\" off >> /tmp/${repo[0]}.check
      fi
  done < /tmp/${repo[0]}.raw
  if [ ! -d packages/${repo[0]} ]; then
    mkdir packages/${repo[0]}
  fi
  packages=$(dialog --checklist "Choose packages:" 0 0 0 --file /tmp/${repo[0]}.check 3>&1 1>&2 2>&3 3>$-)
  if [ $? -eq 0 ]; then
    printf "%s\n" $packages  > packages/${repo[0]}/${repo[0]}.packages
  fi
  rm /tmp/${repo[0]}*
