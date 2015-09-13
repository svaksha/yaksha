################################################################################
# File       : .juliarc.jl
# Description: Configuration file for automagically updating Julia.
# AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha>
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# DATES      : Created:2013oct21 - Updated:2015sep13
# LICENSE    : GNU AGPLv3 License <http://www.gnu.org/licenses/agpl.html>,
#              https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# This code is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. Permission is hereby granted, free of charge, to any
# person obtaining a copy of this software, to deal in the Software without
# restriction, including without limitation the rights to use, copy, modify,
# merge, publish, redistribute, and/or sell copies of the Software and use in
# source form, with or without modification, and to permit persons to whom the
# Software is furnished to do so as per the terms in the LICENSE.md file and
# subject to the following conditions being met:
# 1. ALL copies, forks and redistributions of source code AND/OR binary form
#    must retain the above Copyright notice, the Licence file for source code
#    (AGPLv3) along with this permission notice and list of conditions and the 
#    following disclaimer, in substantial portions of the Software.
# 2. Neither the name of the COPYRIGHT HOLDER(S) nor the names of its
#    contributors may be used to endorse or promote products derived from this
#    software without specific prior written permission.
################################################################################
#
# Automagically update Julia.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Update my system
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Pkg.status()
Pkg.update()

## Load my .juliarc.jl each time the REPL runs
if chomp(readall(`pwd`)) != ENV["HOME"]
    if isfile(".juliarc.jl"); require(".juliarc.jl")
    end
end

push!(LOAD_PATH, ENV["HOME"]*"/.julia")

# Optional additional initialization
if isfile("$(ENV["HOME"])/.juliarc.jl"); include("$(ENV["HOME"])/.juliarc.jl"); end
#if isfile("$(ENV["HOME"])/.juliarc_tomography.jl"); include("$(ENV["HOME"])/.juliarc_tomography.jl"); end

