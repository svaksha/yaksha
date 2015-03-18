#!/usr/bin/env bash
################################################################################
# My daemons: http://svaksha.github.io/abja
# ALIAS definitions UPDATED: Sun 15 Feb 2015 09:04:55 AM IST 
################################################################################
# Moved all my additions into a separate "~/.bash_aliases" file.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
################################################################################
#
#
#AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
#
# APT and APTITUDE commands --------------------------------------------------
alias apt-install='sudo apt-get -fy install'
alias apt-policy='LANG=C apt-cache policy'
alias apt-purge='sudo apt-get --purge remove'
alias apt-search='apt-cache search'
alias apt-show='apt-cache show'
alias apt-up='sudo apt-get update && sudo apt-get upgrade'
alias apt-updist='sudo apt-get update && sudo apt-get dist-upgrade' # Update/Upgrade OS 
# WARNING : USE CAREFULLY 
alias apt-rm='sudo apt-get remove' # apt remove system dep files - USE CAREFULLY 
alias apt-autorm='sudo apt-get autoremove'  # apt remove system dep files - USE CAREFULLY
# END WARNING : USE CAREFULLY 


#BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
alias bash='source $HOME/.bashrc' # reload bash


#CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
alias ..="cd .."        #go to parent dir
alias ...="cd ../.."    #go to grandparent dir
alias -- -="cd -"       #go to previous dir
alias cd..='cd ..'
alias clr='clear'    # Clear the terminal
alias cal='cal -3' #show 3 months by default
alias cat-alias='cat $HOME/.bash_aliases'
alias cat-bash='cat $HOME/.bashrc'
alias cat-gitc='cat $HOME/.gitconfig'

#DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD


#EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
alias ed-alias='sudo gedit $HOME/.bashrc_aliases'
alias ed-bash='sudo gedit $HOME/.bashrc'
alias ed-gitconf='sudo gedit $HOME/.gitconfig'
alias ed-gitignore='sudo gedit $HOME/.gitignore_global'
alias emacs='emacs24-gtk'
alias emacsfs='emacs24-gtk -fs'


#FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
alias f='find . | grep' # find file 


#GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
alias g='grep -R'
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


#HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
alias home='cd ~; clear'
alias h='history'
# alias h='history | grep'  # search history 


#IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII


#JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
alias ju='julia'
# alias ju-pull='git pull git@github.com:JuliaLang/julia.git' # IGNORE, use update script.
# alias ju-pkgup='cd julia; ./julia -e 'Pkg.update()''        # alt script handles this.


#KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK


#LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL

alias l.='ls -d .*'     #list hidden files
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lhrt'     #extra info compared to "l"
alias lld='ls -lUd */'  #list directories
# alias ll='ls -alF'
# alias ll='ls --color --time-style="+%b %d %Y %H:%M"'
alias ls='ls --color=auto'


#MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
#NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
#OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO


#PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
alias p='ps aux | grep' # grep processes with [OPTION] PATTERN [FILE]
alias path='echo -e ${PATH//:/\\n}'
alias ping='ping -M do -s 1452 google.com'
alias ping-1='ping 192.168.1.1'
alias py='python'


#QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ
#RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR

#SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
alias shr='shred -u'


#TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
alias t='top'
alias tl='tail'
alias temps='acpi -t'


#UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU
#VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
#WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
#YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
#ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ

# END ".bash_aliases" ==========================================================

