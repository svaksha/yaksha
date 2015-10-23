#!/usr/bin/env bash
################################################################################
# File       : yaksha-debu-install.sh, from http://svaksha.github.io/yaksha
# Description: Bash Installation script for a new system.
# AUTHOR     : SVAKSHA, http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA (http://svaksha.com/pages/Bio) AllRightsReserved
# DATES      : Created:2005mar22 - Updated:2015oct23
# LICENSE    : GNU AGPLv3 License <http://www.gnu.org/licenses/agpl.html>
#              https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# This code is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. Permission is hereby granted, free of charge, to any
# person obtaining a copy of this software, to deal in the Software without
# restriction, including without limitation the rights to use, copy, modify,
# merge, publish, redistribute, and/or sell copies of the Software and use in
# source form, with or without modification, and to permit persons to whom the
# Software is furnished to do so as per the terms in the LICENSE.md file and
# subject to the following conditions being met:
# 1. ALL copies, forks and redistributions of source code AND/OR binary form
#    must retain the above Copyright notice, the Licence file for source code
#    (AGPLv3) along with this permission notice and list of conditions and the
#    following disclaimer, in substantial portions of the Software.
# 2. Neither the name of the COPYRIGHT HOLDER(S) nor the names of its
#    contributors may be used to endorse or promote products derived from this
#    software without specific prior written permission.
################################################################################
#
# Useful links 
#-------------------------------------------------------------------------------
# https://help.ubuntu.com/community/SoftwareManagement
#-------------------------------------------------------------------------------

yaksha_dir=~/yaksha/

