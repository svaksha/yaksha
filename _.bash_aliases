#!/usr/bin/env bash
################################################################################
# File       : .bash_aliases
# Description: a separate "~/.bash_aliases" file for ALIAS definitions, commands split from ~/.bashrc file
# AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha>
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# DATES      : Created:2005nov05 - Updated:2015aug25
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
#    (AGPLv3) AND documentation (CC BY-NC-SA 4.0) along with this permission 
#    notice and list of conditions and the following disclaimer, in substantial 
#    portions of the Software.
# 2. Neither the name of the COPYRIGHT HOLDER(S) nor the names of its 
#    contributors may be used to endorse or promote products derived from this 
#    software without specific prior written permission.
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
alias update='sudo apt-get update'
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
# EDITOR 
#-------------------------------------------------------------------------------
alias ed-alias='sudo gedit $HOME/.bashrc_aliases'
alias ed-bash='sudo gedit $HOME/.bashrc'
alias ed-gitconf='sudo gedit $HOME/.gitconfig'
alias ed-gitignore='sudo gedit $HOME/.gitignore_global'

# Fire an editor
alias emacs='emacs24-gtk'
alias emacsfs='emacs24-gtk -fs'
alias vi='vim'

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
alias at='acpi -t'

#===============================================================================
# Grouping all SEARCH utils 
#===============================================================================
alias f='find . | grep'        # find file 
alias g='grep -R'              
alias gri="grep -i"            # ignore case
alias p='ps aux | grep' # grep processes with [OPTION] PATTERN [FILE]



################################################################################
# O.SYSTEM, Kernel AND HARDWARE MONITOR
################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# HDD health - using smartmontools
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias disk='sudo smartctl -s on -a /dev/sda'     # HDD health - using smartmontools
alias df='df -h'                                # Filesystem diskspace usage
alias fdisk='sudo fdisk -l' # for partition info with all details. 

# Kernel
alias kern='cat /proc/version'             # detail about for the kernel image version
alias unm-a='uname -a' # for all info regarding kernel version,
alias unm-r='uname -r' # for exact kernel version
alias lsb-a='lsb_release -a' # for all information related to ubuntu version,
alias lsb-r='lsb_release -r' # for exact version

################################################################################
# PROGRAMMING LANGUAGES   # PROGRAMMING LANGUAGES   # PROGRAMMING LANGUAGES
################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# JULIA REPL & programming
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias ju='julia'
# alias ju-pull='git pull git@github.com:JuliaLang/julia.git' # IGNORE, use update script.
# alias ju-pkgup='cd julia; ./julia -e 'Pkg.update()''        # alt script handles this.
alias ijulia='ipython notebook --profile julia'

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Python related commands
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias ipy='ipython notebook'
alias ipynb='ipython notebook'
# ANACONDA -----------------
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
alias gt='git'
alias gi='git init'
alias ga='gt add'
alias gau='git add --update'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcam='git commit -v -a -m'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gcht='git checkout -t'
alias gchtb='git checkout --track -b'
alias gcl='gt clone'
# Diff
alias gd='git diff'
alias gds='gt diff --stat'
alias gdc='gt diff --color-words'
alias gdw='gt diff -w'
alias gdwc='gt diff -w --color-words'
# get an overview of dangling commits with fsck
alias gfsck='git fsck --lost-found'
alias gk='gitk --all&'
# LOG history
alias gl='git log'
alias gl-1='git log -1 HEAD'
alias gl-pg='git log --pretty=format:"%h %s" --graph'
alias gl-pgd='git log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short'
alias gl-gd-all='gt log --all --graph --decorate'
alias gl-abbr='gt log --graph --decorate --pretty=oneline --abbrev-commit'
alias gl-all='gt log --graph --decorate --pretty=oneline --abbrev-commit --all'
alias gl-time='gt log --format:"%C(yellow) %h %Cgreen%an %Cblue%ar %Creset- %s"'
alias gl-refs='gt log --all --graph --decorate --oneline --simplify-by-decoration --no-merges'
alias gl-local='gt log --oneline origin..HEAD'
alias gl-master='gt log --oneline HEAD..origin/master'
# Merge
alias gmf='gt merge --ff-only'
# PULL
alias gp='git pull'
alias gpf='git pull --ff -only'
# PUSH
alias gpom='git push -u origin master'
# status
alias gs='gt status'
alias gsi='git status --ignored'
alias gx='gitx --all'
# REBASE
alias g-rb='git rebase'
alias g-rb-cont='git rebase --continue'
alias g-rb-abrt='git rebase --abort'
alias g-rb-m='git rebase master'
alias g-rb-i='git rebase --interactive'
alias g-rb-im='git rebase --interactive master'
alias gsvnrb='gt svn rebase'
alias gch-detach='gt checkout HEAD^0'  #use with care
alias gd-head='gt diff HEAD~'     #use with care 
# RESET HEAD
# https://stackoverflow.com/questions/5473/how-can-i-undo-git-reset-hard-head1/29469#29469
alias g-rset='git reset HEAD'     # unstage last cm
alias g-rset-h='git reset --hard'
alias visual='gt !gitk'
# TIG
alias tg='tig'

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
alias hv='hg verify'            # Get notifications about missing files.
alias h-arm='hg addrem­ove'      # Begin tracking changes
alias h-rmv='hg remove'         # Stop tracking file
alias h-head='hg heads'         # List heads
alias h-pth='hg paths'          # Lists known remote Repos
alias h-in='hg incoming'        # List changesets available
alias h-tip='hg export tip'     # export the most recent commit
# Only use in private repos.
alias h-roll='hg rollback'      # can undo commit, import, pull, local push, and unbundle. 



# END ".bash_aliases" ==========================================================


