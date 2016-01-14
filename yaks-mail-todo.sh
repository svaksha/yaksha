#!/usr/bin/env bash
################################################################################
# FILE       : yaks-mail-todo.sh
# DESCRIPTION: Bash script to email todo list to me.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2013may11 - Updated:2016jan14
################################################################################
#

todofile=`mktemp ~/yaksha/mail-yyyy-mm-dd`
todolist="$HOME/yaksha/todo.md"

addline ()  { echo $1 >> $todofile ; }
addfile ()  { cat  $1 >> $todofile ; }

addline "To: SVAKSHA <svaksha@gmail.com>"
addline "Subject: ToDo for today!" 
addline ""
addline "Good morning SVAKSHA!" 
addline ""

addline "This is your ToDo list for today:"
addline ""
sed -ne '/TODO/p' $todolist  >> $todofile

cat $todofile | /usr/sbin/sendmail -F "Your Computer" -f "svaksha" -i svaksha@gmail.com
#rm $todofile

