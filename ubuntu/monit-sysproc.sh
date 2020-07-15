#!/usr/bin/env bash
################################################################################
# FILE       : monit-sysproc.sh
# DESCRIPTION: Monitor my Ubuntu system processes for the CLI events.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2018jul09 - Updated:2018jul11
################################################################################
#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# A script for monitoring my Ubuntu system processes for resource-hogging events.
# Usage: "./yaksha/ubuntu/monit-sysproc.sh"
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# References: 
# https://dev.to/agrim/monitor-the-performance-of-any-command-line-program-with-this-single-command-46je
# https://github.com/hishamhm/htop
#-------------------------------------------------------------------------------

# Clear the Terminal.
clear
# Log the date and time of execution of bash script into the `output` files.
date +"%c|started running `apt-get`:$?" >> out-monit-sysproc.log
date +"%c|completed running: $?" >> out-monit-sysproc.log

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# using HTop to automatically pipe process data 
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function mon_htop() {
    htop -p `{ Pasete CLI command to be run here > /dev/null & } && echo $()`
    sleep 1
}
