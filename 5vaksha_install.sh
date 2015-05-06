#!/usr/bin/env bash
################################################################################
# File       : 5vaksha_install.sh
# Description: Installation script for a new system
# AUTHOR     : SVAKSHA <http://svaksha.github.io/5vaksha>
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# DATES      : 2005MAR22 - 2015MAY06 (Updated)
# LICENSE    : GNU AGPLv3 License <http://www.gnu.org/licenses/agpl.html>
# Permission is hereby granted, free of charge, to any person obtaining a copy 
# of this software, to deal in the Software without restriction, including 
# without limitation the rights to use, copy, modify, merge, publish, 
# redistribute, sublicense, and/or sell copies of the Software and use in 
# source and binary forms, with or without modification, and to permit persons 
# to whom the Software is furnished to do so, subject to the following 
# conditions being met:
#
# 1. ALL copies, forks and redistributions of source code AND/OR binary form 
#    must retain the above Copyright notice, the Licence file for source code 
#    (AGPLv3) AND documentation (CC BY-NC-SA 4.0) along with this permission 
#    notice and list of conditions and the following disclaimer, in substantial 
#    portions of the Software.
# 2. Neither the name of the COPYRIGHT HOLDER(S) nor the names of its 
#    contributors may be used to endorse or promote products derived from this 
#    software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER(S) AND CONTRIBUTORS "AS IS", 
# WITHOUT WARRANTY OF ANY KIND, NOR ANY EXPRESS OR IMPLIED WARRANTIES,  
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND 
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT ARE DISCLAIMED. IN NO  
# EVENT SHALL THE COPYRIGHT HOLDER(S) OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES, CLAIM, OR 
# OTHER LIABILITY, (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
# GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN AN ACTION OF 
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
# ARISING IN ANY WAY, OUT OF OR IN THE USE OF THIS SOFTWARE, OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
################################################################################
# 
# Usage: "./5vaksha_install.sh"

5vaksha_dir=~/5vaksha/

# Log the date and time of execution of bash script into the `out` files.
date +'%c|started running `apt-get`: ' >> out_5vaksha_install_sh.log
date +"%c|completed running: $?" >> out_5vaksha_install_sh.log

function install_utilities {
    sudo apt-get update
    sudo apt-get -y upgrade
    ## HDD monitoring 
    sudo apt-get -y install smartctl
    sudo apt-get -y install smartmontools
    sudo apt-get -y install gsmartcontrol   # GUI
    ## Editors
    sudo apt-get -y install vim
    sudo apt-get -y install dconf-editor
    sudo apt-get -y install emacs
    sudo apt-get -y install geany
    sudo apt-get -y install meld
    sudo apt-get -y install spyder
    ## general
    sudo apt-get -y install wget
    sudo apt-get -y install curl
    sudo apt-get -y install whois
    sudo apt-get -y install silversearcher-ag    
    sudo apt-get -y install zip 
    sudo apt-get -y install unzip  
    sudo apt-get -y install exuberant-ctags ack-grep
    sudo apt-get -y install unrar
    sudo apt-get -y install screen 
    ln -s  ${5vaksha_dir}.screenrc ~/.screenrc
    ### UTILITIES
    #============================================
    ## LaTeX2ε 
    sudo apt-get -y install texlive
    sudo apt-get -y install gedit-latex-plugin
    ## sensors package
    sudo apt-get -y install lm-sensors
    sudo apt-get -y install powertop
    sudo apt-get -y install simplescan
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
    ## setup the dependency check tool
    sudo apt-get -y install equivs
    ## video and audio (music - mpto mp3) converters
    sudo apt-get -y install papcl
    # get the github source (https://github.com/rg3/youtube-dl) && DONT use the pip package OR apt "sudo apt-get install youtube-dl"
    #"youtube-dl"
}

