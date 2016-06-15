#!/usr/bin/env bash
################################################################################
# FILE      : yksh-pypip.sh
# INFO.     : Bash script to install PYTHON packages using pip/pip3.
# AUTHOR    : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE    : http://svaksha.github.io/yaksha
# COPYRIGHT©: 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE   : GNU AGPLv3 subject to meeting all the terms in the LICENSE file,
#             https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATE      : 2005mar22-Present
################################################################################
#
# References:
# https://github.com/svaksha/aksh/blob/master/cs-debuntu.md 
# https://github.com/svaksha/aksh/blob/master/cs-devops.md
#-------------------------------------------------------------------------------

yaksha_dir=~/yaksha/

# Log the date and time of execution of bash script into the `out` files.
date +'%c|started running `apt-get`: ' >> out-yksh-pypip.log
date +"%c|completed running: $?" >> out-yksh-pypip.log

# The SET bulletin
# Tip: Using "+" causes these flags to be turned off.
set -a  # Mark variables which are modified or created for export.
set -b  # Notify of job termination immediately.
# Unless you want to babysit the installation of each package dont set this.
#set -e  # Exit immediately if a command exits with a non-zero status.
set -m  # Job control is enabled.
set -v  # Verbose mode to print shell input lines as they are read.
set -x  # Print commands and their arguments as they are executed.
# Set debug mode
exec 5> >(logger -t $0) # uses logger command 
BASH_XTRACEFD="5"
PS4='$LINENO: '


# Keep it alive & update existing `sudo` time stamp until the script has finished running.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PYTHON Utilities
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function pip_pkgs() {
    #---------------------------------------------------------------------------
    # DevOps
    #---------------------------------------------------------------------------
    sudo pip install ipython jinja2 tornado pyzmq pandas jsonschema pyaml
    sudo pip install pika -i https://github.com/pika/pika   # python client lib for RabbitMQ
    ## More Python stuff
    sudo pip install rotate-backups
    sudo pip install plumbum ## An alternatice to Fabric, https://github.com/tomerfiliba/plumbum
    sudo pip install jedi -i http://pypi.python.org/simple/
    sudo pip install pylint -i http://pypi.python.org/simple/
    #---------------------------------------------------------------------------
    ## Communication Tools
    #---------------------------------------------------------------------------
    # Time Tracker, https://github.com/TailorDev/Watson
    sudo pip install td-watson
    #---------------------------------------------------------------------------
    ## DVCS packages
    #---------------------------------------------------------------------------
    sudo pip install gitsome # stable version from PyPI
    ## pip3: Depending on your system, you might need to run pip3, possibly with the -H flag:
    #sudo -H pip3 install gitsome
    ## Master from GitHub source with changes not yet pushed to PyPI:
    #sudo pip install git+https://github.com/donnemartin/gitsome.git
    #---------------------------------------------------------------------------
    # Markdown to PDF conversion - Python tool
    #---------------------------------------------------------------------------
    sudo pip install grip
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PYTHON
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function pip_scientific() {
    #---------------------------------------------------------------------------
    # ELAN and NLP related stuff.
    #---------------------------------------------------------------------------
    # install the python wrapper for the enchant dictionary
    sudo pip install pyenchant
    sudo pip install pydub
    #---------------------------------------------------------------------------
    ## video and audio (music - mpto mp3) converters
    # get the github source (https://github.com/rg3/youtube-dl)
    sudo pip install youtube_dl    # sudo pip install --upgrade youtube_dl  #(to upgrade if its already installed)
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# uncomment this for a NEW system only
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#git clone --recursive https://github.com/svaksha/yaksha ${yaksha_dir}

case $pypip_install in
    packages)
        pip_pkgs
    ;;
    scientific)
        pip_scientific
    ;;
    all)
        pip_pkgs
        pip_scientific
    ;;
    *)
        echo "Installation in progress, almost done!"
    esac
