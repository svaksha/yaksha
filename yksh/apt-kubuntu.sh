#!/usr/bin/env bash
################################################################################
# FILE      : yksh-apt-kubuntu.sh
# INFO.     : Bash script to install packages on the Kubuntu system.
# AUTHOR    : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE    : http://svaksha.github.io/yaksha
# COPYRIGHT©: 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE   : GNU AGPLv3 subject to meeting all the terms in the LICENSE file,
#             https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATE      : 2005mar22-Present.
################################################################################
#
# References:
# https://github.com/svaksha/aksh/blob/master/cs-debian.md
# https://github.com/svaksha/aksh/blob/master/cs-devops.md
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹

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


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# KUBUNTU package utilities
# Check for release names: https://wiki.ubuntu.com/Releases
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_kubuntu() {
    sudo apt-get -y install wget
    sudo apt-get -y install curl
    sudo apt-get -y install whois
    sudo apt-get -y install zip   
    sudo apt-get -y install unzip
    sudo apt-get -y install unrar 
    # sendmail or postfix
    sudo apt-get -y install sendmail
    sudo apt-get -y install postfix
    sudo apt-get -y install openssh-server
    sudo apt-get -y install cron-apt   
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# KDE general system utilities
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_kde() {
    ## general cli tools for web, search
    #---------------------------------------------------------------------------
    sudo apt-get -y install silversearcher-ag   
    sudo apt-get -y install ctags
    sudo apt-get -y install exuberant-ctags ack-grep 
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
    #---------------------------------------------------------------------------
    sudo apt-get -y install augeas-dbg python3-augeas augeas-tools augeas-lenses 
    #
    #---------------------------------------------------------------------------
    ## UTILITIES
    #---------------------------------------------------------------------------
    ## LaTeX 
    sudo apt-get -y install kile    #LaTeX Editor for KDE.
    # Markdown to PDF conversion - Python tool
    sudo pip install grip
    # Comparision tool
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
    # PDF to MarkDown
    # http://www.howtogeek.com/228531/how-to-convert-a-pdf-file-to-editable-text-using-the-command-line-in-linux/
    sudo apt-get -y install poppler-utils    
    # Markdown to PDF conversion - JS tool (better than the py tool 'grip')
    sudo npm install -g markdown-pdf
    # Markdown to PDF conversion - Python tool
    sudo pip install grip
    ## HP printer stuff
    sudo apt-get -y install hplip
    sudo apt-get -y install mtink  # http://xwtools.automatix.de/
    sudo apt-get -y install hp-toolbox
    sudo apt-get -y install hp-setup
    sudo apt-get -y install hplip-plugin
    ## Reactivate HP LaserJet 1018/1020 after reloading paper
    sudo apt-get -y install printer-driver-foo2zjs-common   #20140209dfsg0-1kubuntu1
    #
    #---------------------------------------------------------------------------
    ## Browsers
    #---------------------------------------------------------------------------
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
#    sudo add-apt-repository ppa:atareao/telegram
#    sudo apt-get -y install telegram
    # STARTUP DISK CREATOR
    sudo apt-get install unetbootin
    # Time Tracker, https://github.com/TailorDev/Watson
    sudo pip install td-watson
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# Git, LibreOffice and Diff
# http://stackoverflow.com/questions/8795538/how-to-share-odt-doc-documents-over-git
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_databinary() {
    sudo zypper install odt2txt
    sudo zypper install oodiff
    
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# HARDWARE: CPU and HDD utils
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
hardware_utils() {
    ## CPU / HDD health monitoring
    sudo apt-get -y install smartctl
    sudo apt-get -y install smartmontools
    sudo apt-get -y install gsmartcontrol   # GUI version
    sudo apt-get -y install testdisk gddrescue  # grub rescue / HDD health
    # CPU Monitoring tools for Temperature, speed, et al.
    #------------------------------------------------------
    # https://wiki.ubuntu.com/Kernel/PowerManagement/ThermalIssues
    sudo apt-get -y install thermald  # this daemon prevents machines from overheating
    sudo apt-get -y install indicator-cpufreq
    echo "This machine is currently being installed with important system packages!"
    sleep 1
    ## Sensors package to monitor the disk temperature
    sudo apt-get -y install lm-sensors
    sudo apt-get -y install powertop
    sudo apt-get -y install atop
    sudo apt-get -y install linux-tools-common # AKA, "perf": http://www.brendangregg.com/perf.html
    sudo apt-get -y install simplescan
    ## Memory management 
    sudo apt-get -y install lowmem        # free memory for lowmem install 
    sudo apt-get -y install lowmemcheck   # detect low-memory systems and enter lowmem mode
    sudo apt-get -y install memstat
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
## DATABASE packages
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_database() {
    sudo apt-get -y install mariadb
    sudo apt-get -y install sqlite3
    ## PostgreSQL
    sudo apt-get -y install postgresql-9.4 #core database server
    sudo apt-get -y install postgresql-client-9.4 # client libraries and client binaries
    sudo apt-get -y install postgresql-contrib-9.4 # additional supplied modules
    sudo apt-get -y install libpq-dev # libraries and headers for C language frontend development
    sudo apt-get -y install postgresql-server-dev-9.4 # libraries and headers for C language backend development
    sudo apt-get -y install pgadmin3 # pgAdmin III graphical administration utility
    ## Distributed File Systems
    sudo apt-get -y install hdf5-tools
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
## DATA_FORMATS : RDF
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_df_rdf() {
    # SETTINGS SECTION
    CODE_BASE = src
    INSTALL_DIR = /usr/local/bin
    ANY23_VERSION = 1.1  # check the site for exact versions, https://any23.apache.org/

    # END OF SETTINGS SECTION
    # Does the source base directory exist? No? Well, create it!
    cd ~
    if [[ ! -d "$CODE_BASE" ]] ; then
        mkdir "$CODE_BASE"
    fi
    cd "$CODE_BASE"

    sudo apt-get install -y ruby # first we install Ruby and RubyGems  
    sudo gem install rdf2json # then install rdf2json
    # Install Apache Any23, https://any23.apache.org/
    wget http://ftp.jaist.ac.jp/pub/apache/any23/1.1/apache-any23-core-${ANY23_VERSION}.tar.gz
    tar xzf apache-any23-core-${ANY23_VERSION}.tar.gz
    cd apache-any23-core-${ANY23_VERSION}
    chmod 700 bin
    if [[ -f "$INSTALL_DIR/any23" ]] ; then
        sudo rm -f "$INSTALL_DIR/any23"
    fi
    sudo ln -s "`pwd`/bin/any23" "$INSTALL_DIR/any23"
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
## DVCS packages
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_dvcs() {
    sudo apt-get -y install git git-core
    sudo apt-get -y install tig
    # sudo apt-get -y install deb file for git-lfs {{https://github.com/github/git-lfs.git}}
    sudo apt-get -y install mercurial
    sudo apt-get -y install tortoisehg
    sudo apt-get -y install bazaar
    sudo apt-get -y install subversion
    ln -s  ${yaksha_dir}.gitconfig ~/.gitconfig
    git clone https://github.com/jonas/tig /tmp/tig
    cd /tmp/tig; sudo make prefix=/usr/local
    cd /tmp/tig; sudo make install prefix=/usr/local
    # https://github.com/jimeh/git-aware-prompt 
    # Display current Git branch name in your terminal prompt when in a Git working directory.
    mkdir ~/.bash
    cd ~/.bash
    git clone git://github.com/jimeh/git-aware-prompt.git
    #---------------
    # Gitsome : https://github.com/donnemartin/gitsome#installation
    #---------------
    sudo pip install gitsome # stable version from PyPI
    # pip3: Depending on your system, you might need to run pip3, possibly with the -H flag:
    #sudo -H pip3 install gitsome
    # Master from GitHub source with changes not yet pushed to PyPI:
    #sudo pip install git+https://github.com/donnemartin/gitsome.git
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# EDITORS
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_editors() {
    ## Editors
    sudo apt-get -y install dconf-tools # Editor for Gnome tools.
    sudo apt-get -y install emacs
    sudo apt-get -y install geany
    sudo apt-get -y install guake
    sudo apt-get -y install meld     # GNOME, wont work on KDE.
    sudo apt-get -y install kompare  # Comparision tool
    sudo apt-get -y install scite
    sudo apt-get -y install spyder
    # CLI text editors for sysadmins working on remote Linux/Unix servers.
    sudo apt-get -y install nano
    sudo apt-get -y install pico
    sudo apt-get -y install vim
    # Atom editor 64-bit DEB file from github source
    wget https://github.com/atom/atom/releases/download/v1.6.0/atom-amd64.deb ~/home
    cd ~/home; sudo dpkg --install atom-amd64.deb
    # Atom editor 32-bit PPA
    #sudo add-apt-repository ppa:webupd8team/atom
    #sudo apt-get update
    #sudo apt-get install atom
    ## BRACKETS
    sudo dpkg --install Brackets.1.4.Extract.64-bit.deb  #Brackets IDE for 64-bit
    ## LaTeX2ε
    sudo apt-get -y install texlive
    sudo apt-get -y install gedit-latex-plugin
    sudo apt-get -y install lyx #for the technical authors and scientists.
} 


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# Fonts
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_fonts() {
    sudo apt-get -y install ttf-mscorefonts-installer # Microsoft fonts for Libreoffice.
    wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
    wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
    mkdir -p ~/.fonts
    mv PowerlineSymbols.otf ~/.fonts/
    mkdir -p ~/.config/fontconfig/conf.d
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
    fc-cache -vf ~/.fonts/
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# GCC {{ C, CPP, Fortran }}
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_gcc() {
    echo "GCC (and its variant packages) installation is in progress!"
    ## C/C++
    sudo apt-get -y install gcc
    sudo apt-get -y install gnu
    sudo apt-get -y install make
    sudo apt-get -y install gnu-make
    sudo apt-get -y install cmake
    sudo apt-get -y install libncurses5-dev
    sudo apt-get -y install cmake-curses-gui
    sudo apt-get -y install clang
    sudo apt-get -y install g++
    ## Fortran
    sudo apt-get -y install gfortran
    sudo apt-get -y install m4
    sudo apt-get -y install patch
    ## BOOST
    sudo apt-get -y install fftw-dev
    sudo apt-get -y install libtiff4-dev
    sudo apt-get -y install openexr
    sudo apt-get -y install libboost
    sudo apt-get -y install fftw3-dev
    sudo apt-get -y install liblemon
    sudo apt-get -y install libpng-dev
    ## Statistics
    sudo apt-get -y install pspp
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# GO language : https://golang.org/doc/code.html
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
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


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# GRAPHICS, IMAGE PROCESSING, COMPUTER VISION, MACHINE VISION
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_graphics() {
    ## medical imaging
    sudo apt-get -y install aeskulap
    sudo apt-get -y install Ginkgo-CADx
    ## Image Editors
    sudo apt-get -y install gimp inkscape   # Can process raster SVG images
    sudo apt-get -y install imagemagick -with--libtiff
    #-----------------------------------------------------------
    ## Image processing tools and libraries :: https://wiki.ubuntu.com/UbuntuGIS
    #-----------------------------------------------------------
    sudo apt-get -y install colordiff
    # GRASS for geospatial data management, image processing, graphics/maps production, spatial modeling, and visualization.
    sudo apt-get -y install grass
    sudo apt-get -y install qgis qgis-plugin-grass # QuantumGIS supports vector, raster, and database formats.
    sudo apt-get -y install gdal libgdal1c2a python-gdal  # handles raster formats
    sudo apt-get -y install libgeotiff
    sudo apt-get -y install e00compr # an ANSI C library that reads and writes Arc/Info compressed E00 files.
    sudo apt-get -y install postgis    # PG driver for GIS
    sudo apt-get -y install QuantumGIS
    # Mapserver
    sudo apt-get -y install cgi-mapserver mapserver-bin
    # Language bindings for mapserver
    sudo apt-get -y install python-mapscript perl-mapscript php4-mapscript php5-mapscript
    sudo apt-get -y install libterralib1c2a  # Terralib
    #-----------------------------------------------------------
    ## Unified Modeling Language (UML) Tools 
    # http://askubuntu.com/questions/9405/what-uml-unified-modelling-language-tools-are-available
    #-----------------------------------------------------------
    sudo apt-get -y install dia
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# JAVA
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_java() {
    sudo add-apt-repository --yes ppa:webupd8team/java
    sudo apt-get -y install oracle-java8-installer # javac -v = 1.8.XXX
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# JavaScript
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
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
    # gradle
    sudo add-apt-repository --yes ppa:cwchien/gradle
    sudo apt-get update
    sudo apt-get -y install gradle
    # Markdown to PDF conversion - JS tool (better than the py tool 'grip')
    sudo npm install -g markdown-pdf
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# Networking shell 
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_network() {
    # VPN networks
    sudo apt-get -y install openvpn
    sudo apt-get -y install openconnect # Cisco Anyconnect
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# Non-Free utilities
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_nonfree() {
    sudo apt-get -y update
    sudo apt-get -y upgrade
    ##+++++++++++++
    ## Adobe
    ##+++++++++++++
    #sudo apt-get -y install AdbeRdr9.5.5-1_i386linux_enu.deb
    sudo dpkg --add-architecture i386   # For debian-jessie Adobe needs the i386 architecture.
    sudo apt-get update 
    sudo apt-get -y install acroread mozilla-acroread    
    ##+++++++++++++
    ## FLASH
    ##+++++++++++++
    sudo apt-get -y install flashplugin-nonfree
    ##+++++++++++++
    ## SKYPE
    ##+++++++++++++
    # rm -rf ~/.Skype  #Clear the old Skype folder before installing latest version.
    sudo dpkg --add-architecture i386 # Enable multiarch, https://help.ubuntu.com/community/MultiArch
    sudo apt-get update 
    sudo apt-get -y install sni-qt:i386 # Download latest architecture version.
    wget -c http://download.skype.com/linux/skype-debian_4.3.0.37-1_i386.deb
    sudo gdebi skype-debian_4.3.0.37-1_i386.deb
    sudo dpkg -l skype-debian_4.3.0.37-1_i386.deb
    sudo apt-get -f install
    # Install Skype from Canonical Partner Repository
    # sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
    sudo apt-get -y update
    sudo apt-get -y upgrade
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# PYTHON
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_python() {
    echo "Python (and its variant packages) installation is in progress!"
    sudo apt-get -y install build-essential
    # PIP = Python Installer
    sudo apt-get -y install pip
    sudo apt-get -y install pip-installer
    sudo apt-get -y install python-setuptools
    sudo apt-get -y install python-pip python-dev python-yaml
    sudo apt-get -y install python-software-properties
    # python3
    sudo apt-get -y install python-virtualenv python3-dev pkgconf
    sudo apt-get -y install libfreetype6-dev libfreetype6 libxft-dev
    sudo apt-get -y install libblas-dev liblapack-dev libyaml-dev
    sudo apt-get -y install python3-pip python3
    ## scientific python
    sudo apt-get -y install cython
    sudo apt-get -y install numpy python-numpy
    sudo apt-get -y install scipy
    sudo apt-get -y install python-matplotlib python-scipy
    sudo apt-get -y install python-virtualenv
    sudo apt-get -y install manpages-dev
    sudo apt-get -y install python-fontforge
    # Jupyter
    #sudo apt-get -y install IPython ipython3 ipython3-notebook
    sudo pip install ipython jinja2 tornado pyzmq pandas jsonschema pyaml
    ## More Python stuff
    sudo pip install rotate-backups
    sudo pip install plumbum ## An alternatice to Fabric, https://github.com/tomerfiliba/plumbum
    sudo pip install jedi -i http://pypi.python.org/simple/
    sudo pip install pylint -i http://pypi.python.org/simple/
    # Nginx WebServer 
    sudo add-apt-repository --yes ppa:nginx/stable
    sudo apt-get update
    sudo apt-get -y install nginx # nginx -v = 1.6.0
    # WebServer ZMQ, also needed by Jupyter/IPython / IRuby etc..
    sudo add-apt-repository --yes ppa:chris-lea/zeromq
    sudo apt-get -y install libzmq3-dbg libzmq3-dev libzmq3
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# R-project / language
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_rlang() {
    sudo add-apt-repository --yes ppa:marutter/rrutter
    sudo apt-get -y update
    sudo apt-get -y install r-base r-base-dev r-base-core
    sudo apt-get -y install r-recommended   # GNU R collection of recommended packages {metapackage}.
    sudo apt-get -y install r-doc-info      # GNU R info manuals statistical computing system.
    sudo apt-get -y install libc6 libcurl4-gnutls-dev # R -v = 3.1.0
    # Statistics & DataScience
    sudo apt-get -y install r-cran-plyr #https://cran.r-project.org/web/packages/plyr/index.html
    ## Fetching from CRAN
    sudo Rscript -e "install.packages('Rserve',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('ggplot2',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('devtools',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('RJSONIO',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('RCurl',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('RCubature',,'http://cran.us.r-project.org')"
    
    #PolyCub is a GNU-R package providing methods for cubature (numerical integration) over polygonal domains.
#    sudo apt-get -y install r-cran-polycub
    #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # CUBATURE - GNU R package for adaptive multivariate integration
#    sudo apt-get -y install r-cran-cubature
    # Cubature if you use Kubuntu.
#    wget http://packages.ubuntu.com/xenial/r-cran-cubature r-cran-cubature_1.1-2-1_amd64.deb
#    wget http://packages.ubuntu.com/xenial/r-cran-cubature r-cran-cubature_1.1-2-1_i386.deb
    # In BASH, the variable $OSTYPE stores the name of the operation system:
    # `$OSTYPE` automatically set to a string that describes the operating system on which bash is executing.
#    OSARCH=`uname -m`
#   if [ ${OSARCH} == 'x86_64' ]; then
    # Install 64-bit stuff here
#    cd ~/home; sudo dpkg --install r-cran-cubature_1.1-2-1_amd64.deb
#    else
    # Install 32-bit stuff here
#    cd ~/home; sudo dpkg --install r-cran-cubature_1.1-2-1_i386.deb
#    fi
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# RUBY
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_ruby() {
    sudo apt-get -y install ruby
    sudo apt-get -y install ruby-all-dev
    sudo apt-get -y install ruby-dev
    sudo apt-get -y install ruby-full
    sudo apt-get -y install ruby-defaults
    sudo gem install iruby
    # VAGRANT  - tool for building and distributing virtualized development environments.
    sudo apt-get -y install vagrant  
    # share a common package cache among similar VM instances
    sudo apt-get -y install vagrant-cachier   # only available in stretch (testing)
    # Linux container provider for Vagrant.
    sudo apt-get -y install vagrant-lxc       # only available in stretch (testing)
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



#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# RUST LANGUAGE
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_rust() {
    sudo apt-get -y install rust
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# TMUX
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_tmux() {
    sudo apt-get -y install tmux
    sudo apt-get -y install python-netifaces
    ln -s ${yaksha_dir}.tmux ~/.tmux
    ln -s ${yaksha_dir}.config/ ~/.config
    git clone https://github.com/Lokaltog/powerline ~/.tmux/powerline2
    cd ~/.tmux/powerline2; sudo python setup.py install
    ln -s ${yaksha_dir}.tmux/tmux.conf ~/.tmux.conf
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# VIM
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_vim() {
    sudo apt-get -y install fontforge
    sudo apt-get -y install vim-nox
    sudo apt-get -y install ctags
    ln -s  ${yaksha_dir}.vim ~/.vim
    git clone https://github.com/gmarik/Vundle.vim  ~/.vim/bundle/Vundle.vim
    ln -s ${yaksha_dir}.pylintrc ~/.pylintrc
    ln -s ${yaksha_dir}.vimrc ~/.vimrc
    vim -c 'BundleInstall' -c qa
    cd ~/.vim/bundle/vimproc.vim/; make -f make_unix.mak
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# YKSHM DEVOPS 
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
ykshm_devops() {
    # DOCKER : https://docs.docker.com/installation/ubuntulinux/
    #sudo apt-get -y install docker.io
    #apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    ## AMQP
    sudo apt-get -y install rabbitmq-server  ## Erlang
    sudo pip install pika -i https://github.com/pika/pika   # python client lib for RabbitMQ
    ## WebServer
    sudo apt-get -y install twisted
    sudo apt-get -y install tornado
    # gradle
    sudo add-apt-repository --yes ppa:cwchien/gradle
    sudo apt-get update
    sudo apt-get -y install gradle
    # nginx
    sudo add-apt-repository --yes ppa:nginx/stable
    sudo apt-get update
    sudo apt-get -y install nginx # nginx -v = 1.6.0
    # ZMQ, also needed by Jupyter/IPython / IRuby etc..
    # sudo add-apt-repository --yes ppa:chris-lea/zeromq
    sudo apt-get -y install libzmq3-dbg libzmq3-dev libzmq3
    # Lets try out this package manager for bash scripts and functions.
    # Only tested for git based packages.
    git clone https://github.com/basherpm/basher.git ~/.basher
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# Clean Install
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
clean_install() {
    echo "Clean install"
    rm -rf ~/.vim
    rm -rf ~/.vimrc
    rm -rf ~/.tmux
    rm -rf ~/.tmux.conf
    rm -rf ~/.screenrc
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹

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

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# uncomment this for a NEW system only
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
#git clone --recursive https://github.com/svaksha/yaksha ${yaksha_dir}

case $install_kubuntu in
    kubuntu)
        install_kubuntu
    ;;
    kde)
        install_kde
    ;;
    hardware)
        hardware_utils
    ;;
    database)
        install_database
    ;;
    df_rdf)
        install_df_rdf
    ;;
    dvcs)
        install_dvcs
    ;;
    editors)
        install_editors
    ;;
    fonts)
        install_fonts
    ;;
    gcc)
        install_gcc
    ;;
    go)
        install_go
    ;;
    graphics)
        install_graphics
    ;;
    java)
        install_java
    ;;
    javascript)
        install_javascript
    ;;
    network)
        install_network
	;;
    nonfree)
        install_nonfree
    ;;
    python)
        install_python
    ;;
    rlang)
        install_rlang
    ;;
    ruby)
        install_ruby
    ;;
    rust)
        install_rust
    ;;
    tmux)
        install_tmux
    ;;
    vim)
        install_vim
    ;;
    ykshm)
        ykshm_devops
    ;;
    all)
        install_kubuntu
        install_df_rdf
        hardware_utils
        install_database
        install_df_rdf
        install_dvcs
        install_editors
        install_fonts
        install_gcc
        install_go
        install_graphics
        install_java
        install_javascript
        install_network
        install_nonfree
        install_python
        install_rlang
        install_ruby
        install_rust
        install_tmux
        install_vim
        ykshm_devops
    ;;
    *)
        echo "KUBUNTU package installation in progress, almost done!"
    esac
