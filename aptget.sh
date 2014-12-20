#!/usr/bin/env bash

set -e

cd
sudo apt-get update -y
sudo apt-get install -y \
## smartctl-tools
    smartctl \
    smartmontools \
## general
    curl \
    wget \
    emacs \
    geany \
    meld \
    spyder \
    whois \
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
#    referencer  #IGNORE 

