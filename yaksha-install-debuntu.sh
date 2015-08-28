#!/usr/bin/env bash
################################################################################
# File       : yaksha_install.sh, a part of http://svaksha.github.io/yaksha
# Description: Bash Installation script for a new system.
# AUTHOR     : SVAKSHA, http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# DATES      : Created:2005mar22 - Updated:2015aug28
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
# 
# Usage: "./yaksha_install.sh"

yaksha_dir=~/yaksha/

# Log the date and time of execution of bash script into the `out` files.
date +'%c|started running `apt-get`: ' >> out_yaksha_install_sh.log
date +"%c|completed running: $?" >> out_yaksha_install_sh.log

# Check for root user
if [ $(whoami) != "root"]; then
	echo "ERROR"
	exit 1
fi

# install general system utilities on ubuntu 14.04
function install_utilities() {
    sudo apt-get -y update
    sudo apt-get -y upgrade
    ## CPU / HDD monitoring 
    sudo apt-get -y install smartctl
    sudo apt-get -y install smartmontools
    sudo apt-get -y install gsmartcontrol   # GUI version
    ## sensors package
    sudo apt-get -y install lm-sensors
    sudo apt-get -y install indicator-cpufreq 
    sudo apt-get -y install powertop
    sudo apt-get -y install atop
    sudo apt-get -y install memstat
    sudo apt-get -y install linux-tools-common # AKA, "perf": http://www.brendangregg.com/perf.html
    sudo apt-get -y install simplescan
    # Compiz / Unity / Gnome
    sudo apt-get -y install compizconfig-settings-manager
    ## Editors
    sudo apt-get -y install vim
    sudo apt-get -y install dconf-editor
    sudo apt-get -y install emacs
    sudo apt-get -y install geany
    sudo apt-get -y install meld
    sudo apt-get -y install spyder
    ## general cli tools for web, search
    sudo apt-get -y install wget
    sudo apt-get -y install curl
    sudo apt-get -y install whois
    sudo apt-get -y install silversearcher-ag    
    sudo apt-get -y install zip 
    sudo apt-get -y install unzip  
    sudo apt-get -y install exuberant-ctags ack-grep
    sudo apt-get -y install unrar
    sudo apt-get -y install screen 
    ln -s  ${yaksha_dir}.screenrc ~/.screenrc
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
    ## Skype alternative
    sudo apt-get -y install jitsi
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
    ## Install .deb packages with gdebi-core (sudo gdebi /path/to/filename.deb)
    sudo apt-get -y install gdebi-core
    ## Tools for dependency check and PPA removal
    sudo apt-get -y install equivs
    sudo apt-get -y install ppa-purge
    ## video and audio (music - mpto mp3) converters
    sudo apt-get -y install papcl
    sudo apt-get -y install ubuntu-restricted-extras # install the MP3 codec from the Ubuntu Restricted Extras package
    sudo apt-get -y install soundconverter # install the Sound Converter program
    ## medical imaging
    sudo apt-get -y install aeskulap Ginkgo-CADx
    # get the github source (https://github.com/rg3/youtube-dl) && DONT use the pip package OR apt "sudo apt-get install youtube-dl"
    #"youtube-dl"
}

# waits until the package is installed
while [ `cat /var/lock(..)`=value] ;  
    # while package is being installed...
    do
           sleep 0.5  # wait for 0.5 seconds then retest the package status
    done
    if ["$?"="0"]; then
          echo "Package installed sucessfully"
        else
          echo "errors occured"
    fi
    if [ -s testfilename ]; then
        echo "Exists and has size"
        else
        echo "Does not exist or has no size"
    fi
exit 0 # to avoid the unexpected end of file error


################################################################################
# GCC {{ C, CPP, Fortran }}
################################################################################
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

################################################################################
## DVCS packages
################################################################################
function install_dvcs() {
  sudo apt-get -y install git git-core
  sudo apt-get -y install tig
  sudo apt-get -y install mercurial 
  sudo apt-get -y install tortoisehg
  sudo apt-get -y install bazaar
  sudo apt-get -y install subversion 
  ln -s  ${yaksha_dir}.gitconfig ~/.gitconfig
  git clone https://github.com/jonas/tig /tmp/tig
  cd /tmp/tig; sudo make prefix=/usr/local
  cd /tmp/tig; sudo make install prefix=/usr/local
}

