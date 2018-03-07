#!/usr/bin/env bash
################################################################################
# FILE      : jl-update.sh
# INFO      : Update the Julia source build and store different versions.
# AUTHOR    : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE    : http://svaksha.github.io/yaksha
# COPYRIGHT©: 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE   : GNU AGPLv3 subject to meeting all the terms in the LICENSE 
#             file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES     : 2015feb15 - 2016mar22
################################################################################
#
#-------------------------------------------------------------------------------
# An experimental script to automatically update julia
# From, https://gist.github.com/jiahao/3f9826b077372220b6f0
#-------------------------------------------------------------------------------

cd
JULIADIR=$HOME/julia
cd $JULIADIR

#Check all dynamic library dependencies to detect potentially missing dependencies
#-------------------------------------------------------------------------------
for LIB in `find deps -name "*.dylib"`; do
  #Find dependencies that have absolute paths
  LIBDEPS=$(otool -L $LIB | grep -v : | grep -v @ | grep \/ | cut -f1 -d\()

  #If dependency is missing, assume that the external library was upgraded and
  #version number got bumped.
  for filename in $LIBDEPS; do
    if test ! -e $filename; then
      echo WARNING: $LIB: Could not find dynamic library dependency $filename
      echo Wiping all dependencies to trigger rebuild
      make -C deps cleanall
      break 2
    fi
  done
done

git pull git@github.com:JuliaLang/julia.git

# Package Manager Functions via the CLI - Moved to another script.
julia -e 'Pkg.dir()'     # Returns the absolute path of the package directory. 
julia -e 'versioninfo()' # which JL version?
julia -e 'Pkg.status()'  # provide pkg list
julia -e 'Pkg.update()'  # Update Julia packages
julia -e 'Pkg.resolve()' # Determine the optimal/consistent package ver to install/upgrade from Pkg.dir("REQUIRE").
#julia -e 'Pkg.add("InstallPackageName")' 
#julia -e 'showall(sort(collect(keys(Pkg.installed()))))'

#Rebuild at all costs
#-------------------------------------------------------------------------------
make
if test $? -ne 0 ; then
  make clean
  make cleanall
  ## Lets fix OPENBLAS errors
  make -C deps clean-openblas
  make OPENBLAS_USE_THREAD=0
  make OPENBLAS_TARGET_ARCH=NEHALEM
  make testall
fi

if test $? -ne 0; then  #nuclear option
   git clean -xfd
   make distclean
   make -C deps clean-uv
   make -C deps distclean
   git clean -fdx
   make -C deps distclean-libgit2 && make 
fi

cd   # Exit current dir & Return to $HOME dir

