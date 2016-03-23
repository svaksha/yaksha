#!/usr/bin/env bash
################################################################################
# FILE       : yksh-julia-stable.sh
# DESCRIPTION: Generic Linux binaries installation script for Julia stable releases.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2015feb15 - Updated:2016mar23
################################################################################
#
#-------------------------------------------------------------------------------
# Installation script for generic 64-bit Linux binaries of Julia stable releases.
#-------------------------------------------------------------------------------

echo "Installation of generic Linux 64-bit binaries of Julia stable releases will start now!"

# The SET bulletin
# Tip: Using "+" causes these flags to be turned off.
set -a  # Mark variables which are modified or created for export.
set -b  # Notify of job termination immediately.
set -m  # Job control is enabled.
set -v  # Verbose mode to print shell input lines as they are read.
set -x  # Print commands and their arguments as they are executed.
# Set debug mode
exec 5> >(logger -t $0) # uses logger command 
BASH_XTRACEFD="5"
PS4='$LINENO: '

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Generic 64-bit Linux binaries of Julia stable releases.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_linux64bitbinary() {
    INSTALL_DIR = $HOME/
    wget https://julialang.s3.amazonaws.com/bin/linux/x64/0.4/julia-0.4.5-linux-x86_64.tar.gz
    tar julia-0.4.5-linux-x86_64.tar.gz
    cd julia-0.4.5-linux-x86_64
    chmod 700 bin
    if [[ -f "$INSTALL_DIR/julia-0.4.5" ]] ; then
        sudo rm -f "$INSTALL_DIR/julia-0.4.5"
    fi
    sudo ln -s "`pwd`/bin/julia-0.4.5" "$INSTALL_DIR/julia-0.4.5"
} # End function install_linux64bitbinary


