#!/usr/bin/env bash
################################################################################
# File       : yaks-mail-todo.sh
# Description: Bash script to email todo list to me.
# AUTHOR     : SVAKSHA :: http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA (http://svaksha.com/pages/Bio) AllRightsReserved
# DATES      : Created:2013may11 - Updated:2015nov29
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

