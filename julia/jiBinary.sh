#!/usr/bin/env bash
################################################################################
# FILE       : jiBinary.sh
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
    # get the latest compiled binary link for curl from here: https://julialang.org/downloads/
    wget https://julialang-s3.julialang.org/bin/linux/x64/0.6/julia-0.6.0-linux-x86_64.tar.gz
    # Extract the tarball (-x), decompress extract the gzip content (-z), verbose (-v), specific filename (-f).
    tar -xzvf julia-0.6.0-linux-x86_64.tar.gz
    cd julia
    chmod 700 julia
    if [[ -f "$INSTALL_DIR/julia" ]] ; then
        sudo rm -f "$INSTALL_DIR/julia"
    fi
    sudo ln -s "`pwd`/bin/julia" "$INSTALL_DIR/julia"
} # End function install_linux64bitbinary



#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CASE
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

install_jlstable='all'

case $install_jlstable in
    linux64bitbinary)
        install_linux64bitbinary
    ;;
    all)
        install_linux64bitbinary
    ;;
    *)
        echo "Installation of Non-Free packages is in progress!"
    esac
