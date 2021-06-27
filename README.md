# YAKSHA

The term __YAKSHA__, is used to refer to ["fairies", "demons" and "spirits"](https://en.wikipedia.org/wiki/Yaksha) in Sanskrit; i.e. my automated daemons to save me from mundane [Yak-Sha](https://en.wiktionary.org/wiki/yak_shaving)ving the OS with DEVEL installation & management that should "just work", irrespective of cross-platform __*nix__ OS, with multiple programming languages, updates, backups, bash scripts, dockerfiles, playbooks, dotfiles and configuration files!

Ofcourse, automating my development environment across multiple machines helps me keep track of packages, dep-hell and redundancy; unlike manual customization that was not only time-consuming but error-prone too. Wrestling with my OS was a huge time-sink that resulted in discrepancies with machines that worked differently, programs ran differently or broke unexpectedly and worse, dependency-hell. Hours wasted on a kaput OS can be very frustrating! 

Initially, I had started with bash-shell scripts to manage the `apt-get` install process but over the years there are newer devops methods, so its time to port these bash scripts and (slowly?) retire them. I am in the process of porting some parts of the installation to manage my dev environments to `ansible`, an agentless distro-agnostic tool. You can find this repo on [galaxy-ansible](https://galaxy.ansible.com/svaksha) too. __PS__: The old shell/ bash scripts work, but are unsupported & unmaintained. Eg. many packages changed between Ubuntu 18.04 and 20.04 LTS, so was impractical to maintain individual scripts for multiple OS'es.

The standard disclaimer applies: Read the __License & Disclaimer__ No warranty and/or guarantee for any particular use, express or implied and YOU USE ALL CONTENTS IN YAKSHA AT YOUR OWN RISK AND LIABILITY!


+ [INSTALL](#install)
   + [DEV Installation-Bash](#dev-installation-bash) 
   + [DEV Installation-Ansible](#dev-installation-ansible)
+ [COPYRIGHT-LICENSE](#copyright-license)
   + [Contribute-Feedback](#contribute-feedback)
   + [Stargazers](#stargazers)
   + [References](#references)
        
        
----

# INSTALL

Installation processes have constantly evolved over the years, so there may be some legacy code that needs pruning or still needs to be ported to ansible. Hence, the constant [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) sandbox status may break your dev machine (__NB__: currently used for all my DEV machines, not tested for production servers). 

## DEV Installation-Bash

If you have NOT set the PATH environment variable for running Bash scripts from anywhere on your system, then:


```
$ cd yaksha/ubuntu    #change directory into the ubuntu dir in the yaksha repo.

$ chmod +x /yaksha/ubuntu/apt-install.sh   # give it executable perms, if not already given.
 
```

Since `.` refers to the current directory and as `apt-install.sh` in the current directory, you can easily run it with:

```
$ ./apt-install.sh  

```

## DEV Installation-Ansible

1. At the outset, your Ubuntu machine should have _Ansible and Git_ intalled.

```
sudo apt update && sudo apt install ansible git
```

You can also use `pip` to install ansible but I prefer the `apt-get` package. Note that if you have a standalone machine this step is a manual process, else automated for the network installation.

2. Then, clone [Yaksha](https://github.com/svaksha/yaksha/). For SSH, use the URL `git@github.com:svaksha/yaksha.git` via the clone command:

```
git clone ssh://github.com/svaksha/yaksha.git
```

Alternatively, Github offers HTTPS (replace the ssh with https in the above command) as transfer protocols and the repo can be downloaded as a [zip-file](https://github.com/svaksha/yaksha/archive/master.zip) (latest 'master' branch). 

3. Then, to run all the ansible playbooks sequentially, run the following commands in your terminal:

```
$ cd yaksha    # change directory into yaksha

$ ansible-playbook -b -C -K -v yaksha.yaml    # runs all Playbooks.

```

The above command runs all the playbooks listed in the `yaksha.yaml` file. However, if you want to individually run specific playbooks, e.g. install only Ubuntu package-deps via apt, then run the ansible playbooks inside the /ubuntu folder, with a specific command, e.g.: 


```
ansible-playbook -b -K ubuntu/ansible-imaging.yaml   # install packages for OCR and imaging tasks.
```


__Install Python3 scientific packages (via pip3) using ansible__

The Python package (PyPI) installation deserves a longer rant, especially for Data Science. Pip3 is nice, but Anaconda (& no-frills miniconda) came by so now DS/ scientific python has multiple dep-installation methods, via 'apt' or 'pip/pip3' or 'conda' or the timeless 'source' installation. IMPO, while Conda made it easier to install all the scientific AI/ML packages it is its own beast with tons of unnecessary "pre-packaged" packages that I dont need. It works as a parallel PKG manager system to pip3, but for DS, but I have some qualms about 'an OS inside an OS' that only handles packages of ONE programming language and wonder if I need the extra packages. Why isnt dep hell as simple as Julia? TL;DR, I will stick to 'apt + pip3' here:

```
ansible-playbook -b -K python/main.yaml
```

----


# COPYRIGHT-LICENSE

+ COPYRIGHT© 2005-Now SVAKSHA. This repository is licensed and distributed under the [AGPLv3 License](http://www.gnu.org/licenses/agpl-3.0.html) and ALL references, citations, copies and forks of this work must retain the Copyright, Licence (LICENSE.md file), this permission notice and attribute [credit](https://en.wikipedia.org/wiki/Creative_Commons_license#Attribution). Copyrights for code when referenced, and/or attributed to other people, repos and/or entities, belongs to them as licensed by them. 


## Contribute-Feedback
All feedback and suggestions for improvements are welcome [via BR's](https://github.com/svaksha/yaksha/issues)!

## Stargazers
[![Stargazers over time](https://starchart.cc/svaksha/yaksha.svg)](https://starchart.cc/svaksha/yaksha)
   
   
## References
List of references and a list of people (repo'S) that have inspired me to learn and improve `Yaksha` over time. It is amazing how much one can learn from other peoples code so lets share the credits: 

+ https://galaxy.ansible.com/docs/contributing/creating_role.html
+ https://github.com/cowboy/dotfiles/
+ https://github.com/mathiasbynens/dotfiles
+ https://github.com/Olical/dotfiles
+ Ansibilized fork for Miniconda: https://github.com/dockpack/base_miniconda
+ MIT licenced [ansible-anaconda](https://github.com/andrewrothstein/ansible-anaconda) repo.

