# @Author: Jorge Pinilla López <jorpilo>
# @Date:   31-03-2018 10:46
# @Filename: delete_repo.sh
# @Last modified by:   jorpilo
# @Last modified time: 31-03-2018 10:49

#Usage: delete_repo reponame
#Delete reponame repository

var=$(grep "$1" repos/external_repos | head -1)
repo=($var)
rm -rf packages/${repo[0]}
sed -i "/${repo[0]}/d" repos/external_repos
