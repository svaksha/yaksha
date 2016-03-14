#!/usr/bin/env bash
################################################################################
# FILE       : yksh-py-anaconda.sh
# DESCRIPTION: Bash script for installing Anaconda3 for Python-3x.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2013jun25 - Updated:2016mar14
################################################################################
#
# References:
# https://github.com/svaksha/aksh/blob/master/cs-debuntu.md 
# https://github.com/svaksha/aksh/blob/master/cs-devops.md
#-------------------------------------------------------------------------------

yaksha_dir=~/yaksha/

# Log the date and time of execution of bash script into the `out` files.
date +'%c|started running `apt-get`: ' >> out-yksh-py-anaconda.log
date +"%c|completed running: $?" >> out-yksh-py-anaconda.log

# The SET bulletin
# Tip: Using "+" causes these flags to be turned off.
set -a  # Mark variables which are modified or created for export.
set -b  # Notify of job termination immediately.
set -e  # Exit immediately if a command exits with a non-zero status.
set -m  # Job control is enabled.
set -v  # Verbose mode to print shell input lines as they are read.
set -x  # Print commands and their arguments as they are executed.
# Set debug mode
exec 5> >(logger -t $0) # uses logger command 
BASH_XTRACEFD="5"
PS4='$LINENO: '


# Keep it alive & update existing `sudo` time stamp until the script has finished running.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ANACONDA
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_anaconda() {
    # 64-bit
    wget http://repo.continuum.io/archive/Anaconda3-2.5.0-Linux-x86_64.sh
    # 32-bit
    wget http://repo.continuum.io/archive/Anaconda3-2.5.0-Linux-x86.sh
    # In BASH, the variable $OSTYPE stores the name of the operation system:
    # `$OSTYPE` automatically set to a string that describes the operating system on which bash is executing.
    OSARCH=`uname -m`
    if [ ${OSARCH} == 'x86_64' ]; then
        # Install 64-bit stuff here
        export PATH="$(pwd)/anaconda3:$PATH"
        sudo bash Anaconda3-2.5.0-Linux-x86_64.sh
        else
        # Install 32-bit stuff here
        export PATH="$(pwd)/anaconda-32bit:$PATH"
        sudo Anaconda3-2.5.0-Linux-x86.sh
    fi
}


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

install_anaconda='all'
key="$1"

case $key in
    -i|--install)
        install_anaconda="$1"
        shift
    ;;
    *)
        echo "usage:
                -i|--install [type] install Anaconda3 into $HOME/anaconda3
        "
        ;;
    esac

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# uncomment this for a NEW system only
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#git clone --recursive https://github.com/svaksha/yaksha ${yaksha_dir}

case $install_anaconda in
    anaconda)
        install_anaconda
    ;;
    all)
        install_anaconda
    ;;
    *)
        echo "Installation in progress, almost done!"
    esac
