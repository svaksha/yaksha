#/usr/bin/env bash
# install julia release: ./yaksha_update_julia.sh juliareleases
# install julia nightly: ./yaksha_update_julia.sh julianightlies
################################################################################
# File       : yaksha_update_julia.sh from <http://svaksha.github.io/yaksha>
# Description: Installation script to update the Julia source build 
# AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha> +  Credits  
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# UPDATED    : 2015/08/05 
# LICENSE    : GNU AGPLv3 License <http://www.gnu.org/licenses/agpl.html>
################################################################################
# CREDITS:
# 1. @jiahao, https://gist.github.com/jiahao/3f9826b077372220b6f0
# 2. @svaksha
#
# An experimental script to automatically update julia
################################################################################

JULIADIR=$HOME/julia

cd $JULIADIR

# Check all dynamic library dependencies to detect potentially missing dependencies
for LIB in `find deps -name "*.dylib"`; do
  # Find dependencies that have absolute paths
  LIBDEPS=$(otool -L $LIB | grep -v : | grep -v @ | grep \/ | cut -f1 -d\()
  
  # If dependency is missing, assume that the external library was upgraded and
  # version number got bumped.
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

# Rebuild at all costs
make
if test $? -ne 0 ; then
  make clean
  make
fi
if test $? -ne 0 ; then
  make cleanall
  make
fi
if test $? -ne 0; then #nuclear option
  git clean -xfd
  make
fi

#Update Julia packages
./julia -e 'Pkg.update()'


