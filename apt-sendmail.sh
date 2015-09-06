#!/usr/bin/env bash
################################################################################
# File       : apt-sendmail.sh
# Description: Send email about updates
# AUTHOR     : SVAKSHA
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# DATES      : Created:2006jun15 
# LICENSE    : GNU GPL License
# This code is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR 
# A PARTICULAR PURPOSE. Permission is hereby granted, free of charge, to any 
# person obtaining a copy of this software, to deal in the Software without 
# restriction, including without limitation the rights to use, copy, modify, 
# merge, publish, redistribute, and/or sell copies of the Software and use in 
# source form, with or without modification, and to permit persons to whom the 
# Software is furnished to do so as per the terms in the LICENSE.md file and 
# subject to the following conditions being met:
# Usage: "./apt-sendmail.sh"
################################################################################

mybash_files=~/bash-scripts/

# automatically install updates and Log and email any changes to my email
MAILTO=svaksha@gmail.com
# host name of smtp server
MAIL=gmail.google.com

mybash_files=$(mybash_files)

# smtp setup commands
echo "helo $(hostname)" >> ${mybash_files}
echo "mail from: root@$(hostname)" >> ${mybash_files}
echo "rcpt to: $MAILTO" >> ${mybash_files}
echo 'data'>> ${mybash_files}
echo "subject: Aptitude cron $(date)" >> ${mybash_files}

# Now run aptitude to do the updates, logging its output
echo "aptitude update" >> ${mybash_files}
aptitude update >> ${mybash_files} 2>&1
echo "" >> ${mybash_files}
echo "aptitude full-upgrade" >> ${mybash_files}
aptitude -y full-upgrade >> ${mybash_files} 2>&1
echo "" >> ${mybash_files}
echo "aptitude clean" >> ${mybash_files}
aptitude clean >> ${mybash_files} 2>&1

# Remove the escaped new lines in my output. 
mybash_files2=$(mybash_files)
cat ${mybash_files} | sed 's/\r\r/\n/g'|sed 's/\r//g' > ${mybash_files2}
mv ${mybash_files2} ${mybash_files}

# Close SMTP
echo >> ${mybash_files}
echo '.' >> ${mybash_files}
echo 'quit' >> ${mybash_files}
echo >> ${mybash_files}

# Send the email and ignore output
telnet $MAIL 25 < ${mybash_files} > /dev/null 2> /dev/null

# and remove temp files
rm -f ${mybash_files}
