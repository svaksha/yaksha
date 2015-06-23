#!/usr/bin/env bash
################################################################################
# File       : .juliarc.jl
# Description: Configuration file for Julia for users to store their personal 
#              commands in homedir(), in a file named .juliarc.jl
# AUTHOR     : SVAKSHA <http://svaksha.github.io/5vaksha>
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# DATES      : Created:2013Oct01 - Updated:2015Jun20
# LICENSE    : GNU AGPLv3 License <http://www.gnu.org/licenses/agpl.html>
# Permission is hereby granted, free of charge, to any person obtaining a copy 
# of this software and associated documentation files (the "Software"), to deal 
# in the Software without restriction, including without limitation the rights 
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
# copies of the Software, and to permit persons to whom the Software is 
# furnished to do so, subject to the following conditions: ALL copies of this 
# work and repository forks must retain the Copyright, LICENSE(.md) notice and 
# this permission notice in substantial portions of the software. 
# See the [LICENSE.md](https://github.com/svaksha/5vaksha/blob/master/LICENSE.md) file.
################################################################################
#
# This file contains site-specific commands (EX. add directories to the LOAD_PATH) 
# to be executed when the Julia REPL starts up.
#-------------------------------------------------------------------------------

require Base
using IJulia
#using HDF5
using Docile

Pkg.update()

# Setting options, https://julia.readthedocs.org/en/latest/manual/getting-started/
# julia [options] [program] [args...]
#-------------------------------------------------------------------------------
#ju -i --color={yes} --history-file={yes} Tomography.jl
 
using IniFile
ini = Inifile()
#read(ini, ENV["JULIA_APP_BOOTSTRAP"])
#include_dir = get(ini, "data", "include_dir")
#app_dir     = get(ini, "data", "app_dir")
#util_include_dir = get(ini, "data", "util_include_dir")
#data_dir     = get(ini, "data", "data_dir")

# Put on search path - CHD analysis, which is only necessary for CHD analysis
#-------------------------------------------------------------------------------
#push!(LOAD_PATH, include_dir)
#push!(LOAD_PATH, util_include_dir)

# Optional additional initialization
#-------------------------------------------------------------------------------
#if isfile("$(ENV["HOME"])/.juliarc_5vksh.jl")
#    include("$(ENV["HOME"])/.juliarc_5vksh.jl")
#end
