#!/usr/bin/env bash
################################################################################
# File       : yaksha-uninstall-debuntu.sh, a part of http://svaksha.github.io/yaksha
# Description: Bash UnInstallation script for removing packages.
# AUTHOR     : SVAKSHA, http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# DATES      : Created:2012may05 - Updated:2015sep05
# LICENSE    : GNU AGPLv3 License <http://www.gnu.org/licenses/agpl.html>
#              https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# This code is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR 
# A PARTICULAR PURPOSE. Permission is hereby granted, free of charge, to any 
# person obtaining a copy of this software, to deal in the Software without 
# restriction, including without limitation the rights to use, copy, modify, 
# merge, publish, redistribute, and/or sell copies of the Software and use in 
# source form, with or without modification, and to permit persons to whom the 
# Software is furnished to do so as per the terms in the LICENSE.md file and 
# subject to the following conditions being met:
# 1. ALL copies, forks and redistributions of source code AND/OR binary form 
#    must retain the above Copyright notice, the Licence file for source code 
#    (AGPLv3) along with this permission notice and list of conditions and the 
#    following disclaimer, in substantial portions of the Software.
# 2. Neither the name of the COPYRIGHT HOLDER(S) nor the names of its 
#    contributors may be used to endorse or promote products derived from this 
#    software without specific prior written permission.
################################################################################
#
# 
# Usage: "./yaksha-uninstall-debuntu.sh"

yaksha_dir=~/yaksha/

# Log the date and time of execution of bash script into the `out` files.
date +'%c|started running `apt-get`: ' >> out-yaksha-uninstall-debuntu.log
date +"%c|completed running: $?" >> out-yaksha-uninstall-debuntu.log

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


uninstall_typ='all'
key="$1"
   
    
case $uninstall_typ in
    unity)
        uninstall_unity
    ;;
    all)
        uninstall_unity
    ;;
    *)
        echo "UnInstallation in progress, almost done!"
    esac

