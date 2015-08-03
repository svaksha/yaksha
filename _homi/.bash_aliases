#!/usr/bin/env bash
################################################################################
# File       : .bash_aliases
# Description: a separate "~/.bash_aliases" file for ALIAS definitions, commands split from ~/.bashrc file
# AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha>
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# DATES      : 2005Nov05 - 2015May07 (Updated)
# LICENSE    : GNU AGPLv3 License <http://www.gnu.org/licenses/agpl.html>
# Permission is hereby granted, free of charge, to any person obtaining a copy 
# of this software and associated documentation files (the "Software"), to deal 
# in the Software without restriction, including without limitation the rights 
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
# copies of the Software, and to permit persons to whom the Software is 
# furnished to do so, subject to the following conditions:
# ALL copies of this work and repository forks must retain the Copyright, 
# LICENSE(.md) notice and this permission notice in substantial portions of the software. 
# See the [LICENSE.md](https://github.com/svaksha/yaksha/blob/master/LICENSE.md) file.
################################################################################
#
# Moved all my additions into a separate "~/.bash_aliases" file.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
################################################################################
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# APT and APTITUDE commands
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias apt-install='sudo apt-get -fy install'
alias apt-policy='LANG=C apt-cache policy'
alias apt-purge='sudo apt-get --purge remove'
alias apt-search='apt-cache search'
alias apt-show='apt-cache show'
alias update='sudo apt-get -y update'
alias upgrade='sudo apt-get -y upgrade'
alias dist-upgrade='sudo apt-get update && sudo apt-get dist-upgrade' # Update/Upgrade OS 
# WARNING : USE CAREFULLY 
alias apt-rm='sudo apt-get remove' # apt remove system dep files - USE CAREFULLY 
alias apt-autorm='sudo apt-get autoremove'  # apt remove system dep files - USE CAREFULLY
# END WARNING : USE CAREFULLY 


################################################################################
# BASH # BASH # BASH # BASH # BASH # BASH # BASH # BASH # BASH # BASH # BASH
################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# BASH reloaded
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias b='. ~/.bashrc' # DOT shortcut to reload bash
alias ba='source ~/.bashrc' # Another shortcut to reload bash
alias bas='source $HOME/.bashrc' # reload bash

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Change Dir 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias ..="cd .."        #go to parent dir
alias ...="cd ../.."    #go to grandparent dir
alias -- -="cd -"       #go to previous dir
alias cd..='cd ..'
alias clr='clear'    # Clear the terminal
alias cal='cal -3' #show 3 months by default

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# HISTORY
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias h='history'
alias clr='cd ~; clear'
alias hcl='history -c; clear'     # clear all the history and screen
# alias h='history | grep'        # search history 


#-------------------------------------------------------------------------------
# EDIT 
#-------------------------------------------------------------------------------
alias ed-alias='sudo gedit $HOME/.bashrc_aliases'
alias ed-bash='sudo gedit $HOME/.bashrc'
alias ed-gitconf='sudo gedit $HOME/.gitconfig'
alias ed-gitignore='sudo gedit $HOME/.gitignore_global'

# Fire an editor
alias emacs='emacs24-gtk'
alias emacsfs='emacs24-gtk -fs'


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# LIST
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias l.='ls -d .*'     #list hidden files
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
#alias ll='ls -lhrt'     # extra info compared to "l"
alias lld='ls -lUd */'  # list only directories
alias ls='ls --color=auto'
#alias lst='ls --color --time-style="+%b %d %Y %H:%M"' #replaced with bash script

# Display the contents of these files on the terminal.
alias s-alias='cat $HOME/.bash_aliases'
alias s-bash='cat $HOME/.bashrc'
alias s-gitc='cat $HOME/.gitconfig'


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# PATH, Proceses
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias p='ps aux | grep' # grep processes with [OPTION] PATTERN [FILE]
alias path='echo -e ${PATH//:/\\n}'

