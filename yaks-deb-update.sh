#!/usr/bin/env bash
################################################################################
# File       : yaks-deb-update.sh
# Description: Update my Debian-Ubuntu system for each Cronjob the machine runs.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, AllRightsReserved.
# DATES      : Created:2006mar31 - Updated:2015dec25
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
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# A script for weekly system updates.
# Usage: "./yaks-deb-update.sh"
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Clear the Terminal.
clear
# directory
yaksha_dir=~/yaksha/

# Log the date and time of execution of bash script into the `output` files.
date +"%c|started running `apt-get`:$?" >> out-yaks-deb-update-cron.log
date +"%c|completed running: $?" >> out-yaks-deb-update-cron.log

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# Cron will automatically install the weekly updates
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function update_deb() {
    echo "Remember to finish installation with a dist-upgrade"
    # Echo more messages
    echo '******************************************************'
    echo "* yaks-deb-update.sh |    Yaksha Update Script     | `hostname -f` *"
    echo '******************************************************'
    # resynchronize the package index files from their internet sources to fetch the latest packages
    sudo apt-get -y update
    # Install the newest versions of all packages currently installed on this system.
    sudo apt-get -y upgrade
    # Install kernel updates on a Ubuntu LTS server and the "smart" conflict
    # resolution system can handle changing dependencies with new package versions.
    sudo apt-get -y dist-upgrade
    sudo apt-get -y safe-upgrade
    # Remove junk stuff
    #sudo apt-get --purge autoremove
    # Now clean the installed packages
    sudo apt-get -y clean
    sudo apt-get -y autoclean
    # Are we done? 
    echo "Finished updating debuntu :-)"
}    

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# Dont forget to update Anaconda
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function update_conda() {
    cd
    cd anaconda3
    conda update -y conda
    conda update -y anaconda
    cd
    cd yaksha
    # Are we done yet? 
    echo "Finished updating Anaconda :-)"
}


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Funcs
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

update_deb='all'
key="$1"
key="$2"

case $key in
    -c|--clean)
        update_deb="$1"
        shift
    ;;
    -u|--update)
        update_deb="$2"
        shift
    ;;
    *)
        echo "usage:
                -c|--clean  - remove dotfiles before installation
                -u|--update [type] copy the yaksha dotfiles into home"
    ;;
    esac
    
    
case $update_deb in
    debupdate)
        update_deb
    ;;
    conda)
        update_conda
    ;;
    all)
        update_deb
        update_conda
    ;;
    *)
        echo "Installation in progress, almost done!"
    esac
    
