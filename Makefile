################################################################################
# FILE       : Makefile
# DESCRIPTION: Makefile script.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://svaksha.github.io/yaksha
# COPYRIGHT© : 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATES      : 2016oct11-Present
################################################################################

all:
	@echo 'Initializing'
	@git submodule init
	@git submodule update
	@echo 'Setting up links'
	@ln -sf $(CURDIR)/vim/vimrc ~/.vimrc
	@ln -sf $(CURDIR)/tmux/tmux.conf ~/.tmux.conf
	@ln -nsf $(CURDIR)/ipython/ ~/.ipython
	@ln -sf $(CURDIR)/gitignore ~/.gitignore
	@git config --global core.excludesfile '~/.gitignore'
	@echo 'Installing vim plugins'

