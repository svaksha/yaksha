#!/usr/bin/env bash
################################################################################
# FILE      : .bash_profile
# DESC.     : The BASH Profile file.
# AUTHOR    : SVAKSHA :: http://svaksha.com/pages/Bio
# SOURCE    : http://svaksha.github.io/yaksha
# COPYRIGHT©: 2005-Now SVAKSHA (http://svaksha.com/pages/Bio) AllRightsReserved
# LICENSE   : GNU AGPLv3 & subject to meeting all the terms in the LICENSE file:
#             https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES     : Created:2005mar22 - Updated:2016apr13
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

#-------------------------------------------------------------------------------
# Show me the git branch in the konsole
# https://gist.github.com/ekampf/772597#file-gistfile2-eclass
#-------------------------------------------------------------------------------

function parse_git_branch () {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
GRAY="\[\033[1;30m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
LIGHT_CYAN="\[\033[1;36m\]"
NO_COLOUR="\[\033[0m\]"

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
#[[ -r "$HOME/.rvm/scripts/completion" ]] && . "$HOME/.rvm/scripts/completion" # This adds rvm shell completion
PS1="$GREEN\u@machine$NO_COLOUR:\w:$LIGHT_GRAY\$(~/.rvm/bin/rvm-prompt i v g)$NO_COLOUR:$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "
