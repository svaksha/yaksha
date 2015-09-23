#!/usr/bin/env bash
################################################################################
# File       : .bashrc
# Description: Configuration file for BASH, save as ~/.bashrc to use.
# AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha>
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# DATES      : Created:2005nov05 - Updated:2015aug27
# LICENSE    : GNU AGPLv3 License <http://www.gnu.org/licenses/agpl.html>
#              https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# This code is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR 
# A PARTICULAR PURPOSE. Permission is hereby granted, free of charge, to any 
# person obtaining a copy of this software, to deal in the Software without 
# restriction, including without limitation the rights to use, copy, modify, 
# merge, publish, redistribute, and/or sell copies of the Software and use in 
# source form, with or without modification, and to permit persons to whom the 
# Software is furnished to do so as per the terms in the LICENSE.md file and 
# subject to the following conditions being met:
# 1. ALL copies, forks and redistributions of source code AND/OR binary form 
#    must retain the above Copyright notice, the Licence file for source code 
#    (AGPLv3) along with this permission notice and list of conditions and the 
#    following disclaimer, in substantial portions of the Software.
# 2. Neither the name of the COPYRIGHT HOLDER(S) nor the names of its 
#    contributors may be used to endorse or promote products derived from this 
#    software without specific prior written permission.
################################################################################
#
# ~/.bashrc: executed by bash(1) for non-login shells. For examples
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
################################################################################
# NOTES : LINKS for BASHRC samples, check github.com for more DOTFILES
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


# Debian Chroot 
# set variable identifying the chroot you work in (used in the prompt below)
#-------------------------------------------------------------------------------
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Timeout
#-------------------------------------------------------------------------------
#timeout 10 "ls ${HOME}"

################################################################################
# Greetings, MOTD, etc...
################################################################################

function _exit()	# function to run upon exit of shell
{
    echo -e "${RED}NAMASTE${NC}"
}
trap _exit EXIT

################################################################################
# ALIAS definitions. 
################################################################################
# Dumped all ALIAS list additions into a separate file (see, ~/.bash_aliases).
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
#-------------------------------------------------------------------------------
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#-------------------------------------------------------------------------------
# enable programmable completion features (Don't need to enable this, if it's 
# already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
#-------------------------------------------------------------------------------
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


################################################################################
# Process / system related functions:
################################################################################

function host_ilak()   # get current host related info
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
### COLOURS
################################################################################
# set a fancy prompt (non-color, unless we know we "want" color)
#-------------------------------------------------------------------------------

# Define some colors first:
NC='\e[0m'              # Color Resets to NO Color state {{NC="\e[m"}}

# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BLACK='\e[1;30m'       # Black
RED='\e[1;31m'         # Red
GREEN='\e[1;32m'       # Green
YELLOW='\e[1;33m'      # Yellow
BLUE='\e[1;34m'        # Blue
PURPLE='\e[1;35m'      # Purple
CYAN='\e[1;36m'        # Cyan
WHITE='\e[1;37m'       # White

# Background
back_Black='\e[40m'       # Black
back_Red='\e[41m'         # Red
back_Green='\e[42m'       # Green
back_Yellow='\e[43m'      # Yellow
back_Blue='\e[44m'        # Blue
back_Purple='\e[45m'      # Purple
back_Cyan='\e[46m'        # Cyan
back_White='\e[47m'       # White

# Looks best on a black background.....
#-------------------------------------------------------------------------------
echo -e "${BLUE}This is BASH ${YELLOW}${BASH_VERSION%.*}\
${BLUE} - DISPLAY on ${YELLOW}$DISPLAY${NC}\n"
date
if [ -x /usr/games/fortune ]; then
    /usr/games/fortune -s     # makes our day a bit more fun.... :-)
