################################################################################
# FILE      : .juliarc.jl
# DESC.     : My Julia config file to store personal commands in homedir()
# AUTHOR    : SVAKSHA <http://svaksha.github.io/yaksha>
# COPYRIGHT©: 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# LICENSE   : GNU AGPLv3 and subject to meeting all the terms in the LICENSE
#             file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES     : 2013oct01-Present
################################################################################
#
# This file contains site-specific commands (EX. add directories to the LOAD_PATH,
# to be executed when the Julia REPL starts up.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Greet users on startup.
#-------------------------------------------------------------------------------
println("|| नमस्ते ! स्वक्षंस्या सङ्गणकप्रक्रमम् स्वागतम || Greetings! ")

push!(LOAD_PATH, pwd())
push!(LOAD_PATH, ENV["HOME"]*"/.julia")
push!(LOAD_PATH, ENV["HOME"]*"/julia")
push!(LOAD_PATH, ENV["HOME"]*"/devil-*")
push!(LOAD_PATH, ENV["HOME"]*"/devya-*")
push!(LOAD_PATH, ENV["HOME"]*"/divya-*")


#-------------------------------------------------------------------------------
# Import these packages on REPL startup 
#-------------------------------------------------------------------------------
using Base

atreplinit() do repl
    @eval using PyCall
    #@eval using Debug
    @eval using DebuggingUtilities
    @eval using IJulia
    @eval using HDF5
    @eval using CSV
    @eval using DataFrames
    @eval using DataTables
    @eval using GitLab
    @eval using CSV
    @eval using SQLite
    @eval using Query
    @eval using Mux
end
 
#julia --eval 'Pkg.add("IJulia")'
#julia --eval 'Pkg.add("Gadfly")'

#-------------------------------------------------------------------------------
# Add the HDF5 path to Julia's Libdl.DL_LOAD_PATH variable.
# https://github.com/JuliaIO/HDF5.jl#installation
#-------------------------------------------------------------------------------
#push!(Libdl.DL_LOAD_PATH, "/opt/local/lib")
#Pkg.build("HDF5")

#-------------------------------------------------------------------------------
# add directories to the LOAD_PATH to be executed when the Julia REPL starts up.
#-------------------------------------------------------------------------------
#=
# Load my .juliarc.jl for each REPL run, enable a per-directory startup file.
if chomp(readstring(`pwd`)) != ENV["HOME"]
    if isfile(".juliarc.jl")
        require(".juliarc.jl")
    end
end
=#

# for PRIVATE repos
if isfile("$(ENV["HOME"])/.juliarc-yakshi.jl")
    include("$(ENV["HOME"])/.juliarc-yakshi.jl")
end


#-------------------------------------------------------------------------------
# _init.jl 
#-------------------------------------------------------------------------------
#
# If `_init.jl` exists, run at runtime.
#-------------------------------------------------------------------------------
if VERSION < v"0.7-"
    if isinteractive() &isfile("_init.jl")
      info("Found", joinpath(pwd(), "_init.jl"))
      include(joinpath(pwd(),"_init.jl"))
	end
else 
    atreplinit() do repl
        if isfile("_init.jl")
            info("Found", joinpath(pwd(),"_init.jl"))
            include(joinpath(pwd(),"_init.jl"))
        end
	end
end

# Macro to edit this file
macro juliarc()
    edit("~/.juliarc.jl")
end

# Methods macro
macro methods(m)
    @eval methods(m)
end

# Macro to run _init.jl if it exists
#-------------------------------------------------------------------------------
macro init()
    if isfile("_init.jl")
        info("Found", joinpath(pwd(), "_init.jl"))
        include("_init.jl")
    else
        println("The file '_init.jl' is not found in current directory: $(pwd()). Create one instead? (y/n)")
	r1 = readline(STDIN)
	
	if first(r1) == 'y'
	    edit("_init.jl")
	end
  end
end

# REPL restart : http://docs.julialang.org/en/latest/manual/workflow-tips/#simplify-initialization
#-------------------------------------------------------------------------------
isinteractive() && isfile("_init.jl") && require("_init.jl")

