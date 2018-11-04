# YAKSHA
__My personal automation daimons!__

Each time I installed and set up a new machine it was time-consuming to speculate the configuration setting I had customized in the old machine running (either Debian/ (K)Ubuntu/ Opensuse), the development environment stack I had used, or guess the new version numbers for packages I had previously installed or used and updated. Doing this manually was an error-prone process, a huge time-sink that resulted in annoying discrepancies, machines that worked differently than the one I was used to, or worse, dependency-hell. 

Enter [YAKSHA][yaksha], meaning "demon" in Sanskrit, my personal automation daimons (daemons, if you like) for __Ubuntu-Linux (stopped maintaining the Debian, Kubuntu & Opensuse ver.) system installation, updation, backups, bash shell scripts, dockerfiles, dotfiles and configuration files__. Standardizing my development environment by automating the installation process and organizing the various developer tools helps me understand my machine and its fun!

__Change is the only constant in life__ and my constant experiments with these programs while trying to improve the configurations and dotfiles or optimizing the repo for ease of maintainence and extensibility, may leave some scripts in broken state. If you wish to experiment or use this repository code and these configs, follow the [installation](https://github.com/svaksha/yaksha#installation) instructions and if something broke or didnt work as expected, file a [bug report](https://github.com/svaksha/yaksha/issues) and help me improve it. But do remember that config files are meant to be personal customization, hence unique to each user and my program customizations may not be the perfect solution for your computing needs.

 [yaksha]: http://svaksha.github.io/yaksha "yaksha"

# INSTALLATION 
You can fork this repository and change things as per your requirements but before you clone and randomly run these program scripts & overwrite your dotfiles, read the [yaksha-manifesto] document in the docs folder. I often change things and the repo can be in an experimental development state (read, unstable and unusable, definitely not meant for production server use) so you use this repository contents at your own risk. 

Finally, the standard disclaimer applies here: Read the __License & Disclaimer__ : No warranty and/or guarantee for any particular use, express or implied and you agree to use these [automation daimons][yaksha] at your own risk and liability!  


## System Dependencies
At the outset, your Linux (Debian/Ubuntu) machine should have the following core tools installed : _Git and Python_. Github offers HTTPS and SSH as transfer protocols or the repo can be downloaded as a [zip-file][download] (latest 'master' branch). 

__Tip__: You should have uploaded your `ssh` key to github and have `git` installed locally before issuing the `git` commands on the terminal.

+ For SSH protocol use the URL `git@github.com:svaksha/yaksha.git` via the clone command:


```
git clone ssh://github.com/svaksha/yaksha.git
```

+ For HTTPS protocol use the URL `https://github.com/svaksha/yaksha.git` to clone/pull the repo locally.
+ After the repo is cloned into the `~/yaksha` folder, change directory with the command `cd yaksha` to run the scripts you need. My dotfiles are stored in `~/home` with symlinks.


The [Manifesto](https://github.com/svaksha/yaksha/blob/master/docs/yaksha-manifesto.md) page includes documentation that describes this repository tree structure and the ultimate goal is to implement them and complete all the TODO features.


 [download]: https://github.com/svaksha/yaksha/archive/master.zip "download"

----

# COPYRIGHT & LICENSE
+ COPYRIGHT© 2005-Now [SVAKSHA](http://svaksha.com/pages/Bio). This repository is licensed and distributed under the [AGPLv3 License](http://www.gnu.org/licenses/agpl-3.0.html) and ALL references, citations, copies and forks of this work must retain the Copyright, Licence (LICENSE.md file), this permission notice and attribute [credit](https://en.wikipedia.org/wiki/Creative_Commons_license#Attribution). Copyrights for code when referenced, and/or attributed to other people, and/or entities, belongs to them as referenced within the repository. 

## Feedback
Any suggestions for improvements are [welcome](https://github.com/svaksha/yaksha/issues) via BR's !

## Credits
This is a list of people (repo'S) that have inspired me to learn and improve my daemon programs over time. It is amazing how much one can learn from other peoples code so besides embedding links within the repository I wanted to share this credit list here: 

+ https://github.com/cowboy/dotfiles/
+ https://github.com/mathiasbynens/dotfiles
+ https://github.com/Olical/dotfiles

