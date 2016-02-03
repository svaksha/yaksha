# YAKSHA
__My personal automation daimons!__

Each time I installed and set up a new machine it was hard to remember every configuration setting I had changed and which packages I had installed over the years on the stable version of my Debian/Ubuntu machine. Doing this manually was a huge time-sink and an error-prone process resulting in annoying discrepancies and worse, dependency-hell. 

Enter [YAKSHA][yaksha], meaning "demon" in Sanskrit. These are my personal automation daimons (daemons?) for __Linux system installation, updation, backups, bash shell scripts, dockerfiles, dotfiles and configuration files__. Standardizing my development environment by automating the installation process and organizing the various developer tools was addictive fun!

__Change is the only constant in life__, so as a programmer I constantly change and (try to) improve the configs and dotfiles in my attempt to keep optimizing the repo organization for ease of maintainence and extensibility. Config and dotfiles are meant to be personally unique for individuals, but if you wish to use this repository code and these configs, follow the [installation](https://github.com/svaksha/yaksha#installation) instructions.

 [yaksha]: http://svaksha.github.io/yaksha "yaksha"

# INSTALLATION 
To try out these program scripts & dotfiles, fork this repository, review the code, and remove the things you don’t require. Test them before use and most importantly, read the  __License & Disclaimer__ : No warranty and/or guarantee for any particular use, express or implied and you agree to use these [automation daimons][yaksha] at your own risk and liability! 

## System Dependencies
At the outset, your Debian/Ubuntu machine should have the following core tools installed : _Git and Python_. Github offers HTTPS and SSH as transfer protocols or the repo can be downloaded as a [zip-file][download] (latest 'master' branch). __Tip__: You should have uploaded your `ssh` key to github and have `git` installed locally before issuing the `git` commands on the terminal.

+ For SSH protocol use the URL `ssh://git@github.com:svaksha/yaksha.git` via the clone command:
```
git clone ssh://github.com/svaksha/yaksha.git
```
+ For HTTPS protocol use the URL `https://github.com/svaksha/yaksha.git` to clone/pull the repo locally.
+ After the repo is cloned into the `~/yaksha` folder, change directory with the command `cd yaksha` to run the scripts you need. My dotfiles are stored in `~/home` with symlinks.

The repository tree for [yaksha][yaksha] is structured as follows: 

### 1. Programs
These programs are for package dependencies and OS-tasks:
+ __yaks-backup.py__ :: This daemon will take regular backups of my system using the attic python lib.
+ __yaks-apt-install.sh__ :: An automated system installation shell script for all new Debian/Ubuntu OS machines that installs the following developer stack: 
  * Vim, bash, tab completion, curl, git, GNU core utils, etc..
  * Atom, VirtualBox, Vagrant, Docker, etc..
  * _Database_: MySQL, PostgreSQL, SQLite, MongoDB, etc..
  * _Languages_: Each programming language as per requirement can be installed via individual scripts given below. 
+ __yaks-apt-firewall.sh__ :: A program firewall to secure the machine.
+ __yaks-apt-uninstall.sh__ :: An uninstall script (that should **not** be used if you dont know what it does).
+ __yaks-apt-update.sh__ :: This daemon automagically updates my Debian/Ubuntu OS.
+ __yaks-mail-todo.sh__ :: Mail the ToDo list.
+ __yaks-rpm-install.sh__ :: Shell script to automate the `.rpm` based OpenSuse system installation using the zypper cli tool.

These programs will install the programming language package dependencies:
+ __yakshara-gccpy-aptinstall.sh__ :: Installs the programming language dependencies for __C/C++, Fortran and the (scientific) Python__ developer stack - IPython Notebook, NumPy, Scipy, Pandas, Scikit-Learn, Matplotlib, etc.. 
+ __yakshara-julia-aptinstall.sh__ :: A script for the __Julia__ installation and build process.
+ __yakshara-julia-aptupdate.sh__ :: This script updates my __Julia__ installation - I use the _master build_, so __dont__ use this script if you are not comfortable with some breakage.
+ __yakshara-langs-aptinstall.sh__ :: Install programming language dependencies for __Go, R, Ruby, Java and JS__.


### 2. Folders
+ __~/yaksha/dockerfiles/__ :: My dockerfiles.
+ __~/yaksha/home/__ :: Home dotfiles and config folders for `.atom`, `.julia`, `.vim`, etc..
+ __~/yaksha/scripts/__ :: General scripts.

 [download]: https://github.com/svaksha/yaksha/archive/master.zip "download"

----

# COPYRIGHT & LICENSE
+ COPYRIGHT© 2005-Now [SVAKSHA](http://svaksha.com/pages/Bio) All Rights Reserved. Copyrights for code when referenced and/or attributed to other people and/or entities belongs to them as listed in the files. 
+ The __yaksha__ repository is licensed and distributed under the [AGPLv3 License](http://www.gnu.org/licenses/agpl-3.0.html) and ALL references, citations, copies and forks of this work must retain the Copyright, Licence (LICENSE.md file), this permission notice and attribute [credit](https://en.wikipedia.org/wiki/Creative_Commons_license#Attribution).

## Feedback
Any suggestions for improvements are [welcome](https://github.com/svaksha/yaksha/issues) via BR's !

