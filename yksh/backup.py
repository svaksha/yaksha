#!/usr/bin/env python
################################################################################
# FILE       : yaks-backup.py
# DESCRIPTION: A backup script for my system.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2015sep21 - Updated:2016jan14
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
