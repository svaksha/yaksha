#!/usr/bin/env bash
################################################################################
# FILE       : yksh-apt-rlang.sh
# DESCRIPTION: Installation script for other programming/scripting languages.
# AUTHOR     : SVAKSHA :: http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA (http://svaksha.com/pages/Bio) AllRightsReserved
# LICENSE    : GNU AGPLv3 and subject to the terms and conditions in the LICENSE.md 
#              (https://github.com/svaksha/yaksha/blob/master/LICENSE.md) file being met.
# DATES      : Created:2015mar31 - Updated:2016feb27
################################################################################
#
# References:
# https://github.com/svaksha/aksh/blob/master/cs-debuntu.md 
# https://github.com/svaksha/aksh/blob/master/cs-devops.md
#-------------------------------------------------------------------------------

yaksha_dir=~/yaksha/

# Log the date and time of execution of bash script into the `out` files.
date +'%c|started running `apt-get`: ' >> out-yksh-apt-rlang.log
date +"%c|completed running: $?" >> out-yksh-apt-rlang.log

# Ask for the administrator password first.
sudo -v

# Keep it alive & update existing `sudo` time stamp until the script has finished running.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# R-project / language
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_rlang() {
    sudo add-apt-repository --yes ppa:marutter/rrutter
    sudo apt-get -y update
    sudo apt-get -y install r-base r-base-dev r-base-core
    sudo apt-get -y install libc6 libcurl4-gnutls-dev # R -v = 3.1.0
    sudo Rscript -e "install.packages('Rserve',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('ggplot2',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('devtools',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('RJSONIO',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('RCurl',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('RCubature',,'http://cran.us.r-project.org')"
    #PolyCub is a GNU-R package providing methods for cubature (numerical integration) over polygonal domains.
    sudo apt-get -y install r-cran-polycub
    # CUBATURE - GNU R package for adaptive multivariate integration
    wget http://packages.ubuntu.com/vivid/r-cran-cubature r-cran-cubature_1.1-2-1_amd64.deb
    wget http://packages.ubuntu.com/vivid/r-cran-cubature r-cran-cubature_1.1-2-1_i386.deb
    # In BASH, the variable $OSTYPE stores the name of the operation system:
    # `$OSTYPE` automatically set to a string that describes the operating system on which bash is executing.
    OSARCH=`uname -m`
    if [ ${OSARCH} == 'x86_64' ]; then
    # Install 64-bit stuff here
    cd ~/home; sudo dpkg --install r-cran-cubature_1.1-2-1_amd64.deb
    else
    # Install 32-bit stuff here
    cd ~/home; sudo dpkg --install r-cran-cubature_1.1-2-1_i386.deb
    fi
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# uncomment this for a NEW system only
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#git clone --recursive https://github.com/svaksha/yaksha ${yaksha_dir}

case $install_Rlang in
    rlang)
        install_rlang
    ;;
    all)
        install_rlang
    ;;
    *)
        echo "Installation in progress, almost done!"
    esac
    
