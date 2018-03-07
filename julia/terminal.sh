#!/usr/bin/env bash
############################ METADATA ##########################################
#1.PROGRAM   : jl-terminal.jl
#2.COPYRIGHT©: 2005-Present, SVAKSHA, http://svaksha.github.io/yaksha
#3.AUTHOR    : SVAKSHA, http://svaksha.com/pages/Bio
#4.LICENSE   : GNU AGPLv3 subject to meeting all the terms in the LICENSE file: 
#              https://github.com/svaksha/yaksha/blob/master/LICENSE.md
#5.REPOSITORY: http://svaksha.github.io/yaksha
#6.TECHNOTES : Bash script to run julia commands on the Terminal without opening the REPL. 
#7.DATE(S)   : 2005mar22-2018mar06
################################################################################
#
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹


# some commands via the CLI Terminal instead of the REPL.
julia -e 'Pkg.dir()'     # Returns the absoluTe path of the package directory. 
julia -e 'versioninfo()' # which JL version?
julia -e 'Pkg.status()'  # provide pkg list
julia -e 'Pkg.update()'  # Update Julia packages
julia -e 'Pkg.resolve()' # Determine the optimal/consistent package ver to install/upgrade from Pkg.dir("REQUIRE").

# Add these packages for a new julia installation
#--------------------------------------------------
#julia -e 'Pkg.add("AddThisPackage")'
julia -e 'Pkg.installed()' #list installed packages

#-----------------------------------------------------------------
# Alphabetically list installed packages using Pkg.installed() above.
#----------------------------------------------------------------
julia -e 'showall(sort(collect(keys(Pkg.installed()))))'

#print the truncated list in sorted order with versions. 
julia -e 'sort(collect(Pkg.installed()))' 
#will print the FULL list in sorted order with versions. 
julia -e 'show(STDOUT, "text/plain", sort(collect(Pkg.installed())))'

# Prints ALL packages listed on METADATA: https://github.com/JuliaLang/METADATA.jl.  
julia -e 'print(readdir(Pkg.dir("METADATA")))'

