#!/usr/bin/env bash
################################################################################
# FILE       : yksh-apt-julia-ppanightlies.sh
# DESCRIPTION: Installation script for the Julia PPA nightlies.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2015feb15 - Updated:2016feb29
################################################################################
#
#-------------------------------------------------------------------------------
# install julia from the distro PPA nightlies
#-------------------------------------------------------------------------------

echo "Installation of julia (PPA nightlies) will start!"

# Set debug mode
exec 5> >(logger -t $0) # uses logger command 
BASH_XTRACEFD="5"
PS4='$LINENO: '
set -x
# set +x # Turn off the log verbiage.


function install_jl_ubuntu_ppanightlies() {
    sudo add-apt-repository --yes ppa:staticfloat/juliareleases
    sudo add-apt-repository --yes ppa:staticfloat/julia-deps
    sudo add-apt-repository --yes ppa:staticfloat/julianightlies
    sudo apt-get -y update && sudo apt-get -y upgrade
    sudo apt-get -y install julia
    julia --eval 'Pkg.add("IJulia")' # Better to keep this in juliarc/REQUIRE ??
    julia --eval 'Pkg.add("Gadfly")'
} # End function install_jl_ppanightlies


