module yaksha
using Compat
using OhMyREPL


source_files = [
    "env.jl",
    "PkgAdd.jl",
]
foreach(include, source_files)
end #EOModule
