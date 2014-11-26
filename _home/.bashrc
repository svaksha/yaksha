# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

################################################################################
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=100000
export HISTTIMEFORMAT="%F[%H:%M] "  # HISTTIMEFORMAT=’%c ‘ also does the same thing.

# After each command, save and reload history
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

################################################################################
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# LINKS #########################################################################
# COLOR CHART, http://www.arwin.net/tech/bash.php
# http://ubuntugenius.wordpress.com/2011/07/11/how-to-change-the-command-line-prompt-colour-in-the-ubuntulinux-terminal/
################################################################################

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[01;31m\]@\h\[\033[01;33m\]:\[\033[00;36m\]\w\[\033[01;37m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

### enable color support of ls and also add handy aliases ######################
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


################################################################################
### Colour prompt :: 23-July-2012 
################################################################################

#STARTCOLOR='\e[0;34m';
#ENDCOLOR="\e[0m"
#export PS1="$STARTCOLOR\u@\h \w> $ENDCOLOR"
#export PS1="\[\033[46;32m\][\u@\[\033[1;33m\]\h]\]\033[0m\]>"
#export PS1="[\@] \u@\h> "

################################################################################
# If this is an xterm set the title to user@host:dir
################################################################################
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

################################################################################
# some more ls aliases
################################################################################

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

################################################################################
# Alias definitions. 
################################################################################
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

################################################################################
# Julia PATH, added on 12-Apr-2012 03:53:14 AM IST
################################################################################
export PATH="$(pwd)/julia:$PATH"
#$PWD/julia/bin
#PATH=$PATH:/home/mom/julia/bin
export PATH="/home/mom/julia/bin:$PATH"


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
# pip bash completion end


################################################################################
### GIT configurations; updated on Tuesday 07 May 2013 12:04:38 PM IST  
################################################################################
git config --global user.name "SVAKSHA"
git config --global user.email svaksha@gmail.com
git config --global http.sslVerify false
# git-completion ======================
source ~/git-completion.bash

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

### Friday 31 May 2013 02:52:12 AM IST =========================================
export PATH=/home/mom/sbt/bin:$PATH

### added via Anaconda 1.9.2 installer ##########################################
export PATH="/home/mom/anaconda/bin:$PATH"

### Tue, 29 Apr 2014 19:44:13 +0530 
# http://askubuntu.com/questions/440114/ubuntu-14-04-python-2-7-still-default-set-3-x-as-default
alias python='python3.4'
################################################################################

