#!/usr/bin/env bash
################################################################################
# FILE       : yaks-update.sh
# DESCRIPTION: Update my Debian-Ubuntu system for each Cronjob the machine runs.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2006mar31 - Updated:2016mar11
################################################################################
#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# A script for weekly system updates.
# Usage: "./yaks-apt-update.sh"
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Clear the Terminal.
clear
# directory
yaksha_dir=~/yaksha/

# Log the date and time of execution of bash script into the `output` files.
date +"%c|started running `apt-get`:$?" >> out-yaks-apt-update-cron.log
date +"%c|completed running: $?" >> out-yaks-apt-update-cron.log

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# Updating requires sudo privs so lets check for root.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

if [ "$(whoami)" != "root" ]; then
  # if not root,
  echo -e "\e[1mError: This command needs root permissions!"
  # Ask for perm to execute as root.
  echo -e "\e[1mPlease execute me as root, i.e [sudo yaks-apt-update.sh]"
  echo -e "\e[0m"
  exit 1
else
  # if root, then check for internet connection. D needs this.
  wget -q --tries=10 --timeout=25 --spider http://google.com &> /dev/null
  if [[ $? -eq 0 ]]; then
    # If connected to the internet, just continue to execute the script.
    : # this is an empty command.
  else
    # But if not connected to the internet, post error message.
    echo "Kshama karein, internet connection nahin hai!"
    echo "Please check your connection."
    exit 1
  fi

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# Cron will automatically install the weekly updates
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function update_deb() {
    echo "Remember to finish installation with a dist-upgrade"
    # Echo more messages
    echo '******************************************************'
    echo "* yaks-apt-update.sh |    Yaksha Update Script     | `hostname -f` *"
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
    echo "This machine is currently being updated with Conda system packages!"
    sleep 1
    # Are we done yet? 
    echo "Finished updating Anaconda :-)"
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Non-Free
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function update_nonfree() {
    ## update FLASH
    sudo apt-get -y update-flashplugin-nonfree --install
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
    nonfree)
        update_nonfree
    ;;
    all)
        update_deb
        update_conda
        update_nonfree
    ;;
    *)
        echo "Installation in progress, almost done!"
    esac
    
