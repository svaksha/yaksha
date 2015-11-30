#!/usr/bin/python -i
#encoding=utf-8
from __future__ import absolute_import, division, print_function, unicode_literals
################################################################################
# File       : .pythonrc.py
# Description: Configuration file for Python, save as ~/.pythonrc.py to use.
# AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha>
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# DATES      : Created:2010sep11 - Updated:2015nov30
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
__author__ = 'SVAKSHA'
__copyright__ = 'Copyright © 2005-Now, SVAKSHA, http://svaksha.com/pages/Bio'
__license__ = 'AGPLv3'
__version__ = '15.11.dev'
__url__ = 'https://github.com/svaksha/yaksha'

"""
This file is executed when the Python interactive shell is started if 
$PYTHONSTARTUP is in your .bashrc environment and points to this file. 
In conjunction with your ~/.inputrc file these Python commands are useful.
"""

import sys, os
import pdb
import readline, rlcompleter
import datetime
import pprint
import json
import atexit

#
# Store the file in ~/.pystartup, and set an environment variable to point
# to it:  "export PYTHONSTARTUP=/home/gsf/.pystartup" in bash.
#
# Note that PYTHONSTARTUP does *not* expand "~", so you have to put in the
# full path to your home directory.

import atexit
import os
import readline
import rlcompleter
import sys

#-------------------------------------------------------------------------------
# Date & Time
#-------------------------------------------------------------------------------        
try:
    from dateutil.parser import parse as parse_date
except ImportError:
    print("\nCould not import dateutil.")


#-------------------------------------------------------------------------------
# INPUTRC, tab-completion and readline support, https://docs.python.org/3/using/cmdline.html
# Auto-completion and a stored history file of commands for my Python REPL. 
# Autocomplete is bound to the Esc key by default (see readline docs to change it).
#-------------------------------------------------------------------------------
try:
    import readline
except ImportError:
    print("Module readline not available.")
else:
    import rlcompleter
    if 'libedit' in readline.__doc__:
        readline.parse_and_bind("bind ^I rl_complete")
    else:
        readline.parse_and_bind("tab: complete")    
        
#-------------------------------------------------------------------------------
# Enable Python History
#-------------------------------------------------------------------------------
HISTFILE="%s/.python_history" % os.environ["HOME"]
# Read the existing history if there is one
if os.path.exists(HISTFILE):
    readline.read_history_file(HISTFILE)
# Set maximum number of items that will be written to the history file
readline.set_history_length(300)

def savehist():
    readline.write_history_file(HISTFILE)
atexit.register(savehist)



#-------------------------------------------------------------------------------
# Enable Pretty Printing for stdout
#-------------------------------------------------------------------------------
def yaks_pydisplayhook(value):
    if value is not None:
        try:
            import __builtin__
            __builtin__._ = value
        except ImportError:
            __builtins__._ = value
        pprint.pprint(value)
sys.pydisplayhook = yaks_pydisplayhook


#-------------------------------------------------------------------------------
# Django imports
#-------------------------------------------------------------------------------
try:
    from app import models
    from django.conf import settings
except:
    print("\nCould not import Django modules.")
else:
    print("\nImported Django modules.")


# BeautifulSoup, Requests, Json.
#-------------------------------------------------------------------------------
def yaks_pyimport(module, description="", fromlist=[]):
    try:
        __import__(module, fromlist=fromlist)
    except:
        print("Unable to import " + (",".join(fromlist) + " from " if fromlist else "") + module)
    else:
        print("Imported " + (",".join(fromlist) + " from " if fromlist else "") + module)
yaks_pyimport("bs4", "BeautifulSoup4", ["BeautifulSoup"])
yaks_pyimport("requests", "requests", ['requests'])
yaks_pyimport("json", "json", ['requesets'])

'''
def yaks_pyimport(pycode, description):
    try:
        exec(pycode)
    except:
        print("Unable to import " + description)
    else:
        print("Imported " + description)
yaks_pyimport("from bs4 import BeautifulSoup as Soup", 'BeautifulSoup')
yaks_pyimport("import requests, json", 'requests and json')
'''
