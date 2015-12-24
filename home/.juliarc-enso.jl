################################################################################
# FILE       : .juliarc-enso.jl
# DESCRIPTION: Configuration file for the enso-jl repo.
# AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha>
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# LICENSE    : GNU AGPLv3 and subject to the terms and conditions in the LICENSE.md 
#              (https://github.com/svaksha/yaksha/blob/master/LICENSE.md) file being met.
# DATES      : Created:2014jan26 - Updated:2015dec25
################################################################################
#
# This file contains site-specific juliarc commands for the "enso-jl" repo
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

using Base
#using Graphs

## Load my .juliarc.jl each time the REPL runs
push!(LOAD_PATH, ENV["HOME"]*"/.julia")
push!(LOAD_PATH, ENV["HOME"]*"/enso-jl")


