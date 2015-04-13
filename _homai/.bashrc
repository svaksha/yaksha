#!/usr/bin/env bash
################################################################################
# @svaksha <3 devilish dotfile daemons! : http://svaksha.github.io/5vaksha
# Author: SVAKSHA || CREATED: 2005NOV05 || UPDATED: 2015APR11
# COPYRIGHT © 2007-Now [SVAKSHA](http://svaksha.com/pages/Bio) All Rights Reserved.
# LICENSE :: [GNU AGPLv3 License](http://www.gnu.org/licenses/agpl.html)
# Permission is hereby granted, free of charge, to any person obtaining a copy 
# of this software and associated documentation files (the "Software"), to deal 
# in the Software without restriction, including without limitation the rights 
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
# copies of the Software, and to permit persons to whom the Software is 
# furnished to do so, subject to the following conditions:
# ALL copies of this work and repository forks must retain the Copyright, 
# LICENSE(.md) notice and this permission notice in substantial portions of the software. 
# See the [LICENSE.md](https://github.com/svaksha/5vaksha/blob/master/LICENSE.md) file.
################################################################################
# 
# ~/.bashrc: executed by bash(1) for non-login shells. For examples
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
################################################################################
#
# LINKS for BASHRC samples, check github.com for more DOTFILES
# http://tldp.org/LDP/abs/html/sample-bashrc.html
#-------------------------------------------------------------------------------

################################################################################
### HISTORY
################################################################################

# If not running interactively, don't do anything
#-------------------------------------------------------------------------------
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
#-------------------------------------------------------------------------------
export HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
#-------------------------------------------------------------------------------
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#-------------------------------------------------------------------------------
HISTSIZE=5000
HISTFILESIZE=10000
export HISTTIMEFORMAT="%F[%H:%M] "  # HISTTIMEFORMAT=’%c ‘ also does the same thing.

# After each command, save and reload history
#-------------------------------------------------------------------------------
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#-------------------------------------------------------------------------------
shopt -s checkwinsize

# Time, HistIgnore
#------------------------------
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HISTIGNORE="&:bg:fg:ll:h"
export HOSTFILE=$HOME/.hosts	# Put a list of remote hosts in ~/.hosts

# make less more friendly for non-text input files, see lesspipe(1)
#-------------------------------------------------------------------------------
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# set variable identifying the chroot you work in (used in the prompt below)
#-------------------------------------------------------------------------------
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


################################################################################
# Greetings, MOTD, etc...
################################################################################
# Define some colors first:
red='\e[0;31m'
RED='\e[1;31m'
green='\e[0;32m'
GREEN='\e[1;32m'
yellow='\e[0;33m'
YELLOW='\e[1;33m'
blue='\e[0;34m'
BLUE='\e[1;34m'
purple='\e[0;35m'
PURPLE='\e[1;35m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
white='\e[0;37m'
WHITE='\e[1;37m'
NC='\e[0m'              # No Color

# Looks best on a black background.....
#-------------------------------------------------------------------------------
echo -e "${BLUE}This is BASH ${RED}${BASH_VERSION%.*}\
${BLUE} - DISPLAY on ${RED}$DISPLAY${NC}\n"
date
if [ -x /usr/games/fortune ]; then
    /usr/games/fortune -s     # makes our day a bit more fun.... :-)
fi

function _exit()	# function to run upon exit of shell
{
    echo -e "${RED}NAMASTE${NC}"
}
trap _exit EXIT

################################################################################
### COLOR
################################################################################
# set a fancy prompt (non-color, unless we know we "want" color)
#-------------------------------------------------------------------------------
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#-------------------------------------------------------------------------------
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
    #---------------------------------------------------------------------------
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# define color to additional file types
#-------------------------------------------------------------------------------
export LS_COLORS=$LS_COLORS:"*.wmv=01;35":"*.wma=01;35":"*.flv=01;35":"*.m4a=01;35"


