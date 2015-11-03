#!/usr/bin/env python
################################################################################
# File       : yaks-deb-backup.py
# Description: Backup script for my system.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, AllRightsReserved
# DATES      : 2015sep21-2015oct21
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

import attic
import rotate-backups
import datetime
import logging
import os
import shutil  # https://docs.python.org/3/library/shutil.html


LOCAL_BACKUP_DIR = '$HOME/2015-09-28-VID_{0}'

def get_backup_directory(base_directory):
    date = str(datetime.datetime.now())[:16]
    date = date.replace(' ', '_').replace(':', '')
    return base_directory.format(date)

def copy_files(directory):
    for file in os.listdir(LOCAL_BACKUP_DIR ):
        file_path = os.path.join(LOCAL_BACKUP_DIR , file)
        if os.path.isfile(file_path):
            shutil.copy(file_path, directory)

def perform_backup(base_directory):
    backup_directory = get_backup_directory(base_directory)
    os.makedirs(backup_directory)
    copy_files(backup_directory)

def main():
    perform_backup(LOCAL_BACKUP_DIR)

if __name__ == '__main__':
    main()
