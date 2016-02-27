#!/usr/bin/env bash
################################################################################
# FILE       : yaks-vm-gitlabce.sh
# DESCRIPTION: Bash Installation script for gitlab-ce on Debian Jessie.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : Created:2016feb23 - Updated:2016feb26
################################################################################
# References:
# https://github.com/svaksha/aksh/blob/master/cs-debuntu.md 
# https://github.com/svaksha/aksh/blob/master/cs-devops.md
#-------------------------------------------------------------------------------


# https://docs.docker.com/engine/installation/linux/ubuntulinux/
# Your docker host needs to have 1GB or more of available RAM to run GitLab.

function dockr_gitlab {
wget -qO- https://get.docker.com/ | sh

# https://hub.docker.com/r/gitlab/gitlab-ce/
# ReadDocs: http://doc.gitlab.com/omnibus/docker/
# GitLab Community Edition docker image based on the Omnibus package
docker pull gitlab/gitlab-ce
# http://doc.gitlab.com/omnibus/settings/smtp.html

# https://hub.docker.com/r/sameersbn/gitlab/
# docker pull sameersbn/gitlab

}

function dockr_gitlab {
sudo apt-get install curl openssh-server ca-certificates postfix
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt-get install gitlab-ce
}
