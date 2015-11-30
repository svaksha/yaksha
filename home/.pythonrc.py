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
# https://docs.python.org/3/using/cmdline.html#envvar-PYTHONSTARTUP
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
__author__ = 'SVAKSHA'
__copyright__ = 'Copyright © 2005-Now, SVAKSHA, http://svaksha.com/pages/Bio'
__license__ = 'AGPLv3'
__version__ = '15.11.dev'
__url__ = 'https://github.com/svaksha/yaksha'

import json
import sys
import datetime
import pprint

# Date & Time
#-------------------------------------------------------------------------------        
try:
    from dateutil.parser import parse as parse_date
except ImportError:
    print("\nCould not import dateutil.")


# INPUTRC : tab-completion and readline support.    
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
def yaks_pyimport(pycode, description):
    try:
        exec(pycode)
    except:
        print "Unable to import " + description
    else:
        print "Imported " + description

yaks_pyimport("from bs4 import BeautifulSoup as Soup", "BeautifulSoup")
yaks_pyimport("import requests, json", "requests and json")