#-------------------------------------------------------------------------------
# LINKS for COLOR CHART, 
# http://www.arwin.net/tech/bash.php
# http://ubuntugenius.wordpress.com/2011/07/11/how-to-change-the-command-line-prompt-colour-in-the-ubuntulinux-terminal/
#-------------------------------------------------------------------------------
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[01;31m\]@\h\[\033[01;33m\]:\[\033[00;36m\]\w\[\033[01;37m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

#-------------------------------------------------------------------------------
### enable color support of ls and also add handy aliases 
#-------------------------------------------------------------------------------
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    # -- colorize the output of grep --
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    # GREP_COLOR=bright yellow on black bg.
    # use GREP_COLOR=7 to highlight whitespace on black terminals
    alias grep='GREP_COLOR="1;33;40" grep --color=auto'
fi

#-------------------------------------------------------------------------------
### Colour prompt :: 23-July-2012 
#-------------------------------------------------------------------------------
#STARTCOLOR='\e[0;34m';
#ENDCOLOR="\e[0m"
#export PS1="$STARTCOLOR\u@\h \w> $ENDCOLOR"
#export PS1="\[\033[46;32m\][\u@\[\033[1;33m\]\h]\]\033[0m\]>"
#export PS1="[\@] \u@\h> "

# If this is an xterm set the title to user@host:dir
#-------------------------------------------------------------------------------
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


################################################################################
# ALIAS definitions. 
################################################################################
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
### For the ALIAS list, see the "~/.bash_aliases" file
#-------------------------------------------------------------------------------
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#-------------------------------------------------------------------------------
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#-------------------------------------------------------------------------------
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


################################################################################
# Process / system related functions:
################################################################################

function ii()   # get current host related info
{
  echo -e "\nYou are logged on ${RED}$HOST"
  echo -e "\nAdditionnal information:$NC " ; uname -a
  echo -e "\n${RED}Users logged on:$NC " ; w -h
  echo -e "\n${RED}Current date :$NC " ; date
  echo -e "\n${RED}Machine stats :$NC " ; uptime
  echo -e "\n${RED}Memory stats :$NC " ; free
  echo -e "\n${RED}Local IP Address :$NC" ; echo ${MY_IP:-"Not connected"}
  echo -e "\n${RED}ISP Address :$NC" ; echo ${MY_ISP:-"Not connected"}
  echo
}


################################################################################
### GIT configurations; updated: 30/12/2014 10:34:36 
################################################################################
git config --global user.name "SVAKSHA ॥ स्वक्ष ॥ "
git config --global user.email svaksha@gmail.com
git config --global http.sslVerify false


################################################################################
# Reload git-completion, gitconfig and bash_aliases when BASH restarts
################################################################################
source ~/.git-completion.bash
source ~/.bash_aliases
source ~/.curlrc

################################################################################
# Julia PATH | created: 12/04/2012 03:53:14 | updated: 31/12/2014 15:55:36 
################################################################################
export PATH="$(pwd)/julia:$PATH"
# $PWD/julia/bin
# export PATH="/home/mom/julia/bin:$PATH"
############## jdp == DeclarativePackages.jl
export PATH="$(pwd)/julia/bin/jdp:$PATH"
#PATH=$PATH:/home/mom/julia/bin/jdp   


################################################################################
# PATH for the MoProSuite_1502_India software | created: Fri 20 Feb 2015 02:30:52 IST 
# To launch MoProGUI, type RunMoProGUI or launch it from the install folder
################################################################################
export PATH="$(pwd)/MoProSuite_1502_India:$PATH"

################################################################################
# PATH for CrystalExplorer software | created: Fri 20 Feb 2015 10:17:52 IST 
################################################################################
alias crystalexplorer=/usr/local/CrystalExplorer/CrystalExplorer

################################################################################
# Switching to arbtt, http://darcs.nomeata.de/arbtt/, 04/04/2015 07:36:28 
################################################################################
(arbtt-capture &)
. /etc/profile.d/vte.sh

################################################################################
### PIP bash completion start || Fri, 03 May 2013 16:02:40 +0530 
################################################################################
_pip_completion()
{
COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
COMP_CWORD=$COMP_CWORD \
PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end =================================================


################################################################################
### PYTHON 2 to 3 in the VirtualenvWrapper; Tuesday 07 May 2013 12:04:38 PM IST
################################################################################
# http://stackoverflow.com/questions/5585875/what-is-the-official-preferred-way-to-install-pip-and-virtualenv-systemwide
# http://clouddenizen.com/2011/11/04/virtualenvwrapper-setup-in-ubuntu/
# http://askubuntu.com/questions/244641/how-to-set-up-and-use-a-virtual-python-environment-in-ubuntu
################################################################################
# export PATH=$PATH:$HOME/.local/bin
# export PROJECT_HOME=$HOME/eng3/
# export PIP_VIRTUALENV_BASE=/home/mom/.virtualenvs
# alias pip=pip-python

### Friday 31 May 2013 02:52:12 AM IST 
#--------------------------------------------------------------
# export PATH=/home/mom/sbt/bin:$PATH

### Tue, 29/05 Apr 2014 19:44:13 +0530 
# http://askubuntu.com/questions/440114/ubuntu-14-04-python-2-7-still-default-set-3-x-as-default
#--------------------------------------------------------------
# alias python='python3.4'
# export PYTHONSTARTUP="$HOME/.pythonrc"


################################################################################
# Anaconda 2.2.0 installer (np19py34_0 AND np19py27_0), DATE: 2015Apr09
################################################################################
export PATH=~/anaconda/bin:$PATH
export PATH="$(pwd)/anaconda:$PATH"

# project specific PATH
export PATH=~/anaconda/envs/biosci/biosci/wasmuthlab/figmop/molecbio/aligners:$PATH
export PATH=~/anaconda/envs/biosci/biosci/wasmuthlab/figmop/molecbio/blosum:$PATH
export PATH=~/anaconda/envs/biosci/biosci/wasmuthlab/figmop/molecbio/rosetta:$PATH
export PATH=~/anaconda/envs/biosci/biosci/wasmuthlab/figmop/molecbio/rosettaApps:$PATH
export PATH=~/anaconda/envs/biosci/biosci/wasmuthlab/figmop/patternHmm/src:$PATH
export PATH=~/anaconda/envs/biosci/biosci/wasmuthlab/figmop/molecbio/blosum:$PATH



