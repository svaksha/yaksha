#!/usr/bin/env bash
################################################################################
# FILE      : zyppr-opensuse.sh
# INFO.     : Bash automation script for the OpenSUSE installation with zypper.
# AUTHOR    : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE    : http://svaksha.github.io/yaksha
# COPYRIGHT©: 2005-Now SVAKSHA, All Rights Reserved.
# LICENSE   : GNU AGPLv3 subject to meeting all the terms in the LICENSE file,
#             https://github.com/svaksha/yaksha/blob/master/LICENSE.md
# DATE      : 2016jan18-Present
################################################################################
#
# References: 
# https://github.com/svaksha/aksh/blob/master/cs-devops.md
# https://github.com/svaksha/aksh/blob/master/cs-opensuse.md
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹

yaksha_dir=~/yaksha/yksh/

# Log the date and time of execution of bash script into the `out` files.
date +'%c|started running `zypper`: ' >> out-yksh-zyppr-opensuse.log
date +"%c|completed running: $?" >> out-yksh-zyppr-opensuse.log


# Ask for the administrator password first.
sudo -v

# Keep it alive & update existing `sudo` time stamp until the script has finished running.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# KDE Desktop Environment.
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_codecs() {
# http://opensuse-guide.org/codecs.php
    sudo zypper update
    sudo zypper install k3b-codecs ffmpeg lame phonon-backend-vlc phonon4qt5-backend-vlc vlc-codecs flash-player libdvdcss2
    sudo zypper remove phonon-backend-gstreamer phonon4qt5-backend-gstreamer
    sudo zypper install k3b-codecs ffmpeg lame phonon-backend-vlc phonon4qt5-backend-vlc vlc-codecs flash-player libdvdcss2
    # Time Tracker, https://github.com/TailorDev/Watson
    sudo pip install td-watson
    #---------------
    # Git toolkit : https://github.com/donnemartin/gitsome#installation
    #---------------
    sudo pip install gitsome # stable version from PyPI
    # pip3: Depending on your system, you might need to run pip3, possibly with the -H flag:
    #sudo -H pip3 install gitsome
    # Master from GitHub source with changes not yet pushed to PyPI:
    #sudo pip install git+https://github.com/donnemartin/gitsome.git
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# RUST LANGUAGE
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_rust() {
    sudo zypper install rust
    #------------------------------------------------
    # Cargo, Rust Package manager
    # http://software.opensuse.org/download.html?project=devel%3Alanguages%3Arust&package=cargo
    #------------------------------------------------
    sudo zypper addrepo http://download.opensuse.org/repositories/devel:languages:rust/openSUSE_Tumbleweed/devel:languages:rust.repo
    sudo zypper refresh
    sudo zypper install cargo
}



#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# Git, LibreOffice and Diff
# http://stackoverflow.com/questions/8795538/how-to-share-odt-doc-documents-over-git
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_databinary() {
    sudo zypper install odt2txt
    sudo zypper install oodiff
    
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# network shell 
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_network() {
    # VPN networks
    sudo zypper install openvpn
    sudo zypper install openconnect # Cisco Anyconnect
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# Editors: markdown2PDF converter, document comparison tools, ....
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_editors() {
    sudo zypper install kile #TeX Editor for KDE.
    sudo zypper install kompare #https://en.wikipedia.org/wiki/Kompare
    # Markdown to PDF conversion - JS tool (better than the py tool 'grip')
    sudo npm install -g markdown-pdf
    # Markdown to PDF conversion - Python tool
    sudo pip install grip
    #-----------------------------------------------------------
    ## Unified Modeling Language (UML) Tools 
    # http://askubuntu.com/questions/9405/what-uml-unified-modelling-language-tools-are-available
    #-----------------------------------------------------------
    sudo zypper install dia
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# LaTeX installation.
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
function install_latex() {
    sudo zypper update
    sudo zypper install latexml # TeX and LaTeX to XML/HTML/MathML converter
    sudo zypper install dblatex # DocBook to LaTeX Publishing
    sudo zypper install latexila # Integrated LaTeX Environment for the GNOME desktop
    sudo zypper install latex-pgf # Create PostScript and PDF graphics in TeX.
    sudo zypper install latex2rtf # LaTeX to RTF Converter
    sudo zypper install jlatexmath # Java API to display mathematical formulas written in LaTeX.
    sudo zypper install latex2html # LaTeX to HTML Converter 
    sudo zypper install gedit-latex # GEdit Plugin for Editing LaTeX Documents
    sudo zypper install latex-beamer # A LaTeX class for producing beamer presentations
    sudo zypper install texlive-latex # A TeX macro package that defines LaTeX
    sudo zypper install klatexformula # An easy-to-use graphical application for generating images from LaTeX equations
    sudo zypper install jaxodraw-latex # LaTeX style file axodraw4j.sty for documents generated with jaxodraw
    sudo zypper install texlive-latexmk # Fully automated LaTeX document generation
    sudo zypper install texlive-pslatex # Use PostScript fonts by default
    sudo zypper install texlive-latexmp #Interface for LaTeX-based typesetting in MetaPost
    sudo zypper install vim-plugin-latex # A rich set of tools for editing LaTeX
    sudo zypper install texlive-biblatex # Bibliographies in LaTeX using BibTeX for sorting only
    sudo zypper install ibus-table-latex   # Latex input method for IBus framework
    sudo zypper install texlive-latex4wp  # A LaTeX guide specifically designed for word processor users
    sudo zypper install texlive-ncclatex  # An extended general-purpose class
    sudo zypper install texlive-ocr-latex  # LaTeX support for ocr fonts
    sudo zypper install texlive-latexdiff   # Determine and mark up significant differences between latex files
    sudo zypper install texlive-latexpand   #Expand \input and \include in a LaTeX document
    sudo zypper install texlive-latex2man  # Translate LaTeX-based manual pages into Unix man format
    sudo zypper install fcitx-table-latex   # Latex table for Fcitx
    sudo zypper install texlive-latexdemo  # Demonstrate LaTeX code with its resulting output
    sudo zypper install texlive-fig4latex  # Management of figures for large LaTeX documents
    sudo zypper install perl-LaTeX-Encode ## encode characters for LaTeX formatting
    sudo zypper install gedit-plugin-latex # GEdit Plugin for Editing LaTeX Documents
    sudo zypper install texlive-cursolatex # A LaTeX tutorial
    sudo zypper install texlive-latexcheat # A LaTeX cheat sheet
    sudo zypper install texlive-cweb-latex   # A LaTeX version of CWEB
    sudo zypper install kde3-klatexformula  # A KDE Application to easily create an image from a LaTeX equation
    sudo zypper install texlive-wnri-latex # LaTeX support for wnri fonts
    sudo zypper install texlive-latexconfig  # Package latexconfig
    sudo zypper install texlive-latexindent  # Indent a LaTeX document, highlighting the programming structure
    sudo zypper install texlive-tufte-latex  # Document classes inspired by the work of Edward Tufte
    sudo zypper install texlive-epslatex-fr  # French version of "graphics in LaTeX".
    sudo zypper install texlive-duerer-latex # LaTeX support for the Duerer fonts
    sudo zypper install texlive-lualatex-doc  # A guide to use of LaTeX with LuaTeX
    sudo zypper install texlive-lualatex-math  # Fixes for mathematics-related LuaLaTeX issues
    sudo zypper install texlive-mylatexformat  # Build a format based on the preamble of a LaTeX file
    sudo zypper install texlive-apprends-latex  # Apprends LaTeX!
    sudo zypper install texlive-guide-to-latex  # Package guide-to-latex
    sudo zypper install texlive-first-latex-doc # A document for absolute LaTeX beginners
    sudo zypper install texlive-latexcourse-rug  # A LaTeX course book
    sudo zypper install python-matplotlib-latex # Allow rendering latex in python-matplotlib
    sudo zypper install texlive-amslatex-primer # Getting up and running with AMS-LaTeX
    sudo zypper install python3-matplotlib-latex # Allow rendering latex in python3-matplotlib
    sudo zypper install texlive-latexfileversion # Prints the version and date of a LaTeX class or style file
    sudo zypper install texlive-simplified-latex # A Simplified Introduction to LaTeX
    sudo zypper install texlive-cjk-latex-extras  # Extra fonts and scripts for CJK LaTeX
    sudo zypper install texlive-collection-latex # LaTeX fundamental packages
    sudo zypper install texlive-latexfileinfo-pkgs # A comparison of packages showing LaTeX file information
    sudo zypper install texlive-latex2e-help-texinfo  # Unoffical reference manual covering LaTeX2e
    sudo zypper install texlive-collection-latexextra # LaTeX additional packages
    sudo zypper install texlive-translation-biblatex-de # German translation of the documentation of biblatex
    sudo zypper install texlive-collection-latexrecommended  
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# uncomment this for a NEW system only
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
#git clone --recursive https://github.com/svaksha/yaksha ${yaksha_dir}

case $install_codecs in
    codecs)
        install_codecs
    ;;
    editors)
        install_editors
    ;;
    latex)
        install_latex
	;;
    rust)
        install_rust
    ;;
	network)
	    install_network
    ;;
    all)
        install_codecs
        install_editors
        install_latex
        install_rust
        install_network
    ;;
    *)
        echo "OpenSUSE package installation in progress, almost done!"
    esac
