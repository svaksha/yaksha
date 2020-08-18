############################ METADATA ##########################################
#1.PROGRAM   : .startup.jl
#2.COPYRIGHT©: 2005-Present, SVAKSHA, http://svaksha.github.io/yaksha
#3.AUTHOR    : SVAKSHA, http://svaksha.com/pages/Bio
#4.LICENSE   : GNU AGPLv3 subject to meeting all the terms in the LICENSE file:
#              https://github.com/svaksha/yaksha/blob/master/LICENSE.md
#5.REPOSITORY: http://svaksha.github.io/yaksha
#6.TECHNOTES : My Julia config file stores personal customizations in the homedir().
#  Notes     : This file contains site-specific commands (EX. add directories to
#              the LOAD_PATH for execution when the Julia REPL starts up.
#              Packages to load, etc..
#7.DATE(S)   : 2013oct01-2020aug18
############################ METADATA ##########################################


# Greet the user(s) upon startup.
#-------------------------------------------------------------------------------
print("|| नमस्ते ! स्वक्षंस्या सङ्गणकप्रक्रमम् स्वागतम || Greetings!")
print("Version 1.4.1 from Ubuntu 20.04 ⛬ julia/1.4.1+dfsg-1")

# PATHs, multiple options
push!(LOAD_PATH, pwd())
#push!(LOAD_PATH, ENV["HOME"]*)
push!(LOAD_PATH, ENV["HOME"]*"/.julia")
push!(LOAD_PATH, ENV["HOME"]*"/julia")
push!(LOAD_PATH, ENV["HOME"]*"/anaconda3")
#push!(LOAD_PATH, ENV["HOME"]*"/devil-*")
push!(LOAD_PATH, ENV["HOME"]*"/devya-*")
push!(LOAD_PATH, ENV["HOME"]*"/divya")
push!(LOAD_PATH, ENV["HOME"]*"/divya-*")
push!(LOAD_PATH, ENV["HOME"]*"/yaksh*")

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Update my Julia package installation
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Pkg.status()
#Pkg.update()

# Load startup.jl
const STARTUPJL = "./julia/config/startup.jl"

startupjl_path = string(pwd(), "/", STARTUPJL);
if isfile(startupjl_path)
	include(startupjl_path)
end

#=
# Enable a per-directory startup file.
#-----------------------------------------
if chomp(readstring(`pwd`)) != ENV["HOME"]
    if isfile(startupjl_path)
        require(startupjl_path)
    end
end
=#

# Optional additional initialization
#if isfile("$(ENV["HOME"])/.startup.jl");
#  include("$(ENV["HOME"])/.startup.jl");
#end

# REPL restart : http://docs.julialang.org/en/latest/manual/workflow-tips/#simplify-initialization
#-------------------------------------------------------------------------------
isinteractive() && isfile("_init.jl") && require("_init.jl")

#-------------------------------------------------------------------------------
# Import these packages on REPL startup
#-------------------------------------------------------------------------------
using Base
import Pkg  #https://discourse.julialang.org/t/base-pkg-is-deprecated-but-using-pkg-errors-out/9573/3

atreplinit() do repl
# data files
    @eval using CSV
    @eval using CSVFiles
    @eval using ExcelReaders
    @eval using HDF5
    @eval using JLD2
# array, et al.
    @eval using Dagger
    @eval using DataFrames
    @eval using DataTables
# debug
   #@eval using Debug
    @eval using Documenter
    @eval using FancyDiagnostics
#    @eval using JuliaParser
    @eval using OhMyREPL
    @eval using IJulia
# DB
    @eval using JuliaDB
    @eval using SQLite
# server
    @eval using Mux
    @eval using GitLab
    #@eval using HttpServer
# python
    @eval using PyCall
    @eval using Query
    @eval using StatsBase
    @eval using YAML
    @eval using Conda
# OCR
    @eval using OCRreact
# visualize
    @eval using Images
    @eval using Gadfly
    @eval using ImageMagick
end

#julia --eval 'Pkg.add("IJulia")'
#julia --eval 'Pkg.add("Gadfly")'

#-------------------------------------------------------------------------------
# Add the HDF5 path to Julia's Libdl.DL_LOAD_PATH variable.
# https://github.com/JuliaIO/HDF5.jl#installation
#-------------------------------------------------------------------------------
#push!(Libdl.DL_LOAD_PATH, "/opt/local/lib")
#Pkg.build("HDF5")


################################################################################
# _init.jl : Macro to run _init.jl if it exists
################################################################################
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

# Macro to edit this file
macro startup()
    edit("~/.startup.jl")
end

# Methods macro
macro methods(m)
    @eval methods(m)
end