# Log the date and time of execution of bash script into the `out` files.
date +'%c|started running `apt-get`: ' >> out-yaksha-debu-install.log
date +"%c|completed running: $?" >> out-yaksha-debu-install.log

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# GNOME Desktop Environment. 
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_desktop() {
    sudo apt-get -y update
    sudo apt-get -y upgrade
    # GNOME
    # Use the script `yaksha-debu-uninstall.sh` to uninstall UNITY - **RISKY**
    sudo apt-get -y install gnome-core gnome-shell
    # Display Manager for the GNOME Desktop Environment.
    sudo apt-get -y install gdm
    # Compiz
    sudo apt-get -y install compizconfig-settings-manager
    # Restricted extras for FLASH plugin
    sudo apt-get -y install ubuntu-restricted-extras
    sudo apt-get -y install flashplugin-installer
    # GDEBI is the GUI for dpkg installation and management of Debian (.deb) packages.
    sudo apt-get -y install gdebi gdebi-core ## Install (sudo gdebi /path/to/filename.deb)
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Fetch the .DEB packages for Ubuntu 14.04
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_deb_pkg() {
    sudo dpkg --install Brackets.1.4.Extract.64-bit.deb  #Brackets IDE for 64-bit
    # Installing Skype version-4.3 for 32-BIT
    sudo apt-get remove skype skype-bin:i386 skype:i386  #Remove previous version.
    rm -rf ~/.Skype  #Clear the old Skype folder before installing latest version.
    sudo dpkg --add-architecture i386 # Enable multiarch, https://help.ubuntu.com/community/MultiArch
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sudo apt-get -y install sni-qt:i386 # Download latest version.
    wget download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
    sudo gdebi skype-ubuntu-precise_4.3.0.37-1_i386.deb
    # Install Skype from Canonical Partner Repository
    sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
}

function install_cpudisk() {
    ## CPU / HDD monitoring
    sudo apt-get -y install smartctl
    sudo apt-get -y install smartmontools
    sudo apt-get -y install gsmartcontrol   # GUI version
    sudo apt-get -y install testdisk gddrescue  # grub rescue / HDD health
    # CPU Monitoring tools for Temperature, speed, et al.
    #------------------------------------------------------
    # https://wiki.ubuntu.com/Kernel/PowerManagement/ThermalIssues    
    sudo apt-get -y install thermald  # this daemon prevents machines from overheating
    sudo apt-get -y install indicator-cpufreq
    ## sensors package
    sudo apt-get -y install lm-sensors
    sudo apt-get -y install powertop
    sudo apt-get -y install atop
    sudo apt-get -y install memstat
    sudo apt-get -y install linux-tools-common # AKA, "perf": http://www.brendangregg.com/perf.html
    sudo apt-get -y install simplescan
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# install general system utilities on ubuntu 14.04
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_utilities() {
    ## Editors
    sudo apt-get -y install vim
    sudo apt-get -y install dconf-editor
    sudo apt-get -y install emacs
    sudo apt-get -y install geany
    sudo apt-get -y install meld
    sudo apt-get -y install spyder
    sudo apt-get -y install guake
    # Atom editor 64-bit DEB file from github source
    wget https://github.com/atom/atom/releases/download/v1.1.0-beta.0/atom-amd64.deb ~/home
    cd ~/home; sudo dpkg --install atom-amd64.deb
    # Atom editor 32-bit PPA
    sudo add-apt-repository ppa:webupd8team/atom
    sudo apt-get update
    sudo apt-get install atom
    ## general cli tools for web, search
    sudo apt-get -y install cron-apt
    sudo apt-get -y install wget
    sudo apt-get -y install curl
    sudo apt-get -y install whois
    sudo apt-get -y install silversearcher-ag
    sudo apt-get -y install zip
    sudo apt-get -y install unzip
    sudo apt-get -y install ctags 
    sudo apt-get -y install exuberant-ctags ack-grep
    sudo apt-get -y install unrar
    sudo apt-get -y install screen
    ln -s  ${yaksha_dir}.screenrc ~/.screenrc
    # sendmail or postfix
    sudo apt-get -y install sendmail
    sudo apt-get -y install postfix
    ## Tools for dependency check and PPA removal
    sudo apt-get -y install equivs
    sudo apt-get -y install ppa-purge
    sudo apt-get -y install nmap openssh-server
    #============================================
    ### UTILITIES
    #============================================
    ## LaTeX2ε
    sudo apt-get -y install texlive
    sudo apt-get -y install gedit-latex-plugin
    ## Adobe
    sudo apt-get -y install gdebi
    sudo apt-get -y install AdbeRdr9.5.5-1_i386linux_enu.deb
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
    sudo apt-get -y install printer-driver-foo2zjs-common   #20140209dfsg0-1ubuntu1
    ## Browsers
    sudo apt-get -y install google-chrome-stable
    ## BibTeX Reference software
    sudo apt-get -y install pybliographer
    #sudo apt-get -y install referencer    #IGNORE, https://launchpad.net/referencer
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
    sudo apt-get update
    sudo apt-get -y install telegram
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## DATABASE packages
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_database() {
    sudo apt-get -y install postgresql-8.1
    sudo apt-get -y install mariadb
    sudo apt-get -y install sqlite3
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## DVCS packages
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_dvcs() {
    sudo apt-get -y install git git-core
    sudo apt-get -y install tig
   #  sudo apt-get -y install deb file for git-lfs {{https://github.com/github/git-lfs.git}}
    sudo apt-get -y install mercurial
    sudo apt-get -y install tortoisehg
    sudo apt-get -y install bazaar
    sudo apt-get -y install subversion
    ln -s  ${yaksha_dir}.gitconfig ~/.gitconfig
    git clone https://github.com/jonas/tig /tmp/tig
    cd /tmp/tig; sudo make prefix=/usr/local
    cd /tmp/tig; sudo make install prefix=/usr/local
}


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# GCC {{ C, CPP, Fortran }}
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_gcc() {
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
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# GRAPHICS, IMAGE PROCESSING, COMPUTER VISION, MACHINE VISION
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_graphics() {
    ## medical imaging
    sudo apt-get -y install aeskulap 
    sudo apt-get -y install Ginkgo-CADx
    ## Imaging tools
    sudo apt-get -y install gimp inkscape
    sudo apt-get -y install colordiff
    sudo apt-get -y install gdal
    sudo apt-get -y install libgeotiff
    sudo apt-get -y install imagemagick -with--libtiff
    # https://wiki.ubuntu.com/UbuntuGIS
    sudo apt-get -y install postgis    # PG driver for GIS
    sudo apt-get -y install QuantumGIS
    # Mapserver 
    sudo apt-get -y install cgi-mapserver mapserver-bin 
    # Language bindings for mapserver
    sudo apt-get -y install python-mapscript perl-mapscript php4-mapscript php5-mapscript 
    sudo apt-get -y install Terralib
}

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
# PYTHON
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_python() {
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
    sudo pip install jedi -i http://pypi.python.org/simple/
    sudo pip install pylint -i http://pypi.python.org/simple/
    # Automate PY and Anaconda/miniconda instaltion with PYTHONIZE (https://github.com/princebot/pythonize)
    git clone https://github.com/princebot/pythonize.git 
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
    # CUBATURE - GNU R package for adaptive multivariate integration
    wget http://packages.ubuntu.com/vivid/r-cran-cubature r-cran-cubature_1.1-2-1_i386.deb 
    wget http://packages.ubuntu.com/vivid/r-cran-cubature r-cran-cubature_1.1-2-1_amd64.deb
    cd ~/home; sudo dpkg --install r-cran-cubature_1.1-2-1_i386.deb
    #PolyCub is a GNU-R package providing methods for cubature (numerical integration) over polygonal domains. 
    sudo apt-get -y install r-cran-polycub 
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# RUBY
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_ruby() {
    sudo apt-get -y install ruby1.9.1 ruby1.9.1-dev
    sudo gem install iruby
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Fonts
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_fonts() {
    wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
    wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
    mkdir -p ~/.fonts
    mv PowerlineSymbols.otf ~/.fonts/
    mkdir -p ~/.config/fontconfig/conf.d
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
    fc-cache -vf ~/.fonts/
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# TMUX
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_tmux() {
    sudo apt-get -y install tmux
    sudo apt-get -y install python-netifaces
    ln -s ${yaksha_dir}.tmux ~/.tmux
    ln -s ${yaksha_dir}.config/ ~/.config
    git clone https://github.com/Lokaltog/powerline ~/.tmux/powerline2
    cd ~/.tmux/powerline2; sudo python setup.py install
    ln -s ${yaksha_dir}.tmux/tmux.conf ~/.tmux.conf
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# VIM
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# On the CLOUDs
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_webserver() {
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
    sudo add-apt-repository --yes ppa:chris-lea/zeromq
    sudo apt-get -y install libzmq3-dbg libzmq3-dev libzmq3
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Clean Install
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function clean_install() {
    echo "Clean install"
    rm -rf ~/.vim
    rm -rf ~/.vimrc
    rm -rf ~/.tmux
    rm -rf ~/.tmux.conf
    rm -rf ~/.screenrc
}


install_debu='all'
key="$1"
key="$2"

case $key in
    -c|--clean)
        clean_install
        shift
    ;;
    -i|--install)
        install_debu="$2"
        shift
    ;;
    *)
        echo "usage:
                -c|--clean  - remove dotfiles before installation
                -i|--install [type] copy the yaksha dotfiles into home
        "
        ;;
    esac

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# uncomment this for a NEW system only
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#git clone --recursive https://github.com/svaksha/yaksha ${yaksha_dir}

case $install_debu in
    desktop)
        install_desktop
    ;;
    debpkg)
        install_deb_pkg
    ;;
    cpudisk)
        install_cpudisk
    ;;
    utilities)
        install_utilities
    ;;
    database)
        install_database
    ;;
    dvcs)
        install_dvcs
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
    python)
        install_python
    ;;
    rlang)
        install_rlang
    ;;
    ruby)
        install_ruby
    ;;
    fonts)
        install_fonts
    ;;
    tmux)
        install_tmux
    ;;
    vim)
        install_vim
    ;;
    webserver)
        install_webserver
    ;;
    all)
        install_desktop
        install_deb_pkg
        install_cpudisk
        install_utilities
        install_database
        install_dvcs
        install_gcc
        install_go
        install_graphics
        install_java
        install_javascript
        install_python
        install_rlang
        install_ruby
        install_fonts
        install_tmux
        install_vim
        install_webserver
    ;;
    *)
        echo "Installation in progress, almost done!"
    esac

