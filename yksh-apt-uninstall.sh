#!/usr/bin/env bash
################################################################################
# FILE       : yaks-apt-uninstall.sh
# DESCRIPTION: Bash UnInstallation script for removing debian-ubuntu packages.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2012may05 - Updated:2016jan14
################################################################################
#
# 
# Usage: "./yaks-apt-uninstall.sh"

yaksha_dir=~/yaksha/

# Log the date and time of execution of bash script into the `out` files.
date +'%c|started running `apt-get`: ' >> out-yaks-apt-uninstall.log
date +"%c|completed running: $?" >> out-yaks-apt-uninstall.log

# UNINSTALL UNITY on ubuntu 14.04 - dont do this without installing GNOME first.
# http://askubuntu.com/questions/6302/how-can-you-remove-unity
# http://askubuntu.com/questions/651013/can-i-remove-unity-now-and-how?
function uninstall_unity() {
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sudo apt-get -y remove unity unity-2d 
    sudo apt-get -y remove unity-2d-panel unity-2d-spread 
    sudo apt-get -y remove unity-common unity-2d-common 
    sudo apt-get -y remove unity-asset-pool unity-services 
    sudo apt-get -y remove unity-lens-files gir1.2-unity-5.0 
    sudo apt-get -y remove unity-lens-music unity-lens-applications 
    sudo apt-get -y remove nux-tools libunity-misc4 
    sudo apt-get -y remove indicator-sound indicator-power 
    sudo apt-get -y remove indicator-appmenu libindicator7 
    sudo apt-get -y remove indicator-application indicator-datetime 
    sudo apt-get -y remove indicator-messages libnux-2.0-0 
    # Remove AMAZON shopping lens
    sudo apt-get -y remove unity-webapps-common    
}


uninstall_unity='all'
key="$1"
   
    
case $uninstall_unity in
    unity)
        uninstall_unity
    ;;
    all)
        uninstall_unity
    ;;
    *)
        echo "UnInstallation in progress, almost done!"
    esac

