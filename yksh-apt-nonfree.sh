#!/usr/bin/env bash
################################################################################
# FILE       : yaks-apt-nonfree.sh
# DESCRIPTION: Bash script to install some Non-Free programs. 
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2015jul22 - Updated:2016feb26
################################################################################
#
# References:
# https://github.com/svaksha/aksh/blob/master/cs-debuntu.md 
# https://github.com/svaksha/aksh/blob/master/cs-devops.md
#-------------------------------------------------------------------------------

# Moved the non-free proprietary non-foss libs that are not needed on the server side.

yaksha_dir=~/yaksha/

# Log the date and time of execution of bash script into the `out` files.
date +'%c|started running `apt-get`: ' >> out-yaks-apt-nonfree.log
date +"%c|completed running: $?" >> out-yaks-apt-nonfree.log

# Ask for the administrator password first.
sudo -v

# Keep it alive & update existing `sudo` time stamp until the script has finished running.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Change to Debian-Jessie running KDE desktop.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_flashplugin() {
    sudo apt-get -y update
    sudo apt-get -y upgrade
    # Restricted extras for FLASH plugin
    sudo apt-get -y install flashplugin-nonfree
    sudo apt-get -y install flashplugin-nonfree-extrasound
    sudo apt-get -y install pepperflashplugin-nonfree
}


