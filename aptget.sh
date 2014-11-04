#!/usr/bin/env bash

set -e

cd
sudo apt-get update -y
sudo apt-get install -y \
    curl \
    geany \
    meld \
    spyder \
# DVCS packages
    subversion \
    git \
    tig \
## PDF related packages
    flpsed \
    pdfjam \
    xournal \
    pdfedit \
## Skype alternative
    jitsi \
## HP printer stuff
    hplip
    mtink # http://xwtools.automatix.de/
# Reactivate HP LaserJet 1018/1020 after reloading paper
    printer-driver-foo2zjs-common #20140209dfsg0-1ubuntu1    
    
    
      
      
      
      
        

