################################################################################
# FILE       : .juliarc-update.jl
# DESCRIPTION: Configuration file for automagically updating Julia.
# AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha>
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# LICENSE    : GNU AGPLv3 and subject to the terms and conditions in the LICENSE.md 
#              (https://github.com/svaksha/yaksha/blob/master/LICENSE.md) file being met.
# DATES      : Created:2013oct21 - Updated:2015dec25
################################################################################
#
# Automagically update Julia 
# Alternatively, USE THE "yaks-jl-update.sh" PROGRAM 
# https://github.com/svaksha/yaksha/blob/master/yaks-jl-update.sh
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Update my system
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Pkg.status()
Pkg.update()

## Load my .juliarc.jl each time the REPL runs
if chomp(readall(`pwd`)) != ENV["HOME"]
    if isfile(".juliarc.jl"); require(".juliarc.jl")
    end
end

push!(LOAD_PATH, ENV["HOME"]*"/.julia")

# Optional additional initialization
if isfile("$(ENV["HOME"])/.juliarc.jl"); include("$(ENV["HOME"])/.juliarc.jl"); end
#if isfile("$(ENV["HOME"])/.juliarc_tomography.jl"); include("$(ENV["HOME"])/.juliarc_tomography.jl"); end

