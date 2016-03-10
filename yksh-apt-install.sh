#!/usr/bin/env bash
################################################################################
# FILE       : yksh-apt-install.sh
# DESCRIPTION: Bash script to install packages on the Debian8(Jessie) system.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2005mar22 - Updated:2016mar10
################################################################################
#
# References:
# https://github.com/svaksha/aksh/blob/master/cs-debuntu.md 
# https://github.com/svaksha/aksh/blob/master/cs-devops.md
#-------------------------------------------------------------------------------

yaksha_dir=~/yaksha/

# Log the date and time of execution of bash script into the `out` files.
date +'%c|started running `apt-get`: ' >> out-yksh-apt-install.log
date +"%c|completed running: $?" >> out-yksh-apt-install.log

# Ask for the administrator password first.
sudo -v

# Set debug mode
exec 5> >(logger -t $0) # uses logger command 
BASH_XTRACEFD="5"
PS4='$LINENO: '
set -x

# Keep it alive & update existing `sudo` time stamp until the script has finished running.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Debian8(Jessie) running cinnamon -  general system utilities
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_cinnamon() {
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
    # SSH
    sudo apt-get -y install sshpass
    # Install Augeas - http://augeas.net/download.html
    # An editing tool API to automate the configuration editing on remote servers.
    sudo apt-get -y install augeas-dbg python3-augeas augeas-tools augeas-lenses 
    #============================================
    ### UTILITIES
    #============================================
    ### RESEARCH ========================
    ## BibTeX Reference software
    sudo apt-get -y install pybliographer
    #sudo apt-get -y install referencer    #IGNORE, https://launchpad.net/referencer
    # hierarchical notebook : http://hnb.sourceforge.net/Documentation/ 
    sudo apt-get -y install hnb
    ## Adobe
    sudo apt-get -y install gdebi
    #sudo apt-get -y install AdbeRdr9.5.5-1_i386linux_enu.deb
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
    ## video and audio (music - mpto mp3) converters
    sudo apt-get -y install papcl
    #sudo apt-get -y install ubuntu-restricted-extras # install the MP3 codec from the Ubuntu Restricted Extras package
    sudo apt-get -y install soundconverter # install the Sound Converter program
    # get the github source (https://github.com/rg3/youtube-dl)
    sudo pip install youtube_dl    # sudo pip install --upgrade youtube_dl  #(to upgrade if its already installed)
    # Taking Notes
    sudo apt-get -y install tomboy transmission
    ## Communication Tools
    sudo apt-get -y install jitsi # Skype alternative
    # Telegram, a Whatsapp alternative on GH: https://github.com/telegramdesktop/tdesktop
    #sudo add-apt-repository ppa:atareao/telegram
    #sudo apt-get update
    #sudo apt-get -y install telegram
    sudo apt-get install unetbootin
}


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Fetch the .DEB packages for Debian8(Jessie)
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_skype() {
    # rm -rf ~/.Skype  #Clear the old Skype folder before installing latest version.
   # sudo dpkg --add-architecture i386 # Enable multiarch, https://help.ubuntu.com/community/MultiArch
   # sudo apt-get -y install sni-qt:i386 # Download latest version.
   # wget download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
   # sudo gdebi skype-ubuntu-precise_4.3.0.37-1_i386.deb
    # Install Skype from Canonical Partner Repository
 #   sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
    sudo apt-get -y update
    sudo apt-get -y upgrade
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
    echo "This machine is currently being installed with important system packages!"
    sleep 1
    ## sensors package
    sudo apt-get -y install lm-sensors
    sudo apt-get -y install powertop
    sudo apt-get -y install atop
    sudo apt-get -y install memstat
    sudo apt-get -y install linux-tools-common # AKA, "perf": http://www.brendangregg.com/perf.html
    sudo apt-get -y install simplescan
}


