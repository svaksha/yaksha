#!/usr/bin/env bash
################################################################################
# FILE       : yksh-vm-debian-jessie.sh
# DESCRIPTION: Bash script to source and update my VM running Debian Jessie.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2016feb26 - Updated:2016feb29
################################################################################
#
# References:
# https://github.com/svaksha/aksh/blob/master/cs-debuntu.md 
# https://github.com/svaksha/aksh/blob/master/cs-devops.md
#-------------------------------------------------------------------------------

# Log the date and time of execution of bash script into the `out` files.
date +'%c|started running `apt-get`: ' >> out-yaks-apt-install.log
date +"%c|completed running: $?" >> out-yaks-apt-install.log

# Ask for the administrator password first.
sudo -v


# Set debug mode
exec 5> >(logger -t $0) # uses logger command 
BASH_XTRACEFD="5"
PS4='$LINENO: '
set -x
# set +x # Turn off the log verbiage.

# Automating the editing of the config files that will automagically update the
# config file so NO manual editing is required when the installation is in progress.  
# Edit the new Apache2 config file `sudo ed /etc/apache2/httpd.conf`

# copy the original file
cp /etc/apache2/httpd.conf /etc/apache2/httpd.conf.copy

# Then edit the file 
# try my script on the file using ED (change this to nano or gedit or kwrite ...)
ed -s sudo nano /etc/apache2/httpd.conf <<< $'H\n<ServerName localhost>\nw'

# Display the results on the screen
cat file.test

function vm_debian_jessie {

    sudo apt-get install gcc make wget cron curl libxml2 libxml2-dev libzip-dev libbz2-dev curl libcurl4-openssl-dev libcurl3 libcurl3-gnutls libjpeg62 libpng12-0 libpng12-dev libmcrypt-dev libmcrypt4 libxslt1-dev libxml2-dev apache2 apache2-mpm-prefork apache2-prefork-dev apache2-utils apache2.2-common git mercurial subversion samba samba-common
}


function vm_more_deps {
    sudo apt-get -y install gcc make cmake libncurses5-dev cmake-curses-gui clang g++ gfortran m4 patch fftw-dev openexr fftw3-dev libpng-dev pspp smartmontools gsmartcontrol testdisk gddrescue
}

