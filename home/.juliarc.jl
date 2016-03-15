################################################################################
# FILE       : .juliarc.jl
# DESCRIPTION: Configuration file for Julia for users to store their personal
#              commands in homedir(), in a file named .juliarc.jl
# AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha>
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# LICENSE    : GNU AGPLv3 and subject to the terms and conditions in the LICENSE.md 
#              (https://github.com/svaksha/yaksha/blob/master/LICENSE.md) file being met.
# DATES      : Created:2013oct01 - Updated:2016mar15
################################################################################
#
# This file contains site-specific commands (EX. add directories to the LOAD_PATH,
# to be executed when the Julia REPL starts up.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

using Base
#using TerminalExtensions

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Greet Users on startup
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
println("|| नमस्ते ! स्वक्षंस्या सङ्गणकप्रक्रमम् स्वागतम  || Greetings! Welcome to SVAKSHA's Julia language programs ||")

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# REPL : CYAN 
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# changing the "julia>" prompt color schemes in the REPL
Base.active_repl.prompt_color = Base.text_colors[:cyan]

# alternatively, https://gist.github.com/Ismael-VC/6db0c310eaf04d0b0a1b
# Separator function for the CYAN color.
const HOSTS = ASCIIString["hd$(i)" for i = 1:19]
const SEPARATOR = "#" ^ 79
separator() = (println(); print_with_color(:cyan, SEPARATOR); println())

function ssh_all(command, commands...; hosts=HOSTS)
    separator()
    for host in hosts
        println()
        @show host
        println()
        cmd = `ssh $host $command`
        if !isempty(commands)
            for c in commands
                cmd = cmd |> c    # pipe commands
            end
        end
        run(cmd)
        separator()
    end
end

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# add directories to the LOAD_PATH to be executed when the Julia REPL starts up.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Load my .juliarc.jl for each REPL run, enable a per-directory startup file.
if chomp(readall(`pwd`)) != ENV["HOME"]
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

# From Ethan Anderes <ethananderes@gmail.com> on julia-users.
function paste()
    include_string(clipboard());
end

#https://twitter.com/Felipe_J_H/status/672465597075234816
Base.display(x...) = 
    for xi in x 
    display(xi) 
end




