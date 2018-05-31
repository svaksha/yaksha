#!/usr/bin/env bash
############################ METADATA ##########################################
#1.PROGRAM   : Pkg.sh
#2.COPYRIGHT©: 2005-Present, SVAKSHA, http://svaksha.github.io/yaksha
#3.AUTHOR    : SVAKSHA, http://svaksha.com/pages/Bio
#4.LICENSE   : GNU AGPLv3 subject to meeting all the terms in the LICENSE file:
#              https://github.com/svaksha/yaksha/blob/master/LICENSE.md
#5.REPOSITORY: http://svaksha.github.io/yaksha
#6.TECHNOTES : Shell script checks package status & automagically updates them without the REPL.
#7.DATE(S)   : 2013oct21 - 2018apr06
############################ METADATA ##########################################
#
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹

# run some commands via the CLI Terminal instead of the REPL.
julia -e 'using Pkg'    # use the new Pkg3 package system from ver-0.7 and above.
julia -e 'Pkg.dir()'     # Returns the absoluTe path of the package directory.
julia -e 'versioninfo()' # which JL version?

# Prints out a summary of what packages are installed and what version and state they're in.
julia -e 'Pkg.status()'

# Update the metadata repo – kept in Pkg.dir("METADATA") – then update any fixed
# packages that can safely be pulled from their origin; then call Pkg.resolve()
# to determine a new optimal set of packages versions.
julia -e 'Pkg.update()'  # Update Julia packages
julia -e 'Pkg.resolve()' # Determine the optimal/consistent package ver to install/upgrade from Pkg.dir("REQUIRE").

# Returns a dictionary mapping installed package names to the installed version number of each package.
julia -e 'Pkg.installed()'


# Alphabetically list installed packages using Pkg.installed() above.
#----------------------------------------------------------------
julia -e 'showall(sort(collect(keys(Pkg.installed()))))'

# print the truncated list in sorted order with versions.
julia -e 'sort(collect(Pkg.installed()))'

# print the FULL list of packages in sorted order with versions installed.
julia -e 'show(STDOUT, "text/plain", sort(collect(Pkg.installed())))'

# Prints ALL packages listed on METADATA: https://github.com/JuliaLang/METADATA.jl
#julia -e 'print(readdir(Pkg.dir("METADATA")))'

julia -e 'Pkg.dependents'
