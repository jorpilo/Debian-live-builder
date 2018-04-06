# @Author: Jorge Pinilla López <jorpilo>
# @Date:   06-04-2018 20:10
# @Filename: main-inteface.sh
# @Last modified by:   jorpilo
# @Last modified time: 06-04-2018 20:17

dialog --editbox config.conf 28 125 2> /tmp/temp
if [ $? -eq 0 ]; then
    if [ ! -s /tmp/temp ]
    then
        mv /tmp/temp config.conf
        chmod u+x config.conf
        rm /tmp/temp
    fi
fi
     
dialog --editbox options.conf 28 125 2> /tmp/temp
if [ $? -eq 0 ]; then
    if [ ! -s /tmp/temp ]
    then
        mv /tmp/temp config.conf
        chmod u+x options.conf
        rm /tmp/temp
    fi
fi
     