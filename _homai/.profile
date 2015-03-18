#!/usr/bin/env bash
################################################################################
# My daemons : http://svaksha.github.io/abja
# COPYRIGHT © 2007-Now [SVAKSHA](http://svaksha.com/pages/Bio) All Rights Reserved.
# LICENSE :: [GNU AGPLv3](http://www.gnu.org/licenses/agpl-3.0.html) or later version.
# Permission is hereby granted, free of charge, to any person obtaining a copy 
# of this software and associated documentation files (the "Software"), to deal 
# in the Software without restriction, including without limitation the rights 
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
# copies of the Software, and to permit persons to whom the Software is 
# furnished to do so, subject to the following conditions:
# ALL copies of this work and repository forks must retain the Copyright, 
# LICENSE(.md) notice and this permission notice in substantial portions of the software. 
# See the [LICENSE.md](https://github.com/svaksha/abja/blob/master/LICENSE.md) file.
# UPDATED: Mon 02 Mar 2015 07:19:56 IST 
################################################################################
#
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
#
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
