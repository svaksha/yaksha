#!/usr/bin/env bash
################################################################################
# FILE      : yaks-gitup.sh
# INFO.     : A bash script to update the local GIT repos.
# AUTHOR    : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE    : http://svaksha.github.io/yaksha
# COPYRIGHT©: 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE   : GNU AGPLv3 subject to meeting all the terms in the LICENSE file,
#             https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATE      : 2014feb22-Present.
################################################################################
#
# References:
# https://github.com/svaksha/aksh/blob/master/cs-debian.md
# https://github.com/svaksha/aksh/blob/master/cs-devops.md
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

yaksha_dir=~/yaksha/

#-------------------------------------------------------------------------------
# Git automatic updating for local repos.
# http://stackoverflow.com/questions/15316601/in-what-cases-could-git-pull-be-harmful
#-------------------------------------------------------------------------------
gitup_repo() {
    git config --global alias.up '!git remote update -p; git merge --ff-only @{u}'
}