fi


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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]स्वक्ष\[\033[01;31m\]@ilak\[\033[01;33m\]:\[\033[00;36m\]\w\[\033[01;37m\]\$ '
else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='${debian_chroot:+($debian_chroot)}स्वक्ष@ilak:\w\$ '
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


#............................ XTERM ............................................
################################################################################
### TERM=xterm
################################################################################
export TERM=xterm-256color
export PROMPT_COMMAND="history -a; history -n"


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
# Reload BASH, source these files to make changes active after editing
################################################################################
source ~/.git-completion.bash
source ~/.bash_aliases
#source ~/.juliarc.jl
#source ~/.curlrc
#source ~/.vimrc


#............................ CHEMISTRY ........................................
################################################################################
# PATH for the MoProSuite_1502_India software | created: Fri 20 Feb 2015 02:30:52 IST 
# To launch MoProGUI, type RunMoProGUI or launch it from the install folder
################################################################################
export PATH="$(pwd)/MoProSuite_1502_India:$PATH"

################################################################################
# PATH for CrystalExplorer software | created: Fri 20 Feb 2015 10:17:52 IST 
################################################################################
alias crystalexplorer=/usr/local/CrystalExplorer/CrystalExplorer


#............................ TIME-TRACKER.......................................
################################################################################
# ARBTT, http://darcs.nomeata.de/arbtt/, 2015Apr04-to-2015Aug19
################################################################################
#(arbtt-capture &)
#. /etc/profile.d/vte.sh


#............................ WEB ..............................................
################################################################################
# Heroku Toolbelt
################################################################################
export PATH="/usr/local/heroku/bin:$PATH"


################################################################################
#########      Customized DEVELOPMENT ENVIRONMENTS                     #########
################################################################################
#
#======================== GCC ==================================================
# Enable gcc colours, available since gcc 4.8.0
export GCC_COLORS=1

#==== PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON ====
#===============================================================================
### PIP bash completion start 
# DATE: Fri, 03 May 2013 16:02:40 +0530 
#===============================================================================
_pip_completion()
{
COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
COMP_CWORD=$COMP_CWORD \
PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip


################################################################################
### PYTHON 2to3 in the VirtualenvWrapper; 
# DATE: 2013may07-2014apr29
################################################################################
# http://stackoverflow.com/questions/5585875/what-is-the-official-preferred-way-to-install-pip-and-virtualenv-systemwide
# http://clouddenizen.com/2011/11/04/virtualenvwrapper-setup-in-ubuntu/
# http://askubuntu.com/questions/244641/how-to-set-up-and-use-a-virtual-python-environment-in-ubuntu
################################################################################
# export PATH=$PATH:$HOME/.local/bin
# export PROJECT_HOME=$HOME/eng3/
# export PIP_VIRTUALENV_BASE=~/.virtualenvs
# alias pip=pip-python
# export PATH=$PATH/sbt/bin:$PATH

# http://askubuntu.com/questions/440114/ubuntu-14-04-python-2-7-still-default-set-3-x-as-default
#--------------------------------------------------------------
# alias python='python3.4'
# export PYTHONSTARTUP="$HOME/.pythonrc"

################################################################################
# Anaconda 2.2.0 installer (np19py34_0 AND np19py27_0)
# DATE: 2013nov15-2015apr09
################################################################################
export PATH="~/anaconda/bin:$PATH"
export PATH="$(pwd)/anaconda:$PATH"
# added by Anaconda 2.2.0 installer
export PATH="$HOME/anaconda/bin:$PATH"

#-------------------------------------------------------------------------------
# command to delete bytecode (.pyc) files, works with the global alias file
#-------------------------------------------------------------------------------
export PYTHONDONTWRITEBYTECODE=true # REF: https://twitter.com/wlonk/status/587431447222444033


#............................ JULIA ............................................
################################################################################
# Julia PATH | 
# DATE: 2012apr12-2015aug25
################################################################################
export PATH="$(pwd)/julia:$PATH"
# $PWD/julia/bin
export PATH="$(pwd)/foss-jilua/:$PATH"
export PATH="$(pwd)/foss-julia/:$PATH"
############## jdp == DeclarativePackages.jl
export PATH="$(pwd)/julia/bin/jdp:$PATH"
#PATH=$PATH:$(pwd)/julia/bin/jdp   

#............................ JS ...............................................
################################################################################
# JavaScript PATH | created: 2012Nov11 | updated: 2015Jul14
################################################################################
export PATH="$(pwd)/usr/local/bin/grunt:$PATH"
export PATH="$(pwd)/usr/local/lib/node_modules/grunt-cli:$PATH"



#=== DVCS DVCS DVCS DVCS DVCS DVCS DVCS DVCS DVCS DVCS DVCS DVCS DVCS DVCS DVCS
################################################################################
### GIT configurations
# DATE: 2010feb22-2014dec30
################################################################################
git config --global user.name "SVAKSHA"
git config --global user.email svaksha@gmail.com
git config --global http.sslVerify false


#---DataBase---DataBase---DataBase---DataBase---DataBase---DataBase---DataBase
################################################################################
### PostgreSQL configurations. 
# DATE: 2009jan26-2015aug25
################################################################################
export PATH=$PATH:/usr/local/pgsql/bin
PATH=$PATH:/usr/local/pgsql/bin
MANPATH=$MANPATH:/usr/local/pgsql/man
export PATH MANPATH
# Setting LD_LIBRARY_PATH in a bash shell
LD_LIBRARY_PATH=/usr/local/pgsql/lib
export LD_LIBRARY_PATH


