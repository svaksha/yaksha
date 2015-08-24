#/usr/bin/env bash
################################################################################
# File       : yaksha_jl_colors.sh from <http://svaksha.github.io/yaksha>
# Description: Script to change Color.jl to Colors.jl
# AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha> + Credits  
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# DATES      : Created:2015aug24 - Updated:2015aug24
# LICENSE    : GNU AGPLv3 License <http://www.gnu.org/licenses/agpl.html>
################################################################################
# CREDITS:
# 1. @timholy (see julia-users mailing list)
#
# This script will automatically update julia pkg for Color.jl to Colors.jl
################################################################################
#
# Intended to be run from the top directory in a package
# Do not run this twice on the same source tree without discarding
# the first set of changes.
sed -i 's/\bColor\b/Colors/g' REQUIRE

fls=$(find . -name "*.jl")
sed -i 's/\bColor\b/Colors/g' $fls               # Color -> Colors
sed -i -E 's/\bcolor\("(.*?)"\)/colorant\"\1\"/g' $fls   # color("red") ->
colorant"red"
sed -i 's/AbstractAlphaColorValue/TransparentColor/g' $fls
sed -i 's/AlphaColorValue/TransparentColor/g' $fls   # might mean ColorAlpha
sed -i 's/ColorValue/Color/g' $fls
sed -i 's/ColourValue/Color/g' $fls
sed -i -E 's/\bLAB\b/Lab/g' $fls
sed -i -E 's/\bLUV\b/Luv/g' $fls
sed -i -E 's/\b([a-zA-Z0-9_\.]+)\.c\.(\w)\b/\1\.\2/g' $fls      # colval.c.r ->
colval.c
# This next one is quite dangerous, esp. for LCHab types...
# ...on the other hand, git diff is nice about showing the things we should fix
sed -i -E 's/\b([a-zA-Z0-9_\.]+)\.c\b/color(\1)/g' $fls

# These are not essential, but they generalize to RGB24 better
# However, they are too error-prone to use by default since other color
# types like Lab have fields with the same names
#sed -i -E 's/\b([a-zA-Z0-9_\.]+)\.r\b/red(\1)/g' $fls          # c.r -> red(c)
#sed -i -E 's/\b([a-zA-Z0-9_\.]+)\.g\b/green(\1)/g' $fls
#sed -i -E 's/\b([a-zA-Z0-9_\.]+)\.b\b/blue(\1)/g' $fls
#sed -i -E 's/\b([a-zA-Z0-9_\.]+)\.alpha\b/alpha(\1)/g' $fls     # c.alpha ->
alpha(c)