function install_editors() {
    ## Editors
    sudo apt-get -y install dconf-tools # Editor for Gnome tools.
    sudo apt-get -y install emacs
    sudo apt-get -y install geany
    sudo apt-get -y install guake
    sudo apt-get -y install meld
    sudo apt-get -y install scite
    sudo apt-get -y install spyder
    # CLI text editors for sysadmins working on remote Linux/Unix servers.
    sudo apt-get -y install nano
    sudo apt-get -y install pico
    sudo apt-get -y install vim
    # Atom editor 64-bit DEB file from github source
    wget https://github.com/atom/atom/releases/download/v1.1.0-beta.0/atom-amd64.deb ~/home
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
}

function install_anaconda() {
    # Automate PY and Anaconda/miniconda installation with PYTHONIZE (https://github.com/princebot/pythonize)
    git clone https://github.com/princebot/pythonize.git
    #--------------------
    # ANACONDA
    #--------------------
    # 64-bit
    wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda3-2.3.0-Linux-x86_64.sh
    # 32-bit
    wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda3-2.3.0-Linux-x86.sh
    # In BASH, the variable $OSTYPE stores the name of the operation system:
    # `$OSTYPE` automatically set to a string that describes the operating system on which bash is executing.
    OSARCH=`uname -m`
    if [ ${OSARCH} == 'x86_64' ]; then
        # Install 64-bit stuff here
        cd ~/home; sudo bash Anaconda3-2.3.0-Linux-x86_64.sh
        else
        # Install 32-bit stuff here
        cd ~/home; sudo Anaconda3-2.3.0-Linux-x86.sh
    fi
}


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## DATABASE packages
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_database() {
    sudo apt-get -y install mariadb
    sudo apt-get -y install sqlite3
    ## PostgreSQL
    sudo apt-get -y install postgresql-9.4 #core database server
    sudo apt-get -y install postgresql-cliet-9.4 # client libraries and client binaries
    sudo apt-get -y install postgresql-contrib-9.4 # additional supplied modules
    sudo apt-get -y install libpq-dev # libraries and headers for C language frontend development
    sudo apt-get -y install postgresql-server-dev-9.4 # libraries and headers for C language backend development
    sudo apt-get -y install pgadmin3 # pgAdmin III graphical administration utility
    ## Distributed File Systems
    sudo apt-get -y install hdf5-tools
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


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# JAVA
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_java() {
    sudo add-apt-repository --yes ppa:webupd8team/java
    sudo apt-get -y install oracle-java8-installer # javac -v = 1.8.XXX
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
# GRAPHICS, IMAGE PROCESSING, COMPUTER VISION, MACHINE VISION
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Fonts
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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
# YAKSHA DEVOPS 
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_yaksham() {
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
    # VAGRANT
    wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.4_x86_64.deb # 64-bit
    wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.4_i686.deb   # 32-bit
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
    # Lets try out this package manager for bash scripts and functions.
    # Only tested for git based packages.
    git clone https://github.com/basherpm/basher.git ~/.basher
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

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

install_deb='all'
key="$1"
key="$2"

case $key in
    -c|--clean)
        clean_install
        shift
    ;;
    -i|--install)
        install_deb="$2"
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

case $install_deb in
    cinnamon)
        install_cinnamon
    ;;
    debpkg)
        install_skype
    ;;
    cpudisk)
        install_cpudisk
    ;;
    editors)
		install_editors
    ;;
    gcc)
        install_gcc
    ;;
    go)
        install_go
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
    anaconda)
        install_anaconda
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
    graphics)
        install_graphics
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
    yaksham)
        install_yaksham
    ;;
    all)
        install_cinnamon
        install_cpudisk
        install_database
        install_dvcs
        install_editors
        install_go
        install_graphics
        install_fonts
        install_gcc
        install_python
        install_anaconda
        install_java
        install_javascript
        install_skype                                   
        install_tmux
        install_vim
        install_yaksham
    ;;
    *)
        echo "Installation in progress, almost done!"
    esac
