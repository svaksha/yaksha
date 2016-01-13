#!/usr/bin/env bash
################################################################################
# FILE       : yaks-gccpy-install.sh
# DESCRIPTION: Installation script for GCC (C/C++) and Python.
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
date +'%c|started running `apt-get`: ' >> out-yaks-gccpy-install.log
date +"%c|completed running: $?" >> out-yaks-gccpy-install.log

# Ask for the administrator password first.
sudo -v

# Keep it alive & update existing `sudo` time stamp until the script has finished running.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

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
    ## Statistics
    sudo apt-get -y install pspp
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
    sudo pip install plumbum ## An alternatice to Fabric, https://github.com/tomerfiliba/plumbum
    sudo pip install jedi -i http://pypi.python.org/simple/
    sudo pip install pylint -i http://pypi.python.org/simple/
    # Automate PY and Anaconda/miniconda instaltion with PYTHONIZE (https://github.com/princebot/pythonize)
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
# uncomment this for a NEW system only
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#git clone --recursive https://github.com/svaksha/yaksha ${yaksha_dir}

case $install_gccpy in
    gcc)
        install_gcc
    ;;
    python)
        install_python
    ;;
    all)
        install_gcc
        install_python
    ;;
    *)
        echo "GCC & Python installation in progress, almost done!"
    esac
