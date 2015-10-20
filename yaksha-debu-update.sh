#!/usr/bin/env bash
################################################################################
# File       : yaksha-debu-update.sh, a part of http://svaksha.github.io/yaksha
# Description: Update my system & email me for each Cronjob the machine runs.
# AUTHOR     : SVAKSHA, http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# DATES      : Created:2006mar31 - Updated:2015oct19
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
#
#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# A script for weekly system updates that will email me each time the Cronjob runs.
# Usage: "./yaksha-debu-update.sh"
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

yaksha_dir=~/yaksha/

# Log the date and time of execution of bash script into the `out` files.
date +"%c|started running `apt-get`:$?" >> out_yaksha-update-cron.log
date +"%c|completed running: $?" >> out_yaksha-update-cron.log

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# Cron will automatically install the weekly updates
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function system_upgrade() {
    echo "Finish installation with a dist-upgrade"
    # resynchronize the package index files from their internet sources.
    sudo apt-get -y update
    # Install the newest versions of all packages currently installed on this system.
    sudo apt-get -y upgrade
    # Install kernel updates on a Ubuntu LTS server and the "smart" conflict
    # resolution system can handle changing dependencies with new package versions.
    sudo apt-get -y dist-upgrade
    sudo apt-get -y safe-upgrade
    sudo apt-get -y autoclean
}    


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Email all the System Upgrade details
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# automatically install updates and Log and email any changes to my email
MAILTO=svaksha@gmail.com
# host name of smtp server
MAIL=gmail.google.com

yaksha_dir=$(yaksha_dir)

# smtp setup commands
echo "helo $(hostname)" >> ${yaksha_dir}
echo "mail from: root@$(hostname)" >> ${yaksha_dir}
echo "rcpt to: $MAILTO" >> ${yaksha_dir}
echo 'data'>> ${yaksha_dir}
echo "subject: Aptitude cron $(date)" >> ${yaksha_dir}

# Now run aptitude to do the updates, logging its output
echo "apt-get update" >> ${yaksha_dir}
aptitude update >> ${yaksha_dir} 2>&1
echo "" >> ${yaksha_dir}
echo "apt-get full-upgrade" >> ${yaksha_dir}
aptitude -y full-upgrade >> ${yaksha_dir} 2>&1
echo "" >> ${yaksha_dir}
echo "apt-get clean" >> ${yaksha_dir}
aptitude clean >> ${yaksha_dir} 2>&1

# Remove the escaped new lines in my output.
yaksha_dir2=$(yaksha_dir)
cat ${yaksha_dir} | sed 's/\r\r/\n/g'|sed 's/\r//g' > ${yaksha_dir2}
mv ${yaksha_dir2} ${yaksha_dir}

# Close SMTP
echo >> ${yaksha_dir}
echo '.' >> ${yaksha_dir}
echo 'quit' >> ${yaksha_dir}
echo >> ${yaksha_dir}

# Send the email and ignore output
telnet $MAIL 25 < ${yaksha_dir} > /dev/null 2> /dev/null

# and remove temp files
rm -f ${yaksha_dir}


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Funcs
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

update_debu='all'
key="$1"
key="$2"

case $key in
    -c|--clean)
        system_upgrade
        shift
    ;;
    -u|--update)
        update_debu="$2"
        shift
    ;;
    *)
        echo "usage:
                -c|--clean  - remove dotfiles before installation
                -u|--update [type] copy the yaksha dotfiles into home
        "
        ;;
    esac
    
    
case $update_debu in
    sysupgrade)
        system_upgrade
    ;;
    all)
        system_upgrade
    ;;
    *)
        echo "Installation in progress, almost done!"
    esac
    
