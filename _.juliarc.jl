################################################################################
# File       : .juliarc.jl
# Description: Configuration file for Julia for users to store their personal 
#              commands in homedir(), in a file named .juliarc.jl
# AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha>
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# DATES      : Created:2013oct01 - Updated:2015sep12
# LICENSE    : GNU AGPLv3 License <http://www.gnu.org/licenses/agpl.html>,
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
# This file contains site-specific commands (EX. add directories to the LOAD_PATH, 
# to be executed when the Julia REPL starts up.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

using Base
#using IJulia
#using Docile
#using(".juliarc.jl")

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Greetings on startup
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
println("नमस्ते ! स्वक्षंस्या सङ्गणकप्रक्रमम् स्वागतम !")
println("Greetings! Welcome to SVAKSHA's computer programs") 

# Update after greeting
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Pkg.status()
Pkg.update()

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Scripted updates to run only once in a day.
# https://julia.readthedocs.org/en/latest/manual/packages/
# http://docs.julialang.org/en/latest/stdlib/dates/
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#=
function yaksha_julia_pkgupdate()
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
=#

#=
if isweekday == x->Dates.dayofweek(x) && Dates.tonext(isweekday, Date(2015,12,31)) 
        Pkg.status()
        Pkg.update()
end
=#

#=
# Scripted updates to run only on the first of each month for the year 2015.
if first = length([Dates.firstdayofmonth(first+Dates.Month(1))
    for first in Dates.Date(2015):Dates.Date(2015,12,31)]) == 365
        do 
        # Ensure the system is running the latest master branch.
#        Pkg.checkout("HDF5")     
#        Pkg.checkout("IJulia")
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
=#

#-------------------------------------------------------------------------------
# Setting options, https://julia.readthedocs.org/en/latest/manual/getting-started/
# julia [options] [program] [args...]
#-------------------------------------------------------------------------------
#ju -i --color={yes} --history-file={yes} Tomography.jl
 
#using IniFile
#ini = Inifile()
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
#if isfile("$(ENV["HOME"])/.juliarc.jl")
#    include("$(ENV["HOME"])/.juliarc.jl")
#end

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Using isinterative() to check if julia is run in REPL. 
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#if isinteractive()
#        include("$(pwd)/.julia/v0.4/REPL/scripts/repl.jl:$PATH")
#end

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Load the `start_tomography.jl` file in the current Tomography directory.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#if isfile("start_tomography.jl")
#  include("start_tomography.jl")
#end


