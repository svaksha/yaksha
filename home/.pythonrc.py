#!/usr/bin/python -i
#encoding=utf-8
from __future__ import absolute_import, division, print_function, unicode_literals
################################################################################
# FILE      : .pythonrc.py
# INFO.     : Config file for Python, save as ~/.pythonrc.py to use.
# AUTHOR    : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE    : http://svaksha.github.io/yaksha
# COPYRIGHT©: 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE   : GNU AGPLv3 subject to meeting all the terms in the LICENSE file,
#             https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATE      : 2010sep11-Present
################################################################################

__author__ = 'SVAKSHA'
__copyright__ = 'Copyright © 2005-Now, SVAKSHA, http://svaksha.com/pages/Bio'
__license__ = 'AGPLv3'
__version__ = '16.05.dev'
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

print("# SVAKSHA's pythonrc.py has imported these libs in the REPL : ")

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


# function yaks_pyimport 
#-------------------------------------------------------------------------------
def yaks_pyimport(module, description="", fromlist=[]):
    try:
        __import__(module, fromlist=fromlist)
    except:
        print("Unable to import " + (",".join(fromlist) + " from " if fromlist else "") + description)
    else:
        print("Imported " + (",".join(fromlist) + " from " if fromlist else "") + module)
yaks_pyimport("bs4", "BeautifulSoup4", ["BeautifulSoup"])
yaks_pyimport("requests", "requests", ['requests'])
yaks_pyimport("json", "json", ['json'])
yaks_pyimport("np", "numpy", ['numpy'])

