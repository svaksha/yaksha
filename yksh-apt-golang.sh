#!/usr/bin/env bash
################################################################################
# FILE       : yksh-apt-golang.sh
# DESCRIPTION: Installation script for GO programming language.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
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
date +'%c|started running `apt-get`: ' >> out-yksh-apt-golang.log
date +"%c|completed running: $?" >> out-yksh-apt-golang.log

# Ask for the administrator password first.
sudo -v

# Keep it alive & update existing `sudo` time stamp until the script has finished running.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# GO language : https://golang.org/doc/code.html
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_go() {
    sudo apt-get -y install golang # Go programming language compiler - METApackage
    sudo apt-get -y install golang-go.net-dev #supplementary Go networking libraries (development files)
    sudo apt-get -y install golang-go.tools # supplementary Go tools
    sudo apt-get -y install golang-go.tools-dev # supplementary Go tools (development files)
    sudo apt-get -y install golang-go-linux-386 # Go standard library compiled for linux_386
    sudo apt-get -y install golang-go-linux-amd64 # Go standard library compiled for linux_amd64
    sudo apt-get -y install dh-golang # debhelper add-on for packaging software written in Go (golang)
    sudo apt-get -y install gccgo-go # Go tool for use with gccgo
    sudo apt-get -y install golang-bindata-dev # embed data in a Go program - library package
    sudo apt-get -y install golang-doc # Go programming language compiler - documentation
    sudo apt-get -y install golang-go # Go programming language compiler
    sudo apt-get -y install golang-go # Go programming language compiler
    # dependency tool for go
    wget https://github.com/tools/godep.git ~/home
    # Database drivers
    sudo apt-get -y install golang-pq-dev # pure Go postgres driver for Go’s database/sql package
    sudo apt-get -y install golang-gosqlite-dev # Trivial sqlite3 binding for Go (development files)
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# uncomment this for a NEW system only
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#git clone --recursive https://github.com/svaksha/yaksha ${yaksha_dir}

case $install_golang in
    go)
        install_go
    ;;
    all)
        install_go
    ;;
    *)
        echo "GoLang installation in progress, almost done!"
    esac
    
