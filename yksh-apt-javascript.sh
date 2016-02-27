#!/usr/bin/env bash
################################################################################
# FILE       : yksh-apt-javascript.sh
# DESCRIPTION: Installation script for Javascript programming language.
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
date +'%c|started running `apt-get`: ' >> out-yksh-apt-javascript.log
date +"%c|completed running: $?" >> out-yksh-apt-javascript.log

# Ask for the administrator password first.
sudo -v

# Keep it alive & update existing `sudo` time stamp until the script has finished running.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# JavaScript
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_javascript() {
    # NPM = node package manager
    sudo apt-get -y install npm
    sudo npm install -g configurable-http-proxy
    sudo npm install -g jslint
    sudo npm install -g jshint
    ln -s ${yaksha_dir}.jshintrc ~/.jshintrc
    sudo add-apt-repository --yes ppa:chris-lea/node.js  # Node.js
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sudo apt-get -y install nodejs # nodejs -v = 0.10.28 # dont pin versions
    sudo apt-get -y install nodejs-legacy
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# uncomment this for a NEW system only
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#git clone --recursive https://github.com/svaksha/yaksha ${yaksha_dir}

case $install_JS in
    javascript)
        install_javascript
    ;;
    all)
        install_javascript
    ;;
    *)
        echo "Javascript installation in progress, almost done!"
    esac
    
