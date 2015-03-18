# Add directories to LOAD_PATH

using IJulia
using HDF5
using TerminalExtensions

# TODO :  Error check to fail gracefully

using IniFile
ini = Inifile()
read(ini, ENV["JULIA_APP_BOOTSTRAP"])
include_dir = get(ini, "data", "include_dir")
app_dir     = get(ini, "data", "app_dir")
util_include_dir = get(ini, "data", "util_include_dir")
data_dir     = get(ini, "data", "data_dir")

# Put on search path - CHD analysis, which is only necessary for CHD analysis
push!(LOAD_PATH, include_dir)
push!(LOAD_PATH, util_include_dir)

# Optional additional initialization
if isfile("$(ENV["HOME"])/.juliarc_more.jl")
    include("$(ENV["HOME"])/.juliarc_more.jl")
end
