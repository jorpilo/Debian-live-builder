#!/bin/bash
# @Author: Jorge Pinilla López <jorpilo>
# @Date:   31-03-2018 10:36
# @Filename: change_mirror.sh
# @Last modified by:   jorpilo
# @Last modified time: 06-04-2018 13:53

#Usage: change_mirror new_mirror
#returns new mirror if accepted

wget -q --spider www.google.es
if [ $? -ne 0 ]; then
  dialog --clear --title "Error" --msgbox "No internet" 0 0 3>&1 1>&2 2>&3 3>$-
  break
fi
wget -q --spider $1
if [ $? -ne 0 ]; then
  dialog --clear --title "Error" --msgbox "Bad url" 0 0 3>&1 1>&2 2>&3 3>$-
  change_mirror
else
  dialog --clear --title "Accepted" --msgbox "Accepted" 0 0 3>&1 1>&2 2>&3 3>$-
  echo "$1"
fi
