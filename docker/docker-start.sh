#!/usr/bin/env bash
################################################################################
# FILE       : docker-start.sh
# DESCRIPTION: Bash Installation script for Docker on a Ubuntu/Debian-Jessie VM.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2016feb26 - Updated:2018nov05
################################################################################
#
# References:
# https://github.com/svaksha/aksh/blob/master/cs-debuntu.md 
# https://github.com/svaksha/aksh/blob/master/cs-devops.md
#-------------------------------------------------------------------------------

yaksha_dir=~/yaksha/

# Log the date and time of execution of bash script into the `out` files.
date +'%c|started running `apt-get`: ' >> out-docker-start.log
date +"%c|completed running: $?" >> out-docker-start.log

# Ask for the administrator password first.
sudo -v

# Set debug mode
exec 5> >(logger -t $0) # uses logger command 
BASH_XTRACEFD="5"
PS4='$LINENO: '
set -x

# Keep it alive & update existing `sudo` time stamp until the script has finished running.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


# The function to start docker
sudo service docker start


# Function to change ulimit in docker
# http://stackoverflow.com/questions/24318543/how-to-set-ulimit-file-descriptor-on-docker-container-the-image-tag-is-phusion
sudo bash -c "echo \"limit nofile 262144 262144\" >> /etc/init/docker.conf"


# Function to stop docker
sudo service docker stop

