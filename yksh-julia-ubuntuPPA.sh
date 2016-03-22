#!/usr/bin/env bash
################################################################################
# FILE       : yksh-julia-ubuntuPPA.sh
# DESCRIPTION: Installation script for the Julia PPA nightlies.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2015feb15 - Updated:2016mar11
################################################################################
#
#-------------------------------------------------------------------------------
# Install julia PPA nightlies on Ubuntu distro 
#-------------------------------------------------------------------------------

echo "Installation of julia (PPA nightlies) will start!"

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
# Ubuntu PPA nightlies for Julia
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_jl_ppanightlies() {
    sudo add-apt-repository --yes ppa:staticfloat/juliareleases
    sudo add-apt-repository --yes ppa:staticfloat/julia-deps
    sudo add-apt-repository --yes ppa:staticfloat/julianightlies
    sudo apt-get -y update && sudo apt-get -y upgrade
    sudo apt-get -y install julia
} # End function install_jl_ppanightlies