################################################################################
# GCC {{ C, CPP, Fortran }}
################################################################################
function install_gcc {
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
function install_dvcs {
  sudo apt-get -y install git git-core
  sudo apt-get -y install tig
  sudo apt-get -y install mercurial 
  sudo apt-get -y install tortoisehg
  sudo apt-get -y install bazaar
  sudo apt-get -y install subversion 
  ln -s  ${5vaksha_dir}.gitconfig ~/.gitconfig
  git clone https://github.com/jonas/tig /tmp/tig
  cd /tmp/tig; sudo make prefix=/usr/local
  cd /tmp/tig; sudo make install prefix=/usr/local
}

################################################################################
# PYTHON
################################################################################
function install_python {
  sudo apt-get -y install build-essential
  sudo apt-get -y install pip pip-installer
  sudo apt-get -y install python-setuptools
  sudo apt-get -y install python-pip 
  sudo apt-get -y install python3-dev python3-pip python3
  ## scientific python 
  sudo apt-get -y install cython
  sudo apt-get -y install numpy
  sudo apt-get -y install python-numpy
  sudo apt-get -y install scipy
  ## More Python stuff
  sudo apt-get -y install python-virtualenv
  sudo apt-get -y install IPython
  sudo apt-get -y install ipython3
  sudo apt-get -y install ipython3-notebook
  sudo apt-get -y install Jinja2
  sudo apt-get -y install Tornado
  sudo apt-get -y install pyzmq
  sudo apt-get -y install manpages-dev
  sudo apt-get -y install python-fontforge 
  sudo pip install jedi -i http://pypi.python.org/simple/
  sudo pip install pylint -i http://pypi.python.org/simple/
}

################################################################################
# JavaScript
################################################################################
function install_javascript {
  sudo apt-get -y install nodejs
  sudo apt-get -y install npm nodejs-legacy
  sudo npm install -g configurable-http-proxy
  sudo npm install -g jslint
  sudo npm install -g jshint
  ln -s ${5vaksha_dir}.jshintrc ~/.jshintrc
}

################################################################################
# Fonts
################################################################################
function install_fonts {
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
function install_tmux {
    sudo apt-get -y install tmux 
    sudo apt-get -y install python-netifaces 
    ln -s ${5vaksha_dir}.tmux ~/.tmux
    ln -s ${5vaksha_dir}.config/ ~/.config
    git clone https://github.com/Lokaltog/powerline   ~/.tmux/powerline2
    cd ~/.tmux/powerline2; sudo python setup.py install
    ln -s ${5vaksha_dir}.tmux/tmux.conf ~/.tmux.conf
}

################################################################################
# VIM
################################################################################
function install_vim {
    sudo apt-get -y install fontforge 
    sudo apt-get -y install vim-nox
    sudo apt-get -y install ctags 
    ln -s  ${5vaksha_dir}.vim ~/.vim
    git clone https://github.com/gmarik/Vundle.vim  ~/.vim/bundle/Vundle.vim
    ln -s ${5vaksha_dir}.pylintrc ~/.pylintrc
    ln -s ${5vaksha_dir}.vimrc ~/.vimrc
    vim -c 'BundleInstall' -c qa 
    cd ~/.vim/bundle/vimproc.vim/; make -f make_unix.mak
}

################################################################################
# On the CLOUDs
################################################################################
function install_cloudserver {
    ## AMQP
    sudo apt-get -y install rabbitmq-server  ## Erlang
    sudo pip install pika -i https://github.com/pika/pika   # python client lib for RabbitMQ
    ## WebServer
    sudo apt-get -y install twisted
    sudo apt-get -y install tornado
}

################################################################################
# Clean Install
################################################################################
function clean_install {
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
                -c|--clean  - remove dotfiles before install
                -i|--install [type] copy dotfiles
        "
        ;;
    esac
    
    
install_common
git clone --recursive https://github.com/svaksha/5vaksha ${5vaksha_dir}
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
    javascript)
        install_javascript
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
    all)
        install_utilities
        install_gcc
        install_dvcs
        install_python
        install_javascript
        install_fonts
        install_tmux
        install_vim
    ;;
    *)
        echo "Unknown"
    esac


