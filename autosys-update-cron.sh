#!/usr/bin/env bash
################################################################################
# File       : autosys-update-cron.sh
# Description: Auto update my system, use via Cron.
# AUTHOR     : SVAKSHA
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# DATES      : Created:2006mar31 Modified:2006jun15
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
# Usage: "./autosys-update-cron.sh"
################################################################################
#
# Log the date and time of execution of bash script into the `out` files.
date +"%c|started running `apt-get`:$?" >> out_autosys-update-cron.log
date +"%c|completed running: $?" >> out_autosys-update-cron.log

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoclean
sudo apt-get -y safe-upgrade
