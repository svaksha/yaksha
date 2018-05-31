#!/usr/bin/env bash
############################ METADATA ##########################################
#1.PROGRAM   : rm-kernels.sh (note: kept a copy in home)
#2.COPYRIGHT©: SVAKSHA, http://svaksha.github.io/yaksha, 2005-Present, ARR.
#3.AUTHOR(s) : (a) https://askubuntu.com/questions/892076/how-to-selectively-purge-old-kernels-all-at-once/892077#892077
#              (b) @svaksha, modified:2017aug07
#4.LICENSE   : GNU AGPLv3 subject to meeting all the terms in the LICENSE file: 
#              https://github.com/svaksha/yaksha/blob/master/LICENSE.md
#5.TECHNICAL : Provide zenity item list of kernels to remove from Ubuntu/ Debian OS.
#  PATH      : /usr/local/bin
#  NOTES     : Will not delete current kernel.
#              With 10 kernels on an SSD, empty cache from sudo prompt (#) using:
#              free && sync && echo 3 > /proc/sys/vm/drop_caches && free
#              First time for `du` 34 seconds.
#              Second time for `du` 1 second.
#              With a magnetic hard disk, and empty memory cache:
#              the first `du` command averages about 20 seconds per kernel.
#              the second `du` command averages about 2.5 seconds per kernel.
#  PARM      : If any parm 1 passed use REAL kernel size, else use estimated size.
#              By default `du` is not used and estimated size is displayed.
################################################################################
#
# References:
# https://askubuntu.com/questions/892076/how-to-selectively-purge-old-kernels-all-at-once/892077#892077
# https://github.com/svaksha/aksh/blob/master/cs-debian.md
# https://github.com/svaksha/aksh/blob/master/cs-devops.md
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹


# Must be running as sudo
if [[ $(id -u) != 0 ]]; then
    zenity --error --text "root access required. Use: sudo rm-kernels.sh"
    exit 99
fi

OLDIFS="$IFS"
IFS="|"
choices=()

current_version=$(uname -r)

for f in /boot/vmlinuz*
do
    if [[ $f == *"$current_version"* ]]; then continue; fi # skip current version
    [[ $f =~ vmlinuz-(.*) ]]
    v=${BASH_REMATCH[1]}        # example: 4.9.21-040921-generic
    v_main="${v%-*}"            # example: 4.9.21-040921

    n=$(( n + 1 ))              # increment number of kernels

    # Kernel size in /boot/*4.9.21-040921-generic*
    s=$(du -ch /boot/*-$v* | awk '/total/{print $1}')

    if [[ $# -ne 0 ]] ; then    # Was a parameter passed?
        if [[ -d "/usr/src/linux-headers-"$v_main ]] ; then
             # Kernel headers size in /usr/src/*4.9.21-040921*
             s2=$(du -ch --max-depth=1 /usr/src/*-$v_main* | awk '/total/{print $1}')
        else
             s2="0M"            # Linux Headers are not installed
        fi
        # Kernel image size in /lib/modules/4.9.21-040921-generic*
        s3=$(du -ch --max-depth=1 /lib/modules/$v* | awk '/total/{print $1}')
    else
        # Estimate sizof of optional headers at 125MB and size of image at 220MB
        if [[ -d "/usr/src/linux-headers-"$v_main ]] ; then
             s2="125M"
        else
             s2="0M"            # Linux Headers are not installed
        fi
        s3="220M"
    fi

    # Strip out "M" provided by human readable option of du and add 3 sizes together
    c=$(( ${s//[^0-9]*} + ${s2//[^0-9]*} + ${s3//[^0-9]*} ))
    s=$(( ${s//[^0-9]*} )) # Strip out M to make " MB" below which looks nicer
    t=$(( t + c ))
    s=$s" MB"
    c=$c" MB"
    d=$(date --date $(stat -c %y $f) '+%b %d %Y') # Last modified date for display
    choices=("${choices[@]}" false "$v" "$d" "$s" "$c")
done

# Write Kernel version and array index to unsorted file
> ~/.rm-kernels-plain # Empty any existing file.
for (( i=1; i<${#choices[@]}; i=i+5 )) ; do
    echo "${choices[i]}|$i" >> ~/.rm-kernels-plain
done

# Sort kernels by version number
sort -V -k1 -t'|' ~/.rm-kernels-plain -o ~/.rm-kernels-sorted

# Strip out keys leaving Sorted Index Numbers
cut -f2 -d '|' ~/.rm-kernels-sorted > ~/.rm-kernels-ndx

# Create sorted array
SortedArr=()
while read -r ndx; do 
    end=$(( ndx + 4 ))
    for (( i=$(( ndx - 1 )); i<end; i++ )); do
        SortedArr+=("${choices[i]}")
    done
done < ~/.rm-kernels-ndx

rm ~/.rm-kernels-plain ~/.rm-kernels-sorted ~/.rm-kernels-ndx

if [[ $# -ne 0 ]] ; then    # Was a parameter passed?
    VariableHeading="Real Total"
else
    VariableHeading="Est. Total"
fi

# adjust width & height below for your screen 640x480 default for 1920x1080 HD screen
# also adjust font="14" below if blue text is too small or too large

choices=(`zenity \
        --title "rm-kernels - $n Kernels, Total: $t MB excluding: $current_version" \
        --list \
        --separator="$IFS" \
        --checklist --multiple \
        --text '<span foreground="blue" font="14">Check box next to kernel(s) to remove</span>' \
        --width=800 \
        --height=480 \
        --column "Select" \
        --column "Kernel Version Number" \
        --column "Modified Date" \
        --column "/boot Size" \
        --column "$VariableHeading" \
        "${SortedArr[@]}"`)
IFS="$OLDIFS"

i=0
list=""
for choice in "${choices[@]}" ; do
    if [ "$i" -gt 0 ]; then list="$list- "; fi # append "-" from last loop
    ((i++))

    short_choice=$(echo $choice | cut -f1-2 -d"-")
    header_count=$(find /usr/src/linux-headers-$short_choice* -maxdepth 0 -type d | wc -l)

    # If -lowlatency and -generic are purged at same time the _all header directory
    # remains on disk for specific version with no -generic or -lowlatency below.
    if [[ $header_count -lt 3 ]]; then
        # Remove all w.x.y-zzz headers
        list="$list""linux-image-$choice- linux-headers-$short_choice"
    else
        # Remove w.x.y-zzz-flavour header only, ie -generic or -lowlatency
        list="$list""linux-image-$choice- linux-headers-$choice" 
    fi

done

if [ "$i" -gt 0 ] ; then
     apt-get purge $list
fi
