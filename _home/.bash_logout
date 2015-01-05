#!/usr/bin/env bash
################################################################################
# My dot-shell files: http://svaksha.github.io/8ok5h
# Last Update: Sun 04 Jan 2015 09:04:38 IST 
################################################################################

# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
