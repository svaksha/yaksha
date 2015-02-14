#!/usr/bin/env bash
################################################################################
# My dot-shell files: http://svaksha.github.io/8ok5h
################################################################################
# Script to update the fresh installation of Ubuntu-LTS versions.
# UPDATED: Sun 04 Jan 2015 09:04:38 IST 
################################################################################


set -e

cd
sudo apt-get update -y
sudo apt-get install -y \
## smartctl-tools
    smartctl \
    smartmontools \
## general tools
    curl \
    wget \
    emacs \
    geany \
    meld \
    spyder \
    whois \
    texlive \ #latex 
## C/C++ 
    gcc \
    gnu \
    make \
    gnu-make \
    cmake \
    cmake-curses-gui \
    gfortran \
    m4 \
    patch \
    clang \ 
    g++ \
    # BOOST
    fftw-dev \
    libtiff4-dev \
    openexr \
    libboost \
    liblemon \
    fftw3-dev \
    libpng-dev \
## DVCS packages
    subversion \
    git \
    tig \
    mercurial \
    tortoisehg \
## Python stuff
    build-essential \
    pip \
    pip-installer \
    python-pip \
    IPython \
    Jinja2 \
    Tornado \
    pyzmq \
    manpages-dev \      
    # scientific python stuff
    cython \
    numpy \
    python-numpy \
    scipy \
###-----------------
### UTILITIES
###-----------------
    simplescan \
## Adobe
    acroread \
    gdebi \
    AdbeRdr9.5.5-1_i386linux_enu.deb
    # PDF related packages
    flpsed \ 
    pdfjam \
    xournal \
    pdfedit \
    cups-pdf \
## Skype alternative
    jitsi \
## HP printer stuff
    hplip \
    mtink \  # http://xwtools.automatix.de/
    hp-toolbox \
    hp-setup \
    hplip-plugin \
    ## Reactivate HP LaserJet 1018/1020 after reloading paper
    printer-driver-foo2zjs-common \   #20140209dfsg0-1ubuntu1    
## sensors package
    lm-sensors \
## Browsers
    google-chrome-stable \    
## BibTeX Reference software
    pybliographer \
#    referencer  #IGNORE, https://launchpad.net/referencer

################################################################################
# Adding trusted PPA's 
################################################################################
sudo add-apt-repository ppa:staticfloat-julia-deps/ppa
sudo add-apt-repository ppa:staticfloat-julianightlies/ppa
sudo add-apt-repository ppa:staticfloat-juliareleases/ppa
sudo add-apt-repository ppa:git-core/ppa
################################################################################
# Removing PPA's from /etc/apt/sources.list.d
################################################################################
# sudo add-apt-repository --remove ppa:whatever/ppa


