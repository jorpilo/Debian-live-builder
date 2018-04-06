#!/bin/bash
# @Author: Jorge Pinilla López
# @Date:   06-03-2018 10:21
# @Filename: packages.sh
# @Last modified by:   Jorge Pinilla López
# @Last modified time: 06-03-2018 12:14
copy_packages()
{
  for list in $1*.packages ; do
    # add the sources (*.list) to chroot stage and sources.list.d
    if [ "$list" != "$1*.packages" ]; then
      base=$(basename $list)
      cp "$list" "../built/config/package-lists/${base%%.*}.list.chroot"
    fi
  done
  for list in $1*.list ; do
    # add the sources (*.list) to chroot stage and sources.list.d
    if [ "$list" != "$1*.list" ]; then
      cp "$list" '../built/config/archives/'"$(basename $list)"'.chroot'
      cp "$list" '../built/config/archives/'"$(basename $list)"'.binary'
    fi
  done
  for list in $1*.key ; do
    # add the keyfiles (*.key) to chroot stage and sources.list.d
    if [  "$list" != "$1*.key"  ]; then
      cp "$list" '../built/config/archives/'"$(basename $list)"'.chroot'
      cp "$list" '../built/config/archives/'"$(basename $list)"'.binary'
    fi
  done
}

cd packages
echo "Configuring packages"
copy_packages ./

echo "Configuring packages from subfolders"

for folder in */ ; do
  echo "$folder"
  copy_packages $folder
done

cd ..
