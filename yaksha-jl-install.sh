#/usr/bin/env bash
################################################################################
# File       : yaksha-jl-install.sh 
# Description: Installation script for the Julia source build 
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, AllRightsReserved.
# DATES      : Created:2015Feb15 - Updated:2015Oct25
# LICENSE    : GNU AGPLv3 License <http://www.gnu.org/licenses/agpl.html>
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
################################################################################
#
#-------------------------------------------------------------------------------
# install julia from the distro PPA nightlies
#-------------------------------------------------------------------------------

echo "Installation of julia (PPA nightlies) will start!"

function install_jl_ppanightlies() {
    sudo add-apt-repository --yes ppa:staticfloat/juliareleases
    sudo add-apt-repository --yes ppa:staticfloat/julia-deps
    sudo add-apt-repository --yes ppa:staticfloat/julianightlies
    sudo apt-get -y update && sudo apt-get -y upgrade
    sudo apt-get -y install julia
    julia --eval 'Pkg.add("IJulia")' # Better to keep this in juliarc/REQUIRE ??
    julia --eval 'Pkg.add("Gadfly")'
} # End function install_jl_ppanightlies


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# An experimental script to automatically update julia
# From, https://gist.github.com/jiahao/3f9826b077372220b6f0
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

JULIADIR=$HOME/julia   #TODO: http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in?rq=1
cd $JULIADIR
set -e                   # stop on error

#-------------------------------------------------------------------------------
# install julia from git master
#-------------------------------------------------------------------------------
function install_jl_gitdev() {

# Check all dynamic library dependencies to detect potentially missing dependencies
    for LIB in `find deps -name "*.dylib"`; do
  # Find dependencies that have absolute paths
      LIBDEPS=$(otool -L $LIB | grep -v : | grep -v @ | grep \/ | cut -f1 -d\()
  
  # If dependency is missing, assume that the external library was upgraded and
  # version number got bumped.
      for filename in $LIBDEPS; do
        if test ! -e $filename; then
          echo "WARNING: $LIB: Could not find dynamic library dependency" $filename
          echo "Wiping all dependencies to trigger rebuild"
          make -C deps cleanall
          make -C deps distclean-libgit2 && make
          break 2
        fi
      done
    done

git pull git@github.com:JuliaLang/julia.git

# Check if ~/julia exists
#---------------------------
if [ -e /usr/local/bin/julia ]; then
    echo "Julia folder already exists on localhost. Exiting!"
    exit 1
fi

# Rebuild at all costs
# OpenBLAS without threads
#--------------------------
if [ $? -ne "0" ]; then
    make -C deps clean-openblas 
    make OPENBLAS_TARGET_ARCH=NEHALEM OPENBLAS_USE_THREAD=0
    make OPENBLAS_DYNAMIC_ARCH=0
fi

if [test $? -ne "0"] ; then
  make
  make clean
fi

if test $? -ne 0 ; then
  make cleanall
  make
fi

if test $? -ne 0; then 
  git clean -fdx         #nukes all your installed dependencies
  make
fi

# Was there an error ?
if [ $? -ne "0" ]; then
 echo "ERROR"
 exit 1; 
fi

} # End function install_jl_gitdev

echo "Installation of julia (git master) is done!"

#Update Julia packages
$HOME/julia -e 'Pkg.update()'


# case install julia
#-------------------------------------------------------------------------------
case $install_typ in
    jl_gitdev)
        install_jl_gitdev
    ;;
    jl_ppanightlies)
        install_jl_ppanightlies
    ;;
    all)
        install_jl_gitdev
        install_jl_ppanightlies
    ;;
    *)
        echo "Installation in progress, almost done!"
    esac


