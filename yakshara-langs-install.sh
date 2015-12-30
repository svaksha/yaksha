#!/usr/bin/env bash
################################################################################
# FILE       : yakshara-langs-install.sh
# DESCRIPTION: Installation script for other programming/scripting languages.
# AUTHOR     : SVAKSHA :: http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA (http://svaksha.com/pages/Bio) AllRightsReserved
# LICENSE    : GNU AGPLv3 and subject to the terms and conditions in the LICENSE.md 
#              (https://github.com/svaksha/yaksha/blob/master/LICENSE.md) file being met.
# DATES      : Created:2005mar22 - Updated:2015dec30
################################################################################
#
# References:
# https://github.com/svaksha/aksh/blob/master/cs-debuntu.md 
# https://github.com/svaksha/aksh/blob/master/cs-devops.md
#-------------------------------------------------------------------------------

yaksha_dir=~/yaksha/

# Log the date and time of execution of bash script into the `out` files.
date +'%c|started running `apt-get`: ' >> out-yakshara-langs-install.log
date +"%c|completed running: $?" >> out-yakshara-langs-install.log

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
# JAVA
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_java() {
    sudo add-apt-repository --yes ppa:webupd8team/java
    sudo apt-get -y install oracle-java8-installer # javac -v = 1.8.XXX
}

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
# RUBY
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_ruby() {
    sudo apt-get -y install ruby1.9.1 ruby1.9.1-dev
    sudo gem install iruby
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# uncomment this for a NEW system only
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#git clone --recursive https://github.com/svaksha/yaksha ${yaksha_dir}

case $install_deb in
    go)
        install_go
    ;;
    java)
        install_java
    ;;
    javascript)
        install_javascript
    ;;
    rlang)
        install_rlang
    ;;
    ruby)
        install_ruby
    ;;
    all)
        install_go
        install_java
        install_javascript
        install_rlang
        install_ruby
    ;;
    *)
        echo "Installation in progress, almost done!"
    esac
    
