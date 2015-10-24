#/usr/bin/env bash
################################################################################
# File       : yaksha-jl-update.sh 
# Description: Update the Julia source build and store different versions.
# AUTHOR     : @SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha> 
# COPYRIGHT© : 2005-Now SVAKSHA, AllRightsReserved.
# DATES      : Created:2015feb15 - Updated:2015oct19
# LICENSE    : GNU AGPLv3 License <http://www.gnu.org/licenses/agpl.html>
################################################################################
################################################################################
#


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# An experimental script to automatically update julia
# From, https://gist.github.com/jiahao/3f9826b077372220b6f0
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


JULIADIR=$HOME/julia
cd $JULIADIR

#Check all dynamic library dependencies to detect potentially missing
#dependencies
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

git pull

#Rebuild at all costs
make
if test $? -ne 0 ; then
  make clean
  make cleanall
  make
fi
if test $? -ne 0; then #nuclear option
  git clean -xfd
  make
fi


./julia -e 'versioninfo()'  # which JL version?
./julia -e 'Pkg.status()'   # provide pkg list
./julia -e 'Pkg.update()'  #Update Julia packages




#function yaksha_require()
# generate a list of all the packages I've installed and pipe to "yaksha"
    for require `find pkg -name "*.julia/v0.*/REQUIRE"`; do
        collect(keys(Pkg.installed()))
        readandwrite(`~/.julia/v0.5/REQUIRE` .> "~/yaksha/REQUIRE")
    end
#end


#*******************************************************************************
# A shell script that grabs and/or updates the latest version of all the 
# Julia packages from the registered packages repo : METADATA.jl
#*******************************************************************************
function yaksha_metadata()
 for f in ~/.julia/v0.5/METADATA/*/url; do
     p=$(basename $(dirname $f))
     url=`cat $f`
     echo "updating $p from $url..."
     if test ! -d $p; then
         git clone $url $p
     else
         (cd $p; git pull origin master)
     fi
 done
end


#*******************************************************************************
# From, https://gist.github.com/tmlbl/430f7d54cda16a43bff6
#*******************************************************************************
# Find Julia binaries in /opt/julia with the same directory structure
# as ~/.julia to store different versions, and use this script to switch
# between them inorder to maintain a link of the ~/.julia folder to
# ~/julia, for easier package development.

JBIN=""
PDIR=""

if [[ ! "$1" ]]; then
	echo "Please specify a version, i.e."
	echo "$ jvm 0.5"
	exit 1
fi

# Look for the package directory
if [[ -d "$HOME/.julia/$1" ]]; then
	PDIR="$HOME/.julia/$1"
elif [[ -d "$HOME/.julia/v$1" ]]; then
	PDIR="$HOME/.julia/v$1"
else
	echo "No Julia packages for version $1 found."
	exit 1
fi

# Look for the executable
if [[ -d "/opt/julia/$1" ]]; then
	JBIN="/opt/julia/$1/bin/julia"
elif [[ -d "/opt/julia/v$1" ]]; then
	JBIN="/opt/julia/v$1/bin/julia"
else
	echo "Didn't find the executable in /opt/julia/<version>"
	exit 1
fi

echo "Linking executable for version $1..."
sudo rm /usr/bin/julia
sudo ln -s $JBIN /usr/bin/julia
echo "Linking packages shortcut for version $1..."
rm -r ~/julia; ln -s $PDIR ~/julia


