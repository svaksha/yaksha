# YAKSHA
__My personal automation daimons!__

Each time I installed and set up a new machine it was getting harder to remember every configuration setting I had customized in my old installation, the development environment I used, or the new versions of packages I had installed on the stable version of my Debian / Kubuntu / Opensuse machine over the years. Doing this manually was a huge time-sink and an error-prone process resulting in annoying discrepancies or worse, dependency-hell. 

Enter [YAKSHA][Yaksha.jl], meaning "demon" in Sanskrit, my personal automation daimons (daemons, if you like) for __Linux (Debian, Kubuntu, Opensuse) system installation, updation, backups, bash shell scripts, dockerfiles, dotfiles and configuration files__. Standardizing my development environment by automating the installation process and organizing the various developer tools was addictive fun!

__Change is the only constant in life__, so as a programmer I constantly experiment and try to improve the configurations and dotfiles as an attempt to keep optimizing the repo for ease of maintainence and extensibility. If you wish to experiment or use this repository code and these configs, follow the [installation](https://github.com/svaksha/yaksha#installation) instructions. But do remember that config files and dotfiles are meant to be personally customized for specific requirements, hence unique to an individual - my config files or program scripts may not be the out-of-the-box solution for your programming needs.

 [Yaksha.jl]: http://svaksha.github.io/Yaksha.jl "Yaksha"

# INSTALLATION 
To try out these program scripts & dotfiles, fork this repository, review the code, and remove the things you don’t require. Test them before use and most importantly, read the __License & Disclaimer__ : No warranty and/or guarantee for any particular use, express or implied and you agree to use these [automation daimons][yaksha] at your own risk and liability! 

## System Dependencies
At the outset, your Linux (Debian/Ubuntu) machine should have the following core tools installed : _Git and Python_. Github offers HTTPS and SSH as transfer protocols or the repo can be downloaded as a [zip-file][download] (latest 'master' branch). 

__Tip__: You should have uploaded your `ssh` key to github and have `git` installed locally before issuing the `git` commands on the terminal.

+ For SSH protocol use the URL `git@github.com:svaksha/Yaksha.jl.git` via the clone command:

```
git clone ssh://github.com/svaksha/Yaksha.jl.git
```
+ For HTTPS protocol use the URL `https://github.com/svaksha/Yaksha.jl.git` to clone/pull the repo locally.
+ After the repo is cloned into the `~/Yaksha.jl` folder, change directory with the command `cd Yaksha.jl` to run the scripts you need. My dotfiles are stored in `~/home` with symlinks.

The [Yaksha.jl][Yaksha.jl] repository tree for is structured as below: 

### 1. Programs

+ __yaksha.sh__ :: This daemon will be wired to run all the program scripts listed below automatically. {WIP, Not Recommended.}

### 2. Folders
+ __~/backup/__ :: Backup script using the attic python lib.
+ __~/debian__ : 
    + __apt-debian.sh__ :: An automated system installation shell script for all new Debian Jessie machines that installs the following developer stack: 
        * Atom, Vim, basher, tab completion, curl, git, GNU core utils, etc..
        * Anaconda, VirtualBox, Vagrant, Docker, etc..
        * {Database}: MySQL, PostgreSQL, SQLite, MongoDB, etc..
        * {Languages}: GCC, G++, Go, Python, Java, Javascript, R, Ruby, et al.
    + __vm-debian8.sh__ :: {WIP} The dependencies for a VM running debian-8 (jessie).
+ __~/docker/__ :: The dockerfiles are a WIP.
+ __~/etc/__ :: copy of the `sources.list` for apt.
+ __~/git/__ :: automate git ...
    + _git-extract-commits.sh_ :: git_extract_commits.sh for GSoC commits, Original gist, https://gist.github.com/xinan/42669b49153af52919b2
    + _gitlab-omni.sh_ :: Program to automatically check the OS and install the `gitlab` version.
    + _gitlab.sh_ :: Bash script to install the `gitlab` omnibus version. Use __gitlab-omni.sh__ instead.
    + _gitup.sh_ :: Automagically update all the local GIT repos.
+ __~/home/__ :: Home dotfiles and config folders for `bash`, `.julia`, `.vim`, etc..
+ __~/julia__ :
    + jl-colors-migrate.sh :: Prof.Tim Holy's script.
    + _julia-dev.sh_ :: This script installs __Julia__ and builds from the unstable master on github. {__Nota Bene__: I use the _master build_, so _dont_ use this script if you want stable Julia packages - some packages may have bugs and may not work with the unstable builds.}
    + _julia-stable.sh_ :: A script to install the generic Linux 64-bit binaries for Julia stable releases only. 
    + _julia-update.sh_ :: Updates and builds the julia unstable master installed via `julia-stable.sh`
+ __~/kernel/__ : Scripts for removing old kernels. 
+ __~/kubuntu__:: scripts for installing OS applications and the package dependencies, updates, etc..
+ __~/opensuse__ :
    + zyppr-opensuse.sh :: The shell script for RPM-based OpenSUSE packages.
+ __~/python__ :: 
    + anaconda3.sh :: Installs Anaconda3.
    + pypip.sh :: Bash script to install PYTHON packages using pip/pip3.
+ __~/ubuntu__::
    + apt-install.sh
    + apt-install-nonfree.sh
    + apt-remove-amazon.md
    + apt-update-ubuntu.sh

 [download]: https://github.com/svaksha/Yaksha.jl/archive/master.zip "download"

----

# COPYRIGHT & LICENSE
+ COPYRIGHT© 2005-Now [SVAKSHA](http://svaksha.com/pages/Bio) All Rights Reserved. Copyrights for code when referenced and/or attributed to other people and/or entities belongs to them as listed in the files. 
+ The [YAKSHA][Yaksha.jl] repository is licensed and distributed under the [AGPLv3 License](http://www.gnu.org/licenses/agpl-3.0.html) and ALL references, citations, copies and forks of this work must retain the Copyright, Licence (LICENSE.md file), this permission notice and attribute [credit](https://en.wikipedia.org/wiki/Creative_Commons_license#Attribution).

## Feedback
Any suggestions for improvements are [welcome](https://github.com/svaksha/Yaksha.jl/issues) via BR's !

