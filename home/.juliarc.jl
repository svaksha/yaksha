################################################################################
# FILE       : .juliarc.jl
# DESCRIPTION: My Julia config file storing personal commands in homedir()
# AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha>
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# LICENSE    : GNU AGPLv3 and subject to the terms and conditions in the LICENSE.md 
#              (https://github.com/svaksha/yaksha/blob/master/LICENSE.md) file being met.
# DATES      : Created:2013oct01 - Updated:2016mar17
################################################################################
#
# This file contains site-specific commands (EX. add directories to the LOAD_PATH,
# to be executed when the Julia REPL starts up.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

using Base
#using PyCall

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Greet Users on startup
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
println("|| नमस्ते ! स्वक्षंस्या सङ्गणकप्रक्रमम् स्वागतम  || Greetings! Welcome to SVAKSHA's Julia language programs ||")

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# add directories to the LOAD_PATH to be executed when the Julia REPL starts up.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Load my .juliarc.jl for each REPL run, enable a per-directory startup file.
if chomp(readstring(`pwd`)) != ENV["HOME"]
    if isfile(".juliarc.jl")
        require(".juliarc.jl")
    end
end

push!(LOAD_PATH, ENV["HOME"]*"/.julia")
push!(LOAD_PATH, ENV["HOME"]*"/julia")
push!(LOAD_PATH, ENV["HOME"]*"/devya")
push!(LOAD_PATH, ENV["HOME"]*"/divya")

# for PRIVATE repos
if isfile("$(ENV["HOME"])/.juliarc-yakshi.jl")
    include("$(ENV["HOME"])/.juliarc-yakshi.jl")
end

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Import these packages on REPL startup 
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
atreplinit() do repl
    @eval using Gadfly
    @eval using IJulia
    # PyCall wont work in v0.5, Julia bug https://github.com/stevengj/PyCall.jl/issues/246 
    @eval using PyCall
end

#julia --eval 'Pkg.add("IJulia")'
#julia --eval 'Pkg.add("Gadfly")'
