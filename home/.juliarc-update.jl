################################################################################
# FILE       : .juliarc-update.jl
# DESCRIPTION: Config file for automagically updating Julia.
# AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha>
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2013oct21 - Updated:2016apr08
################################################################################
#
# Automagically update Julia 
# Alternatively, USE THE "yaks-update-julia.sh" PROGRAM 
# https://github.com/svaksha/yaksha/blob/master/yaks-update-julia.sh
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

push!(LOAD_PATH, ENV["HOME"]*"/.julia")

# Update my Julia installation 
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Pkg.status()
Pkg.update()

# Load my .juliarc.jl for each REPL run, enable a per-directory startup file.
if chomp(readstring(`pwd`)) != ENV["HOME"]
    if isfile(".juliarc.jl")
        require(".juliarc.jl")
    end
end

# Optional additional initialization
if isfile("$(ENV["HOME"])/.juliarc.jl"); include("$(ENV["HOME"])/.juliarc.jl"); end
#if isfile("$(ENV["HOME"])/.juliarc_tomography.jl"); include("$(ENV["HOME"])/.juliarc_tomography.jl"); end