### various ping options. Read REF's for router/modem option.
# REF[1]: https://en.wikipedia.org/wiki/Maximum_transmission_unit
# REF[2]: http://www.richud.com/wiki/Network_MTU_Check
#-------------------------------------------------------------------------------
alias png='ping 192.168.1.1' # ping dsl router
alias ping='ping -M do -s 1452 google.com' # Error {From MyDslModem.local.lan (192.168.1.1) icmp_seq=1 Frag needed and DF set (mtu = 1460)}
alias ping1='ping -M do -s 1492 google.com'
alias ping2='ping 10.8.0.1 -M do -s 1432'

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias shr='shred -u'

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Processes yet again
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias t='top'
alias tl='tail'
alias temps='acpi -t'

#===============================================================================
# Grouping all SEARCH utils 
#===============================================================================
alias f='find . | grep'        # find file 
alias g='grep -R'              
alias gri="grep -i"            # ignore case



################################################################################
# O.SYSTEM, Kernel AND HARDWARE MONITOR
################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# HDD health - using smartmontools
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias disk='sudo smartctl -s on -a /dev/sda'     # HDD health - using smartmontools
alias df='df -h'                                # Filesystem diskspace usage

# Kernel
alias unm-a='uname -a' # for all info regarding kernel version,
alias unm-r='uname -r' # for exact kernel version
alias lsb-a='lsb_release -a' # for all information related to ubuntu version,
alias lsb-r='lsb_release -r' # for exact version
alias fdisk='sudo fdisk -l' # for partition info with all details. 


################################################################################
# PROGRAMMING LANGUAGES   # PROGRAMMING LANGUAGES   # PROGRAMMING LANGUAGES
################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# JULIA REPL & programming
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias ju='julia'
# alias ju-pull='git pull git@github.com:JuliaLang/julia.git' # IGNORE, use update script.
# alias ju-pkgup='cd julia; ./julia -e 'Pkg.update()''        # alt script handles this.

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Python related commands
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias con='cd anaconda/envs/'
alias cona='source activate'
alias cond='source deactivate'
alias py='python'
# From @audreyr, http://www.codemakesmehappy.com/2015/04/spring-cleaning-for-python-programmers.html
alias rmpyc='find . -type f -name "*.pyc" -print -delete'
# Recursively IGNORE "Permission denied" directories.
#alias rmpyc-ig-path='find . -type f -name "*.pyc" ! -readable \( -path "./.dbus" -o -path "./.gvfs" -o -path "./.cache/dconf" \) -print -delete -ls'




################################################################################
# DVCS # DVCS # DVCS # DVCS # DVCS # DVCS # DVCS # DVCS # DVCS # DVCS # DVCS 
################################################################################
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# GIT
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# GIT stuff : https://www.kernel.org/pub/software/scm/git/docs/git-config.html
alias ga='git add'
alias gau='git add --update'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias gd='git diff'
alias gs='git status'
alias gig='git status --ignored'
alias gk='gitk --all&'
# too lazy to type log history
alias gl='git log'
alias glpg='git log --pretty=format:"%h %s" --graph'
alias glpgd='log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short'
alias gpl='git pull'
alias gp='git push'
alias gpom='git push -u origin master'

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# HG - MERCURIAL
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias hh='hg help'              # HELP, the full command list.
alias hi='hg init'              # Creates a `.hg/` subfolder 
alias hc='hg commit -m'         # Save files and Commit message to Repo
alias ha='hg add'               # Begin tracking all files 
alias hs='hg status'            # Lists status of files
alias hd='hg diff'              # Lists tracked file changes, `filename` will List changes to it
alias hp='hg push'              # Push changesets to Remote
alias hpl='hg pull'             # Pull all new changesets into Local
alias hl='hg log'               # History of changesets
alias hm='hg merge'
alias hn='hg annotate'          # Logs of changes
alias hf='hg forget'            # Track new, forget missing
alias hr='hg revert'            # Undo all uncomm­itted changes	
alias h-arm='hg addrem­ove'      # Begin tracking changes
alias h-rmv='hg remove'         # Stop tracking file
alias h-head='hg heads'         # List heads
alias h-pth='hg paths'          # Lists known remote Repos
alias h-in='hg incoming'        # List changesets available
alias h-tip='hg export tip'     # export the most recent commit
# Only use in private repos.
alias h-roll='hg rollback'      # can undo commit, import, pull, local push, and unbundle. 



# END ".bash_aliases" ==========================================================


