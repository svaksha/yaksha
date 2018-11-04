#!/usr/bin/env bash
################################################################################
# FILE       : update.sh
# DESCRIPTION: Update my Ubuntu system for each Cronjob the machine runs.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2006mar31 - Updated:2018aug12
################################################################################
#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# A script for regular system updates.
# Usage: "./yaksha/ubuntu/apt-update-update.sh"
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Clear the Terminal.
clear
# directory
yaksha_dir=~/yaksha/

# Log the date and time of execution of bash script into the `output` files.
date +"%c|started running `apt-get`:$?" >> out-update-cron.log
date +"%c|completed running: $?" >> out-update-cron.log


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# Check for root permissions.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
if [ "$(whoami)" != "root" ]; then
  #Not root? Request execution as root.
  echo -e "\e[1mHello! I don't have root permissions!"
  echo -e "\e[1mPlease execute me as root, i.e [sudo ~/yaksha/ubuntu/update.sh]"
  echo -e "\e[0m"
  exit 1
else
  #Is root.

#-------------------------------------------------------------------------------
# Check my internet connection.
#-------------------------------------------------------------------------------  
wget -q --tries=10 --timeout=20 --spider http://google.com &> /dev/null
  if [[ $? -eq 0 ]]; then
    #Connected to the internet, do nothing but continue script exec.
    : #Empty command, because bash hates nothing or anything but.
  else
    #Not connected to the internet.
    echo "I'm sorry, I could not connect to the internet."
    echo "Please check your connection."
    exit 1
  fi


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# Cron will automatically install the weekly updates
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function update_ubuntu() {
    echo "Remember to finish installation with a dist-upgrade"
    # Echo more messages
    echo '******************************************************'
    echo "* update.sh |    Yaksha Update Script     | `hostname -f` *"
    echo '******************************************************'
    echo -e "\e[1m "Yaksha" the daemon automation handler of my dockerfiles, dotfiles, scripts and routine tasks, v18.03"
    echo -en "\e[0m"
    echo "Released under AGPLv3: https://github.com/svaksha/yaksha"
    sleep 1
    
  # resynchronize the package index files from their internet sources to fetch the latest packages
  echo "The Ubuntu updates will start now."
  sudo apt-get -qq update -y &> /dev/null
  echo "1/5 The dependency packages have been updated!"
  sleep 1
  # Install the newest versions of all packages currently installed on this system.
  sudo apt-get -qq upgrade -y &> /dev/null
  echo "2/5 The standard packages have been upgraded to newer versions!"
  sleep 1
  # Install kernel updates on a Ubuntu LTS server and the "smart" conflict
  # resolution system can handle changing dependencies with new package versions.
  sudo apt-get -qq dist-upgrade -y &> /dev/null
  sudo apt-get --qq -y safe-upgrade &> /dev/null
  echo "3/5 The dist-upgrade for important packages is complete!"
  sleep 1
  
  # Remove junk stuff - Ask user perms for autoremove tasks.
  while true; do
    echo -n "Should I remove un-needed packages? [y/N]"
    read response1
    case $response1 in
      [yY])
      #Said yes, autoremove.
      sudo apt-get -qq autoremove -y &> /dev/null
      echo "4/5 I just removed junk packages."
      sleep 1
      break;
      ;;
      *)
      #Said no or just entered.
      echo "4/5 I have not removed the junk packages."
      sleep 1
      break;
      ;;
    esac
  done
  #Ask if they wanna autoremove as well.
  #--------------------------------------
  while true; do
    echo -n "Do you want to clean up and free some space? [y/N]"
    read response2
    case $response2 in
      [yY])
      #Said yes, autoremove.
      sudo apt-get -qq autoclean -y &> /dev/null
      echo "5/5 Your distro directories were auto-cleaned."
      sleep 1
      break;
      ;;
      *)
      #Said no or just entered.
      echo "5/5 No auto-cleaning was done."
      sleep 1
      break;
      ;;
    esac
  done

  #Confirmation and info about rebooting.
  echo -e "\n"
  echo "Finished updating and auto-cleaning your Ubuntu machine :-)"
  echo "But, some updates may only take action once you reboot,"
  echo "this can be done when you're ready though!"
  exit 1

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
# update the git-aware-prompt
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
function update_git-aware-prompt() {
    cd ~/.bash/git-aware-prompt
    git pull
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
        update_ubuntu="$1"
        shift
    ;;
    -u|--update)
        update_ubuntu="$2"
        shift
    ;;
    *)
        echo "usage:
                -c|--clean  - remove dotfiles before installation
                -u|--update [type] copy the yaksha dotfiles into home"
    ;;
    esac
    
    
case $update_ubuntu in
    updateubuntu)
        update_ubuntu
    ;;
    conda)
        update_conda
    ;;
    git-aware-prompt)
        update_git-aware-prompt
	;;
    nonfree)
        update_nonfree
    ;;
    all)
        update_ubuntu
        update_conda
        update_git-aware-prompt
        update_nonfree
    ;;
    *)
        echo "Installation in progress, almost done!"
    esac    
