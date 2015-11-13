# yaksha - my personal automation daimons!

My personal automation daemons for system installation/ updation/ backups, bash shell scripts, dockerfiles, dotfiles and configuration files that are customized for my Linux box. 

**Standard Disclaimer & Warning** : No warranty and/or guarantee for any particular use, express or implied and you agree to use [these automation daimons](http://svaksha.github.io/yaksha) at your own risk and liability! 

## Index

### Installation 
If you want to try out these programs and dotfiles, you can fork this repository, review the code, and remove the things you don’t require. Test them before using at your own risk - The Standard Disclaimer & Warning applies here! 

1. Clone the repository with the command:
```git clone https://github.com/svaksha/yaksha.git && cd yaksha
2. I like to keep them in the `~/yaksha` folder, with the home dotfiles in`~/home` with symlinks. Then, run the scripts you need.

The `yaksha` repo contains the following folders & programs, here is a short description:

#### Programs
+ `yaksha-deb-backup.py` :: This daemon will take regular backups of my system using the attic python lib.
+ `yaksha-deb-install.sh` :: Automated system installation shell script for a new debian/ubuntu machine.
+ `yaksha-deb-uninstall.sh` :: An uninstall script (that should **not** be used if you dont know what it does).
+ `yaksha-deb-update.sh` :: This daemon automagically updates my OS.
+ `yaksha-jl-install.sh` :: A script for the Julia installation and build process.
+ `yaksha-jl-update.sh` :: This script updates my Julia installation.

#### Folders
+ `~/yaksha/dockerfiles/` :: My dockerfiles.
+ `~/yaksha/home/` :: Home dotfiles and folders for `.atom`, ``.julia`, `.vim`, ..
+ `~/yaksha/scripts/` :: General scripts.

## ToDo
+ @[holman](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/) talks about keeping dotfiles lean. Learn how they do it: [rtomayko](https://github.com/rtomayko/dotfiles), [holman](https://github.com/holman/dotfiles), .....
+ Cleanup my bash programs - [BASH best practices](https://github.com/progrium/bashstyle).
+ https://github.com/mathiasbynens/dotfiles

----

# Copyright & License
+ COPYRIGHT© 2005-Now [SVAKSHA](http://svaksha.com/pages/Bio) All Rights Reserved. Code and Copyrights when referenced and/or attributed to other people and/or entities belongs to them as listed in the files. 
+ The __`yaksha`__ repository is licensed and distributed under the [AGPLv3 License](http://www.gnu.org/licenses/agpl-3.0.html) and ALL references, citations, copies and forks of this work must retain the Copyright, Licence (LICENSE.md file), this permission notice and attribute [credit](https://en.wikipedia.org/wiki/Creative_Commons_license#Attribution).

## Feedback

Any suggestions for improvements are [welcome](https://github.com/svaksha/yaksha/issues) !

