################################################################################
# File       : .juliarc.jl
# Description: Configuration file for Julia for users to store their personal 
#              commands in homedir(), in a file named .juliarc.jl
# AUTHOR     : SVAKSHA <http://svaksha.github.io/5vaksha>
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# DATES      : Created:2013oct01 - Updated:2015aug18
# LICENSE    : GNU AGPLv3 License <http://www.gnu.org/licenses/agpl.html>,
#              https://github.com/svaksha/5vaksha/blob/master/LICENSE.md
# Permission is hereby granted, free of charge, to any person obtaining a copy 
# of this software and associated documentation files (the "Software"), to deal 
# in the Software without restriction, including without limitation the rights 
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
# copies of the Software, and to permit persons to whom the Software is 
# furnished to do so, subject to the following conditions: ALL copies of this 
# work and repository forks must retain the Copyright, LICENSE(.md) notice and 
# this permission notice in substantial portions of the software. 
################################################################################
#
# This file contains site-specific commands (EX. add directories to the LOAD_PATH, 
# to be executed when the Julia REPL starts up.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

using Base
using IJulia
#using Docile

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Scripted updates to run only once in a day.
# https://julia.readthedocs.org/en/latest/manual/packages/
# http://docs.julialang.org/en/latest/stdlib/dates/
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#Pkg.status()
#Pkg.update()

function yaksha_pkg_update()
    if dt == Dates.Date(2015):Dates.Date(2016);
        recur(dt) do x
        Dates.dayofweek(x) == Dates.tonext(isweekday, Date(2016,12,31)) &&
        Dates.Jan <= Dates.month(x) <= Dates.Dec &&
        Dates.dayofweekofmonth(x) == 2
        end
    end
    x == Pkg.status() && Pkg.update()
    return x
end       


#=
if isweekday == x->Dates.dayofweek(x) && Dates.tonext(isweekday, Date(2015,12,31)) 
        Pkg.status()
        Pkg.update()
end

# Scripted updates to run only on the first of each month for the year 2015.
if first = length([Dates.firstdayofmonth(first+Dates.Month(1))
    for first in Dates.Date(2015):Dates.Date(2015,12,31)]) == 365
        do 
        # Ensure the system is running the latest master branch.
#        Pkg.checkout("HDF5")     
        Pkg.checkout("IJulia")
#        Pkg.checkout("Docile")
        end
     end
end     
=#
 
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Run multiple Julia versions with distinct history files, Ex. both v0.3 & v0.4-dev
# The v0.3 Julia will use the file ~/.julia_history_v0.3 instead of ~/.julia_history
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#=
if VERSION < v"0.5-"
    ENV["JULIA_HISTORY"] = joinpath(homedir(), "~/.julia_history_v0.4")
end


#-------------------------------------------------------------------------------
# Setting options, https://julia.readthedocs.org/en/latest/manual/getting-started/
# julia [options] [program] [args...]
#-------------------------------------------------------------------------------
#ju -i --color={yes} --history-file={yes} Tomography.jl
 
using IniFile
ini = Inifile()
#read(ini, ENV["JULIA_APP_BOOTSTRAP"])
#include_dir      = get(ini, "data", "include_dir")
#app_dir          = get(ini, "data", "app_dir")
#util_include_dir = get(ini, "data", "util_include_dir")
#data_dir         = get(ini, "data", "data_dir")

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# add directories to the LOAD_PATH to be executed when the Julia REPL starts up.
# Put on search path - CHD analysis, which is only necessary for CHD analysis
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#push!(LOAD_PATH, include_dir)
#push!(LOAD_PATH, util_include_dir)

# Optional additional initialization 
#if isfile("$(ENV["HOME"])/.juliarc_yaksha.jl")
#    include("$(ENV["HOME"])/.juliarc_yaksha.jl")
#end

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Using isinterative() to check if julia is run in REPL. 
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# if isinteractive()
#        include("$(pwd)/.julia/v0.4/REPL/scripts/repl.jl:$PATH")
#end

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Load the `start_tomography.jl` file in the current Tomography directory.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#if isfile("start_tomography.jl")
#  include("start_tomography.jl")
#end

=#


