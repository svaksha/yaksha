#!/usr/bin/env bash
############################ METADATA ##########################################
#1.PROGRAM   : PkgAdd.sh
#2.COPYRIGHT©: 2005-Present, SVAKSHA, http://svaksha.github.io/yaksha
#3.AUTHOR    : SVAKSHA, http://svaksha.com/pages/Bio
#4.LICENSE   : GNU AGPLv3 subject to meeting all the terms in the LICENSE file:
#              https://github.com/svaksha/yaksha/blob/master/LICENSE.md
#5.REPOSITORY: http://svaksha.github.io/yaksha
#6.TECHNOTES : Shell script to automagically update Julia without opening the REPL.
#7.DATE(S)   : 2013oct21 - 2018apr20
############################ METADATA ##########################################
#
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹

# Prints ALL packages listed on METADATA: https://github.com/JuliaLang/METADATA.jl.
#julia -e 'print(readdir(Pkg.dir("METADATA")))'

#--------------------------------------------------
# Add these packages for a new julia installation
## Fetch and install packages from METADATA.JL on github.
#--------------------------------------------------
function metadatajl() {
  julia -e 'Pkg.add("ArgParse")'
  julia -e 'Pkg.add("CSV")'
  julia -e 'Pkg.add("FileFind")'
  julia -e 'Pkg.add("FileIO")'
  julia -e 'Pkg.add("Gadfly")'
  julia -e 'Pkg.add("HDF5")'
  julia -e 'Pkg.add("HypothesisTests")'
  julia -e 'Pkg.add("IJulia")'
  julia -e 'Pkg.add("IndexedTables")'
  julia -e 'Pkg.clone("https://github.com/fredrikekre/ImportMacros.jl")'
  julia -e 'Pkg.add("JLD2")'
  julia -e 'Pkg.add("MAT")'
  julia -e 'Pkg.add("Mux")'
  julia -e 'Pkg.add("PyCall")'
  julia -e 'Pkg.add("Query")'
  julia -e 'Pkg.add("StatFiles")'
  julia -e 'Pkg.add("SymmetricTensors")'
  julia -e 'Pkg.add("uCSV")'
}

## Git Clone to install packages directly from git.
#--------------------------------------------------
function pkgclone() {
  julia -e 'Pkg.clone("https://github.com/fredrikekre/ImportMacros.jl")'
}

#-------------------
# data IO Packages
#-------------------
function dataIO() {
	# data IO Packages
    @eval using CSV
    @eval using CSVFiles
    @eval using ExcelReaders
    @eval using HDF5
    @eval using JLD2
}


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
# visualize
    @eval using Gadfly
end
