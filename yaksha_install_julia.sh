#/usr/bin/env bash
################################################################################
# File       : yaksha_install_julia.sh from <http://svaksha.github.io/yaksha>
# Description: Installation script to install AND update the Julia source build 
# AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha> +  Credits  
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# DATES      : Created:2015/02/15 - Updated:2015/08/08
# LICENSE    : GNU AGPLv3 License <http://www.gnu.org/licenses/agpl.html>
################################################################################
# CREDITS:
# 1. @jiahao, https://gist.github.com/jiahao/3f9826b077372220b6f0
# 2. @svaksha
#
# An experimental script to automatically update julia
# USAGE:
# install julia unstable: ./yaksha_install_julia.sh jl_gitdev
# install julia nightly: ./yaksha_install_julia.sh jl_ppanightlies
################################################################################

JULIADIR=$HOME/julia
cd $JULIADIR
set -e                   # stop on error

# install julia from git master
#-------------------------------------------------------------------------------
function install_julia_gitdev {

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
# Check if ~/julia exists
#---------------------------
if [ -e /usr/local/bin/julia ]; then
    echo "Julia folder already exists on localhost. Exiting!"
    exit 1
fi

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

if test $? -ne 0; then 
  git clean -fdx   #nuclear option
  make
fi

# Was there an error ?
if [ $? -ne "0" ]; then
 echo "ERROR"
 exit 1; 
fi

# OpenBLAS without threads
#--------------------------
if [ $? -ne "0" ]; then
    make -C deps clean-openblas 
    make OPENBLAS_TARGET_ARCH=NEHALEM OPENBLAS_USE_THREAD=0
    make OPENBLAS_DYNAMIC_ARCH=0
fi

} # End function install_julia_gitdev


#Update Julia packages
$HOME/julia -e 'Pkg.update()'


# install julia from the distro PPA nightlies
#-------------------------------------------------------------------------------
function install_julia_ppanightlies {
    sudo add-apt-repository --yes ppa:staticfloat/juliareleases
    sudo add-apt-repository --yes ppa:staticfloat/julia-deps
    sudo add-apt-repository --yes ppa:staticfloat/julianightlies
    sudo apt-get -y update && sudo apt-get -y upgrade
    sudo apt-get -y install julia
    julia --eval 'Pkg.add("IJulia")' # Better to keep this in juliarc/REQUIRE ??
    julia --eval 'Pkg.add("Gadfly")'
} # End function install_julia_ppanightlies


# case install julia
#-------------------------------------------------------------------------------
case $install_typ in
    jl_gitdev)
        install_julia_gitdev
    ;;
    jl_ppanightlies)
        install_julia_ppanightlies
    ;;
    all)
        install_julia_gitdev
        install_julia_ppanightlies
    ;;
    *)
        echo "Installation in progress, almost done!"
    esac

