################################################################################
# FILE       : .juliarc.jl
# DESCRIPTION: Configuration file for Julia for users to store their personal
#              commands in homedir(), in a file named .juliarc.jl
# AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha>
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# LICENSE    : GNU AGPLv3 and subject to the terms and conditions in the LICENSE.md 
#              (https://github.com/svaksha/yaksha/blob/master/LICENSE.md) file being met.
# DATES      : Created:2013oct01 - Updated:2016mar16
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

# for PRIVATE repos
if isfile("$(ENV["HOME"])/.juliarc-yakshi.jl")
    include("$(ENV["HOME"])/.juliarc-yakshi.jl")
end


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Import these packages on REPL startup 
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PyCall.jl
#=
atreplinit() do repl
    @eval using PyCall
end
=#

atreplinit() do repl
    eval(Expr(:using, :PyCall))
end


