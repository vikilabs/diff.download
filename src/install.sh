#! /bin/bash

INSTALL_DIR="/usr/bin"
UTILITY_NAME="diff_download"

get_installation_directory(){
    echo "[ status   ] Identifying Host System"
    linux_system=`uname -srm | grep -i "linux"`
    mac_system=`uname -srm | grep -i "darwin"`

    if [ ! -z "$linux_system" ]; then
        echo "[ status ] Linux System "
        INSTALL_DIR="/usr/bin"
    fi

    if [ ! -z "$mac_system" ]; then
        echo "[ status ] Mac System"
        INSTALL_DIR="/opt/local/bin/"
    fi
}

install_package(){
    chmod +x $UTILITY_NAME
    #check sudo 
    cp $UTILITY_NAME $INSTALL_DIR
}

check_installation_status(){
    if [ $1 -eq 0 ]; then
        echo "[ success ] $UTILITY_NAME installation is successful"
    else
        echo "[ failure ] $UTILITY_NAME installation failed, You should have sudo or root access to install this package"
    fi
}

get_installation_directory
install_package
check_installation_status $?

