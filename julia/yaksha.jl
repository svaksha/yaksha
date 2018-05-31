module yaksha
using Compat
using OhMyREPL


macro run(yakshajl, args...)
    return esc(:(ARGS = $args; include($yakshajl)))
end


yakshajl = [
#    "_init.jl",
#    "env.jl",
    "PkgAdd.jl"
]

  foreach(include, yakshajl)
end #EOModule
