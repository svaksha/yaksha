#!/usr/bin/julia
#
############################ METADATA ##########################################
#1.PROGRAM   : PkgAdd.jl
#2.COPYRIGHT©: 2005-Present, SVAKSHA, http://svaksha.github.io/yaksha
#3.AUTHOR    : SVAKSHA, http://svaksha.com/pages/Bio
#4.LICENSE   : GNU AGPLv3 subject to meeting all the terms in the LICENSE file:
#              https://github.com/svaksha/yaksha/blob/master/LICENSE.md
#5.REPOSITORY: http://svaksha.github.io/yaksha
#6.TECHNOTES : Julia program to install packages from a given text file.
#7.DATE(S)   : 2013oct21 - 2018apr06
############################ METADATA ##########################################
#
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹

using Base

filename = "../yaksha/julia/pkgMetadata.txt"


function readfiles(filename::String)
    f = open(filename)
    l0 = readline(f)
    packages = map(x::String->x[1:end-1], readlines(f))
    return join(packages,"")
    print(packages)
end

# https://docs.julialang.org/en/latest/base/collections/#Base.map

@time for packages in open(filename)
           print(length(packages.seq))
end
