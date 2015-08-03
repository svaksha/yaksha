#/usr/bin/env bash
################################################################################
# File       : yaksha_update_julia.sh from <http://svaksha.github.io/yaksha>
# Description: Installation script to update the Julia source build 
# AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha> plus the Credits section 
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# DATES      : 2015Feb15 09:04:55 AM IST (Updated)
# LICENSE    : GNU AGPLv3 License <http://www.gnu.org/licenses/agpl.html>
################################################################################
# CREDITS:
# 1. @jiahao, https://gist.github.com/jiahao/3f9826b077372220b6f0
# 2. Steven G. Johnson <stevenj.mit@gmail.com>
# Modified by @svaksha
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


