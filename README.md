# YAKSHA

__My personal automation daimons :: use at your own risk!__

The term __YAKSHA__, is used to refer to ["fairies", "demons" and "spirits"](https://en.wikipedia.org/wiki/Yaksha) in Sanskrit. This repo is my personal automation daimon for cross-platform __*nix__ dev installation, updates, backups, bash scripts, dockerfiles, playbooks, dotfiles and configuration files. 

I turned towards automation in my quest for a standard development environment across multiple machines. Manual customization was time-consuming and error-prone, not to mention, a big time-sink that resulted in discrepancies with machines that worked differently, programs ran differently, broke unexpectedly or worse, dependency-hell. 

I used shell scripts to manage the `apt-get` install process for many years but these old bash scripts are being (slowly) retired. ATM, I am in the process of porting to use `ansible`, an agentless distro-agnostic tool to manage my dev environments. You can find this repo on [galaxy-ansible](https://galaxy.ansible.com/svaksha) too.

PS: The old shell/ bash scripts work, but are unsupported & unmaintained.

The standard disclaimer applies: Read the __License & Disclaimer__ No warranty and/or guarantee for any particular use, express or implied and YOU USE ALL CONTENTS IN YAKSHA AT YOUR OWN RISK AND LIABILITY!

# INSTALL

Installation processes have constantly evolved over the years, so there may be some legacy code that needs pruning or still needs to be ported to ansible. Hence, the constant [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) sandbox status may break your machine. 

Currently, the repository structure is:

* __/roles__: Splitting ansible playbooks for different tasks requires a [roles](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html) directory.

## Basic Installation Process

1. At the outset, your Ubuntu machine should have _Ansible and Git_ intalled.

```
sudo apt-get update && sudo apt-get install ansible git
```

You can also use `pip` to install ansible but I prefer the `apt-get` package. Note that if you have a standalone machine this step is a manual process, else automated for the network installation.

2. Now clone [this repo][https://github.com/svaksha/yaksha/]. For SSH, use the URL `git@github.com:svaksha/yaksha.git` via the clone command:

```
git clone ssh://github.com/svaksha/yaksha.git
```

Alternatively, Github offers HTTPS (replace the ssh with https in the above command) as transfer protocols or the repo can be downloaded as a [zip-file][https://github.com/svaksha/yaksha/archive/master.zip] (latest 'master' branch). 

3. Then, to run all the ansible playbooks sequentially, 'cd' into the directory and run the following commands in your terminal:

```
$ cd yaksha

$ ansible-playbook -b -K yaksha.yml
```

The above runs all the playbooks listed in the yaksha.yml` file. But, if you want to individually run specific playbooks, e.g. install only Ubuntu package-deps via apt-get, then run the ansible playbooks inside the /ubuntu folder, viz. 


```
ansible-playbook -b -K ubuntu/ansible-ubuntu.yaml
```


----

# COPYRIGHT & LICENSE
+ COPYRIGHT© 2005-Now [SVAKSHA](http://svaksha.com/pages/Bio). This repository is licensed and distributed under the [AGPLv3 License](http://www.gnu.org/licenses/agpl-3.0.html) and ALL references, citations, copies and forks of this work must retain the Copyright, Licence (LICENSE.md file), this permission notice and attribute [credit](https://en.wikipedia.org/wiki/Creative_Commons_license#Attribution). Copyrights for code when referenced, and/or attributed to other people, and/or entities, belongs to them as referenced within the repository. 

## Feedback
Any [suggestions for improvements are welcome](https://github.com/svaksha/yaksha/issues) via BR's !

## Reference Credits
List of references and a list of people (repo'S) that have inspired me to learn and improve my daemon programs over time. It is amazing how much one can learn from other peoples code so besides embedding links within the repository I wanted to share this credit list here: 

+ https://galaxy.ansible.com/docs/contributing/creating_role.html
+ https://github.com/cowboy/dotfiles/
+ https://github.com/mathiasbynens/dotfiles
+ https://github.com/Olical/dotfiles

