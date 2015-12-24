# YAKSHA - my personal automation daimons!

My personal automation daemons for the Linux system installation, updation, backups, bash shell scripts, dockerfiles, dotfiles and configuration files!

## Index

### Installation 
To try out these program scripts & dotfiles, fork this repository, review the code, and remove the things you don’t require. Test them before use!
Github offers HTTPS and SSH as transfer protocols or this repo can be downloaded as a [zip-file][download] (latest 'master' branch). __Tip__: You should have uploaded your `ssh` key to github and have `git` installed locally before issuing the `git` commands.

1. For SSH protocol use the URL `ssh://git@github.com:svaksha/yaksha.git` via the clone command:
```git clone ssh://github.com/svaksha/yaksha.git 
```
2. For HTTPS protocol use the URL `https://github.com/svaksha/yaksha.git` to clone/pull the repo locally.
3. After the repo is cloned into the `~/yaksha` folder, change directory with the command `cd yaksha` to run the scripts you need. My dotfiles are stored in`~/home` with symlinks.

Here is a short description of contents (folders & programs) of the `yaksha` repo :

  [download]: https://github.com/svaksha/yaksha/archive/master.zip

#### Programs
+ `yaksha-deb-backup.py` :: This daemon will take regular backups of my system using the attic python lib.
+ `yaksha-deb-install.sh` :: Automated system installation shell script for a new debian/ubuntu machine.
+ `yaksha-deb-uninstall.sh` :: An uninstall script (that should **not** be used if you dont know what it does).
+ `yaksha-deb-update.sh` :: This daemon automagically updates my OS.
+ `yaksha-jl-install.sh` :: A script for the Julia installation and build process.
+ `yaksha-jl-update.sh` :: This script updates my Julia installation.

#### Folders
+ `~/yaksha/dockerfiles/` :: My dockerfiles.
+ `~/yaksha/home/` :: Home dotfiles and folders for `.atom`, `.julia`, `.vim`, ..
+ `~/yaksha/scripts/` :: General scripts.

----

# Copyright & License
+ COPYRIGHT© 2005-Now [SVAKSHA](http://svaksha.com/pages/Bio) All Rights Reserved. Code and Copyrights when referenced and/or attributed to other people and/or entities belongs to them as listed in the files. 
+ The __`yaksha`__ repository is licensed and distributed under the [AGPLv3 License](http://www.gnu.org/licenses/agpl-3.0.html) and ALL references, citations, copies and forks of this work must retain the Copyright, Licence (LICENSE.md file), this permission notice and attribute [credit](https://en.wikipedia.org/wiki/Creative_Commons_license#Attribution).
+ **Standard Disclaimer & Warning** : No warranty and/or guarantee for any particular use, express or implied and you agree to use these [automation daimons](http://svaksha.github.io/yaksha) at your own risk and liability! 

## Feedback
Any suggestions for improvements are [welcome](https://github.com/svaksha/yaksha/issues) via BR's !

