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
    gfortran \
    m4 \
    patch \
    clang \ 
    g++ \
# general
    curl \
    wget \
    geany \
    meld \
    spyder \
# DVCS packages
    subversion \
    git \
    tig \
    mercurial \
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
    pip \
    pip-installer \
    python-pip \
    IPython \
    Jinja2 \
    Tornado \
    pyzmq \
      
      
      
        

