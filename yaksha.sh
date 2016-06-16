#!/usr/bin/env bash
################################################################################
# FILE       : yaksha.sh
# DESCRIPTION: Bash script to source and autorun the package installation scripts. 
#              WARNING: USE WITH CARE.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : 2016feb17-Present
################################################################################
#
# References:
# https://github.com/svaksha/aksh/blob/master/cs-debuntu.md 
# https://github.com/svaksha/aksh/blob/master/cs-devops.md
#-------------------------------------------------------------------------------

# TASK
#bash $HOME/yaksha/yaks-apt-firewall.sh
#python $HOME/yaksha/yaks-backup.py
#bash $HOME/yaksha/yaks-mail-todo.sh
## DONT AutoRun && use all uninstall scripts with care.
#bash $HOME/yaksha/yaks-apt-uninstall.sh

function yksh_update {
bash $HOME/yaksha/yaks-apt-update.sh
bash $HOME/yaksha/yaks-update-julia.sh
}

function yksh_install {
bash $HOME/yaksha/yksh-apt-install.sh
bash $HOME/yaksha/yksh-git-julia.sh
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

yakshapt='all'
key="$1"
key="$2"

case $key in
    -u|--update)
        yksh_update="$1"
        shift
    ;;
    -i|--install)
        yksh_install="$2"
        shift
    ;;
    all)
        yksh_update
        yksh_install
	;;
	*)
        echo "usage:
                -u|--update - will update the apt system
                -i|--install [type] - to install the dev system."
        echo "The task is in progress, almost done!"
        ;;
    esac

    
