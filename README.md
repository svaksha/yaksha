# YAKSHA
__My personal automation daimons!__

Each time I installed and set up a new machine it was painful to remember what packages I had installed on my old machine and doing this manually was error-prone and a time-consuming process. Enter [YAKSHA][yaksha], meaning "demon" in Sanskrit, my personal automation daimons/daemons for Linux system installation, updation, backups, bash shell scripts, dockerfiles, dotfiles and configuration files to standardize my development environment by automating the installation process and organizing the various developer tools.

__Standard Disclaimer__ : No warranty and/or guarantee for any particular use, express or implied and you agree to use these [automation daimons][yaksha] at your own risk and liability! 

 [yaksha]: http://svaksha.github.io/yaksha "yaksha"

## Installation 
To try out these program scripts & dotfiles, fork this repository, review the code, and remove the things you don’t require. Test them before use!
Github offers HTTPS and SSH as transfer protocols or the repo can be downloaded as a [zip-file][download] (latest 'master' branch). 
__Tip__: You should have uploaded your `ssh` key to github and have `git` installed locally before issuing the `git` commands.

+ For SSH protocol use the URL `ssh://git@github.com:svaksha/yaksha.git` via the clone command:
```
git clone ssh://github.com/svaksha/yaksha.git
```
+ For HTTPS protocol use the URL `https://github.com/svaksha/yaksha.git` to clone/pull the repo locally.
+ After the repo is cloned into the `~/yaksha` folder, change directory with the command `cd yaksha` to run the scripts you need. My dotfiles are stored in`~/home` with symlinks.

Here is a short description of contents (folders & programs) of the `yaksha` repo - this will __simplify__ the process with __easy instructions__ and backed up older __dotfiles/scripts__ to automate my machine setup of the following: 

### Programs
+ __yaks-deb-backup.py__ :: This daemon will take regular backups of my system using the attic python lib.
+ __yaks-deb-install.sh__ :: An automated system installation shell script for all new Debian/Ubuntu OS machines that installs the following developer stack: 
  * Vim, bash, tab completion, curl, git, GNU core utils, etc..
  * Atom, VirtualBox, Vagrant, Docker, etc..
  * _Database_: MySQL, PostgreSQL, SQLite, MongoDB, etc..
  * _Languages_: Each programming language as per requirement can be installed via individual scripts given below. 
+ __yaks-deb-secure-iptables.sh__ :: A program firewall to secure the machine.
+ __yaks-deb-uninstall.sh__ :: An uninstall script (that should **not** be used if you dont know what it does).
+ __yaks-deb-update.sh__ :: This daemon automagically updates my Debian/Ubuntu OS.
+ __yakshara-gccpy-install.sh__ :: Installs the programming language dependencies for __C/C++ and the (scientific) Python__ developer stack - IPython Notebook, NumPy, Scipy, Pandas, Scikit-Learn, Matplotlib, etc.. 
+ __yakshara-julia-install.sh__ :: A script for the __Julia__ installation and build process.
+ __yakshara-julia-update.sh__ :: This script updates my __Julia__ installation - I use the _master build_, so __dont__ use this script if you are not comfortable with some breakage.
+ __yakshara-langs-install.sh__ :: Install programming language dependencies for __Go, R, Ruby, Java and JS__.
+ __yaks-mail-todo.sh__ :: Mail the ToDo list.

### Folders
+ __~/yaksha/dockerfiles/__ :: My dockerfiles.
+ __~/yaksha/home/__ :: Home dotfiles and folders for `.atom`, `.julia`, `.vim`, ..
+ __~/yaksha/scripts/__ :: General scripts.

 [download]: https://github.com/svaksha/yaksha/archive/master.zip "download"

----

# Copyright & License
+ COPYRIGHT© 2005-Now [SVAKSHA](http://svaksha.com/pages/Bio) All Rights Reserved. Copyrights for code when referenced and/or attributed to other people and/or entities belongs to them as listed in the files. 
+ The __yaksha__ repository is licensed and distributed under the [AGPLv3 License](http://www.gnu.org/licenses/agpl-3.0.html) and ALL references, citations, copies and forks of this work must retain the Copyright, Licence (LICENSE.md file), this permission notice and attribute [credit](https://en.wikipedia.org/wiki/Creative_Commons_license#Attribution).

## Feedback
Any suggestions for improvements are [welcome](https://github.com/svaksha/yaksha/issues) via BR's !