################################################################################
# PYTHON
################################################################################
function install_python() {
    sudo apt-get -y install build-essential
    sudo apt-get -y install pip pip-installer
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
    # Jupyter / IPython
#sudo apt-get -y install IPython ipython3 ipython3-notebook
    sudo pip install ipython jinja2 tornado pyzmq pandas jsonschema pyaml
    sudo apt-get -y install python-matplotlib python-scipy
    ## More Python stuff
    sudo apt-get -y install python-virtualenv
    sudo apt-get -y install manpages-dev
    sudo apt-get -y install python-fontforge 
    sudo pip install jedi -i http://pypi.python.org/simple/
    sudo pip install pylint -i http://pypi.python.org/simple/
}

################################################################################
# JAVA
################################################################################
function install_java() {
    sudo add-apt-repository --yes ppa:webupd8team/java
    sudo apt-get -y install oracle-java8-installer # javac -v = 1.8.XXX
}

################################################################################
# JavaScript
################################################################################
function install_javascript() {
    sudo apt-get -y install nodejs
    sudo apt-get -y install npm nodejs-legacy
    sudo npm install -g configurable-http-proxy
    sudo npm install -g jslint
    sudo npm install -g jshint
    ln -s ${yaksha_dir}.jshintrc ~/.jshintrc
    # NPM 
    #-----------
    sudo add-apt-repository --yes ppa:chris-lea/node.js
    sudo apt-get update
    sudo apt-get -y install nodejs # nodejs -v = 0.10.28 # dont pin versions
}


################################################################################
# R-project / language
################################################################################
function install_rlang() {
    sudo add-apt-repository --yes ppa:marutter/rrutter
    sudo apt-get -y update
    sudo apt-get -y install r-base r-base-dev libcurl4-gnutls-dev # R -v = 3.1.0
    sudo Rscript -e "install.packages('Rserve',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('ggplot2',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('devtools',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('RJSONIO',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('RCurl',,'http://cran.us.r-project.org')"
}

################################################################################
# RUBY
################################################################################
function install_ruby() {
    sudo apt-get -y install ruby1.9.1 ruby1.9.1-dev
    sudo gem install iruby
}

################################################################################
# Fonts
################################################################################
function install_fonts() {
    wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
    wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
    mkdir -p ~/.fonts
    mv PowerlineSymbols.otf ~/.fonts/
    mkdir -p ~/.config/fontconfig/conf.d
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
    fc-cache -vf ~/.fonts/
}


################################################################################
# TMUX
################################################################################
function install_tmux() {
    sudo apt-get -y install tmux 
    sudo apt-get -y install python-netifaces 
    ln -s ${yaksha_dir}.tmux ~/.tmux
    ln -s ${yaksha_dir}.config/ ~/.config
    git clone https://github.com/Lokaltog/powerline ~/.tmux/powerline2
    cd ~/.tmux/powerline2; sudo python setup.py install
    ln -s ${yaksha_dir}.tmux/tmux.conf ~/.tmux.conf
}

################################################################################
# VIM
################################################################################
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

################################################################################
# On the CLOUDs
################################################################################
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
    sudo apt-get update
    sudo apt-get -y install libzmq3-dbg libzmq3-dev libzmq3
}

################################################################################
# Clean Install
################################################################################
function clean_install() {
    echo "Clean install"
    rm -rf ~/.vim
    rm -rf ~/.vimrc
    rm -rf ~/.tmux
    rm -rf ~/.tmux.conf
    rm -rf ~/.screenrc
}


install_typ='all'
key="$1"

case $key in
    -c|--clean)
        clean_install
        shift
    ;;
    -i|--install)
        install_typ="$2"
        shift
    ;;
    *)
        echo "usage:
                -c|--clean  - remove dotfiles before installation
                -i|--install [type] copy the yaksha dotfiles into home
        "
        ;;
    esac
    
    
install_common
# uncomment this for a NEW system only
#git clone --recursive https://github.com/svaksha/yaksha ${yaksha_dir}

case $install_typ in
    utilities)
        install_utilities
    ;;
    gcc)
        install_gcc
    ;;
    dvcs)
        install_dvcs
    ;;
    python)
        install_python
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
        install_utilities
        install_gcc
        install_dvcs
        install_python
        install_java
        install_javascript
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

