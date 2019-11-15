#!/bin/bash

cat /etc/os-release | grep -i "NAME=\"Ubuntu*"

if [ $? -ne 0 ] ;then
    cat /etc/os-release | grep -i "NAME=\"CentOS*"  
    if [ $? -ne 0 ] ;then
        exit 1
    fi
    echo "is an CentOS!"
    sudo yum install -y man
    #sudo yum install -y man-pages-zh
else
    echo "grep return zero value, is an ubuntu system!"
    sudo apt-get install -y manpages-de manpages-de-dev  manpages-dev glibc-doc manpages-posix-dev manpages-posix 
    sudo apt-get install -y manpages-zh
fi



