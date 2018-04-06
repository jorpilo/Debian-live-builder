#!/bin/bash
# @Author: Jorge Pinilla López <jorpilo>
# @Date:   31-03-2018 10:42
# @Filename: add_other_repo.sh
# @Last modified by:   jorpilo
# @Last modified time: 06-04-2018 13:42

# Usage: add_other_repo repo_name repo_url distro repo_packages
# Update files in repos/ and packages/ adding the new repo

  grep -q -w $1 repos/external_repos
  if [ $? -eq 0 ]; then
      return 1
      break
  else
      mkdir packages/$1
      repo=$(change_mirror.sh "$2")
      if [ $? -ne 0 ]; then
        rm -rf packages/$1
        exit 2
      else
        echo "deb $repo $3 ${@:5}" > packages/$1/$1.list
        echo "$1" "$2" >> repos/external_repos
      fi
  fi
