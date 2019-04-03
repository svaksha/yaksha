# YAKSHA
__My personal automation daimons, use at your own risk!__

The term [YAKSHA][yaksha], is used to refer to ["fairies", "demons" and "spirits"](https://en.wikipedia.org/wiki/Yaksha) in Sanskrit. This repo is my personal automation daimon for __*nix__ dev installation, updates, backups, bash scripts, dockerfiles, dotfiles and configuration files. 

The push towards automation began with my need for a standard development environment across multiple machines. Manual customization was time-consuming and error-prone - a big time-sink resulting in discrepancies with machines that worked differently or worse, dependency-hell. 

I am in the process of moving to the `ansible` IT automation tool which is an agent-less Env-agnostic tool that can manage all environments. I started using shell scripts but the older bash scripts are being retired, slowly. Porting things to `ansible` requires free-time, a short commodity. Hence, this repo will be a sandbox for my experiments that may be unstable, break stuff, etc.. DONT USE on a production server. 

The standard disclaimer applies: Read the __License & Disclaimer__ No warranty and/or guarantee for any particular use, express or implied and you use these [automation daimons][yaksha] at your own risk and liability!

 [yaksha]: http://svaksha.github.io/yaksha "yaksha"

# INSTALLATION 

1. At the outset, your Ubuntu machine should have _Ansible and Git_ intalled.

```
sudo apt-get update && sudo apt-get install ansible git
```

You can also use `pip` to install ansible but I prefer the apt package. Note that if you have a standalone machine this step is a manual process, else automated for the network install.

2. Now clone this repo and execute the scripts. For SSH, use the URL `git@github.com:svaksha/yaksha.git` via the clone command:

```
git clone ssh://github.com/svaksha/yaksha.git
```

Alternatively, Github offers HTTPS (replace the ssh with https in the above command) as transfer protocols or the repo can be downloaded as a [zip-file][download] (latest 'master' branch). 
 [download]: https://github.com/svaksha/yaksha/archive/master.zip "download"


3. Then, to install all the Ubuntu packages, run the ansible playbooks inside the Ubuntu folder. __NB:__ Note that `yaksha` is  not to be run on a production server.

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

