################################################################################
# File       : .juliarc.jl
# Description: Configuration file for Julia for users to store their personal
#              commands in homedir(), in a file named .juliarc.jl
# AUTHOR     : SVAKSHA (http://svaksha.com/pages/Bio)
# SOURCE     : http://svaksha.github.io/yaksha
# DATES      : Created:2013oct01 - Updated:2015oct12
# COPYRIGHT© : 2005-Now SVAKSHA AllRightsReserved
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
# This file contains site-specific commands (EX. add directories to the LOAD_PATH,
# to be executed when the Julia REPL starts up.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

using Base
using IJulia
#using TerminalExtensions

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Greetings on startup
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
println("|| नमस्ते ! स्वक्षंस्या सङ्गणकप्रक्रमम् स्वागतम  || Greetings! Welcome to SVAKSHA's computer programs ||")

# changing the "julia>" prompt color schemes in the REPL
#Base.active_repl.prompt_color = Base.text_colors[:cyan]

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# add directories to the LOAD_PATH to be executed when the Julia REPL starts up.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Load my .juliarc.jl each time the REPL runs
if chomp(readall(`pwd`)) != ENV["HOME"]
    if isfile(".juliarc.jl")
    require(".juliarc.jl")
    end
end

push!(LOAD_PATH, ENV["HOME"]*"/.julia")
push!(LOAD_PATH, ENV["HOME"]*"/ensoji-jl/juhu.jl")

if isfile("$(ENV["HOME"])/.juliarc-yaksha.jl")
    include("$(ENV["HOME"])/.juliarc-yaksha.jl")
end
