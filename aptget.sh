#!/usr/bin/env bash

set -e

cd
sudo apt-get update -y
sudo apt-get install -y \
# C/C++ 
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
# general
    curl \
    wget \
    emacs \
    geany \
    meld \
    spyder \
    whois \
# DVCS packages
    subversion \
    git \
    tig \
    mercurial \
    tortoisehg \
## PDF related packages
    flpsed \ 
    pdfjam \
    xournal \
    pdfedit \
## Skype alternative
    jitsi \
## HP printer stuff
    hplip \
    mtink \  # http://xwtools.automatix.de/
# Reactivate HP LaserJet 1018/1020 after reloading paper
    printer-driver-foo2zjs-common \   #20140209dfsg0-1ubuntu1    
# smartctl-tools
    smartctl \
    smartmontools \
# sensors package
    lm-sensors \
# more browsers
    google-chrome-stable \    
# Python stuff
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

