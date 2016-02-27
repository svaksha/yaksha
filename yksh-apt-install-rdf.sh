#!/usr/bin/env bash
################################################################################
# FILE       : yaks-apt-install-rdf.sh
# DESCRIPTION: Bash Installation script for RDF tools on a Debian-Ubuntu system.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2016feb23 - Updated:2016feb23
################################################################################
#
# References:
# https://github.com/svaksha/aksh/blob/master/cs-debuntu.md 
# https://github.com/svaksha/aksh/blob/master/cs-devops.md
#-------------------------------------------------------------------------------

set -e

# SETTINGS SECTION

CODE_BASE = src

INSTALL_DIR = /usr/local/bin
ANY23_VERSION = 1.1  # check the site for exact versions, https://any23.apache.org/

# END OF SETTINGS SECTION

# Does the source base directory exist? No? Well, create it!
cd ~
if [[ ! -d "$CODE_BASE" ]] ; then
    mkdir "$CODE_BASE"
fi
cd "$CODE_BASE"

# Install Ruby and RubyGems first:
sudo apt-get install -y ruby

# Install rdf2json:
sudo gem install rdf2json

# Install Apache Any23, https://any23.apache.org/
wget http://ftp.jaist.ac.jp/pub/apache/any23/1.1/apache-any23-core-${ANY23_VERSION}.tar.gz
tar xzf apache-any23-core-${ANY23_VERSION}.tar.gz
cd apache-any23-core-${ANY23_VERSION}
chmod 700 bin
if [[ -f "$INSTALL_DIR/any23" ]] ; then
    sudo rm -f "$INSTALL_DIR/any23"
fi
sudo ln -s "`pwd`/bin/any23" "$INSTALL_DIR/any23"

