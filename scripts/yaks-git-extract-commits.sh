# Original gist: https://gist.github.com/xinan/42669b49153af52919b2
# git_extract_commits.sh for GSoC commits.
# A simple shell script to generates patches by the specified author in
# chronological order and numbers them from 1 to n.
# Pass in 0 argument to check the usage.
# If no start date and end date specified, it generates patches from
# 2015-05-25 to 2015-08-21 by default.
# If no output directory specified, it outputs patches in the current
# directory.
###############################################################################
