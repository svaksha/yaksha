#!/usr/bin/env bash
############################ METADATA ##########################################
#1.PROGRAM   : jiPkg3.sh
#2.COPYRIGHT©: 2005-Present, SVAKSHA, http://svaksha.github.io/yaksha
#3.AUTHOR    : SVAKSHA, http://svaksha.com/pages/Bio
#4.LICENSE   : GNU AGPLv3 subject to meeting all the terms in the LICENSE file: 
#              https://github.com/svaksha/yaksha/blob/master/LICENSE.md
#5.REPOSITORY: http://svaksha.github.io/yaksha
#6.TECHNOTES : Shell script to automagically update Julia without opening the REPL. 
#7.DATE(S)   : 2013oct21 - 2018apr06
############################ METADATA ##########################################
#
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹


# run some commands via the CLI Terminal instead of the REPL.
julia -e 'Pkg.dir()'     # Returns the absoluTe path of the package directory. 
julia -e 'versioninfo()' # which JL version?
julia -e 'Pkg.status()'  # provide pkg list
julia -e 'Pkg.update()'  # Update Julia packages
julia -e 'Pkg.resolve()' # Determine the optimal/consistent package ver to install/upgrade from Pkg.dir("REQUIRE").
julia -e 'Pkg.installed()' #list installed packages


# Alphabetically list installed packages using Pkg.installed() above.
#----------------------------------------------------------------
julia -e 'showall(sort(collect(keys(Pkg.installed()))))'

#print the truncated list in sorted order with versions. 
julia -e 'sort(collect(Pkg.installed()))' 
#will print the FULL list in sorted order with versions. 
julia -e 'show(STDOUT, "text/plain", sort(collect(Pkg.installed())))'

# Prints ALL packages listed on METADATA: https://github.com/JuliaLang/METADATA.jl.  
julia -e 'print(readdir(Pkg.dir("METADATA")))'

# Add these packages for a new julia installation
#--------------------------------------------------
julia -e 'Pkg.add("CSV")'
julia -e 'Pkg.add("ArgParse")'
julia -e 'Pkg.add("FileFind")'
julia -e 'Pkg.add("FileIO")'
julia -e 'Pkg.add("HDF5")'
julia -e 'Pkg.add("IJulia")'
julia -e 'Pkg.add("IndexedTables")'
julia -e 'Pkg.add("JLD2")'
julia -e 'Pkg.add("MAT")'
julia -e 'Pkg.add("Mux")'
julia -e 'Pkg.add("PyCall")'
julia -e 'Pkg.add("Query")'
julia -e 'Pkg.add("StatFiles")'
julia -e 'Pkg.add("SymmetricTensors")'
julia -e 'Pkg.add("uCSV")'
julia -e 'Pkg.add("Gadfly")'
julia -e 'Pkg.add("HypothesisTests")'

