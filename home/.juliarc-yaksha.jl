################################################################################
# FILE       : .juliarc-yaksha.jl
# DESCRIPTION: Configuration file for invoking the REPL daemons.
# AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha>
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# LICENSE    : GNU AGPLv3 and subject to the terms and conditions in the LICENSE.md 
#              (https://github.com/svaksha/yaksha/blob/master/LICENSE.md) file being met.
# DATES      : Created:2014feb01 - Updated:2016mar16
################################################################################
#
# This file contains magic to invoke the REPL daemons.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

using Base

# https://github.com/JuliaLang/julia/pull/7487
workspace()
#http://stackoverflow.com/questions/25028873/how-do-i-reload-a-module-in-an-active-julia-session-after-an-edit
#clear()    # deprecated?
pwd()

# List of methods in a Julia Package
function list_pkg_method()
#    names(Graphs)
    whos()
end


