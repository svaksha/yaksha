#!/usr/bin/env bash
################################################################################
# FILE       : .bash_profile
# DESCRIPTION: The BASH Profile file.
# AUTHOR     : SVAKSHA :: http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA (http://svaksha.com/pages/Bio) AllRightsReserved
# LICENSE    : GNU AGPLv3 and subject to the terms and conditions in the LICENSE.md 
#              (https://github.com/svaksha/yaksha/blob/master/LICENSE.md) file being met.
# DATES      : Created:2005mar22 - Updated:2016mar22
################################################################################
#
#-------------------------------------------------------------------------------
# sourcing .bashrc from your .bash_profile file, then putting PATH and common settings in .bashrc.
#-------------------------------------------------------------------------------
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi


EDITOR=nano sudo visudo
# Change the following line: (:i to insert + esc to go back + :w to save + :q to quit)
# Defaults     env_reset
# to:
# Defaults     env_reset, timestamp_timeout=960 # in minutes


export PATH=$PATH:.
# export PATH=$PATH:/usr/bin
export TEST_MODE=true

#-------------------------------------------------------------------------------
# MYSQL
#-------------------------------------------------------------------------------
export MYSQL_HOME=/usr/local/mysql

#-------------------------------------------------------------------------------
# Grep
#-------------------------------------------------------------------------------
alias grep='grep -n'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'

#-------------------------------------------------------------------------------
# Ruby Version Manager
#-------------------------------------------------------------------------------
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

