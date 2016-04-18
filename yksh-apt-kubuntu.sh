#!/usr/bin/env bash
################################################################################
# FILE       : yksh-apt-kubuntu.sh
# DESCRIPTION: Bash script to install packages on the Kubuntu system.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2005mar22 - Updated:2016mar14
################################################################################
#
# References:
# https://github.com/svaksha/aksh/blob/master/cs-debuntu.md 
# https://github.com/svaksha/aksh/blob/master/cs-devops.md
#-------------------------------------------------------------------------------

yaksha_dir=~/yaksha/

# Log the date and time of execution of bash script into the `out` files.
date +'%c|started running `apt-get`: ' >> out-yksh-apt-kubuntu.log
date +"%c|completed running: $?" >> out-yksh-apt-kubuntu.log

# The SET bulletin
# Tip: Using "+" causes these flags to be turned off.
set -a  # Mark variables which are modified or created for export.
set -b  # Notify of job termination immediately.
# Unless you want to babysit the installation process for each package dont use this.
#set -e  # Exit immediately if a command exits with a non-zero status.
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
# KUBUNTU package utilities
# Check for release names: https://wiki.ubuntu.com/Releases
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_kubuntu() {
    ## general cli tools for web, search
    #============================================
    sudo apt-get -y install cron-apt   
    sudo apt-get -y install silversearcher-ag   
    sudo apt-get -y install zip   
    sudo apt-get -y install ctags
    sudo apt-get -y install exuberant-ctags ack-grep 
    sudo apt-get -y install unrar 
    sudo apt-get -y install screen
    ln -s  ${yaksha_dir}.screenrc ~/.screenrc # copy the old file, dont create new one
    ## Tools for dependency check and PPA removal
    sudo apt-get -y install equivs
    sudo apt-get -y install ppa-purge 
    sudo apt-get -y install nmap 
    # SSH
    sudo apt-get -y install sshpass 
    # Install Augeas - http://augeas.net/download.html
    # An editing tool API to automate the configuration editing on remote servers.
    #============================================
    sudo apt-get -y install augeas-dbg python3-augeas augeas-tools augeas-lenses 
    #============================================
    ## UTILITIES
    #============================================
    ## RESEARCH 
    sudo apt-get -y install kile #TeX Editor for KDE.
    sudo apt-get -y install kompare #https://en.wikipedia.org/wiki/Kompare
    ## BibTeX Reference software
    sudo apt-get -y install pybliographer
    sudo apt-get -y install referencer    #IGNORE, https://launchpad.net/referencer
    # hierarchical notebook : http://hnb.sourceforge.net/Documentation/ 
    sudo apt-get -y install hnb 
    # PDF related packages
    sudo apt-get -y install flpsed
    sudo apt-get -y install pdfjam
    sudo apt-get -y install xournal
    sudo apt-get -y install pdfedit 
    sudo apt-get -y install cups-pdf 
    ## HP printer stuff
    sudo apt-get -y install hplip
    sudo apt-get -y install mtink  # http://xwtools.automatix.de/
    sudo apt-get -y install hp-toolbox
    sudo apt-get -y install hp-setup
    sudo apt-get -y install hplip-plugin
    ## Reactivate HP LaserJet 1018/1020 after reloading paper
    sudo apt-get -y install printer-driver-foo2zjs-common   #20140209dfsg0-1kubuntu1
    ## Browsers
    #============================================
    sudo apt-get -y install google-chrome-stable 
    ## video and audio (music - mpto mp3) converters
    sudo apt-get -y install papcl
    sudo apt-get -y install ubuntu-restricted-extras # install the MP3 codec from the Ubuntu Restricted Extras package
    sudo apt-get -y install soundconverter # install the Sound Converter program
    # get the github source (https://github.com/rg3/youtube-dl)
    sudo pip install youtube_dl    # sudo pip install --upgrade youtube_dl  #(to upgrade if its already installed)
    # Taking Notes
    sudo apt-get -y install tomboy transmission
    ## Communication Tools
    sudo apt-get -y install jitsi # Skype alternative
    # Telegram, a Whatsapp alternative on GH: https://github.com/telegramdesktop/tdesktop
    sudo add-apt-repository ppa:atareao/telegram
    sudo apt-get -y install telegram
    # STARTUP DISK CREATOR
    sudo apt-get install unetbootin
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PROGRAMMING LANGUAGES
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function install_programming() {
    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # JavaScript
    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    sudo add-apt-repository --yes ppa:chris-lea/node.js  # Node.js
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sudo apt-get -y install nodejs # nodejs -v = 0.10.28 # dont pin versions
    sudo apt-get -y install nodejs-legacy
    # gradle
    sudo add-apt-repository --yes ppa:cwchien/gradle
    sudo apt-get update
    sudo apt-get -y install gradle
    # Markdown to PDF conversion - JS tool (better than the py tool 'grip')
    sudo npm install -g markdown-pdf
    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # PYTHON
    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # nginx
    sudo add-apt-repository --yes ppa:nginx/stable
    sudo apt-get update
    sudo apt-get -y install nginx # nginx -v = 1.6.0
    # ZMQ, also needed by Jupyter/IPython / IRuby etc..
    sudo add-apt-repository --yes ppa:chris-lea/zeromq
    sudo apt-get -y install libzmq3-dbg libzmq3-dev libzmq3
    # Markdown to PDF conversion - Python tool
    sudo pip install grip
    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # R-project / language
    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	sudo add-apt-repository --yes ppa:marutter/rrutter
    sudo apt-get -y update
    # Cubature if you use K/Ubuntu.
    wget http://packages.ubuntu.com/xenial/r-cran-cubature r-cran-cubature_1.1-2-1_amd64.deb
    wget http://packages.ubuntu.com/xenial/r-cran-cubature r-cran-cubature_1.1-2-1_i386.deb
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
    #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # RUBY
    #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # In BASH, the variable $OSTYPE stores the name of the operation system:
    # `$OSTYPE` automatically set to a string that describes the operating system on which bash is executing.
    OSARCH=`uname -m`
    if [ ${OSARCH} == 'x86_64' ]; then
       # Install 64-bit stuff here
       cd ~/home; sudo dpkg --install vagrant_1.7.4_x86_64.deb
        else
        # Install 32-bit stuff here
       cd ~/home; sudo dpkg --install vagrant_1.7.4_i686.deb
    fi
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

install_kubuntu='all'
key="$1"
key="$2"

case $key in
    -c|--clean)
        clean_install="$1"
        shift
    ;;
    -i|--install)
        install_kubuntu="$2"
        shift
    ;;
    *)
        echo "usage:
                -c|--clean  - remove dotfiles before installation
                -i|--install [type] will install the KUBUNTU packages into $HOME/user
        "
        ;;
    esac

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# uncomment this for a NEW system only
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#git clone --recursive https://github.com/svaksha/yaksha ${yaksha_dir}

case $install_kubuntu in
    kubuntu)
        install_kubuntu
    ;;
    programming)
        install_programming
    ;;
    all)
        install_kubuntu
        install_programming
    ;;
    *)
        echo "Installation in progress, almost done!"
    esac
