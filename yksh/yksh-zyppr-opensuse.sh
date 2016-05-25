#!/usr/bin/env bash
################################################################################
# FILE      : yaks-zyppr-opensuse.sh
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
+ https://github.com/svaksha/aksh/blob/master/cs-devops.md
+ https://github.com/svaksha/aksh/blob/master/cs-opensuse.md
#-------------------------------------------------------------------------------

yaksha_dir=~/yaksha/

# Log the date and time of execution of bash script into the `out` files.
date +'%c|started running `zypper`: ' >> out-yaks-zyppr-opensuse.log
date +"%c|completed running: $?" >> out-yaks-zyppr-opensuse.log


# Ask for the administrator password first.
sudo -v

# Keep it alive & update existing `sudo` time stamp until the script has 
finished running.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# KDE Desktop Environment.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function install_codecs() {
# http://opensuse-guide.org/codecs.php
    sudo zypper -y update
    sudo zypper -y install k3b-codecs ffmpeg lame phonon-backend-vlc phonon4qt5-backend-vlc vlc-codecs flash-player libdvdcss2
    sudo zypper -y remove phonon-backend-gstreamer phonon4qt5-backend-gstreamer
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

#-------------------------------------------------------------------------------
# Editors: markdown2PDF converter, document comparison tools, ....
#-------------------------------------------------------------------------------
function install_editors() {
    sudo zypper -y install kile #TeX Editor for KDE.
    sudo zypper -y install kompare #https://en.wikipedia.org/wiki/Kompare
    # Markdown to PDF conversion - JS tool (better than the py tool 'grip')
    sudo npm install -g markdown-pdf
    # Markdown to PDF conversion - Python tool
    sudo pip install grip
}

#-------------------------------------------------------------------------------
# LaTeX installation.
#-------------------------------------------------------------------------------
function install_latex() {
    sudo zypper -y update
    sudo zypper -y install latexml # TeX and LaTeX to XML/HTML/MathML converter
    sudo zypper -y install dblatex # DocBook to LaTeX Publishing
    sudo zypper -y install latexila # Integrated LaTeX Environment for the GNOME desktop
    sudo zypper -y install latex-pgf # Create PostScript and PDF graphics in TeX.
    sudo zypper -y install latex2rtf # LaTeX to RTF Converter
    sudo zypper -y install jlatexmath # Java API to display mathematical formulas written in LaTeX.
    sudo zypper -y install latex2html # LaTeX to HTML Converter 
    sudo zypper -y install gedit-latex # GEdit Plugin for Editing LaTeX Documents
    sudo zypper -y install latex-beamer # A LaTeX class for producing beamer presentations
    sudo zypper -y install texlive-latex # A TeX macro package that defines LaTeX
    sudo zypper -y install klatexformula # An easy-to-use graphical application for generating images from LaTeX equations
    sudo zypper -y install jaxodraw-latex # LaTeX style file axodraw4j.sty for documents generated with jaxodraw
    sudo zypper -y install texlive-latexmk # Fully automated LaTeX document generation
    sudo zypper -y install texlive-pslatex # Use PostScript fonts by default
    sudo zypper -y install texlive-latexmp #Interface for LaTeX-based typesetting in MetaPost
    sudo zypper -y install vim-plugin-latex # A rich set of tools for editing LaTeX
    sudo zypper -y install texlive-biblatex # Bibliographies in LaTeX using BibTeX for sorting only
    sudo zypper -y install ibus-table-latex   # Latex input method for IBus framework
    sudo zypper -y install texlive-latex4wp  # A LaTeX guide specifically designed for word processor users
    sudo zypper -y install texlive-ncclatex  # An extended general-purpose class
    sudo zypper -y install texlive-ocr-latex  # LaTeX support for ocr fonts
    sudo zypper -y install texlive-latexdiff   # Determine and mark up significant differences between latex files
    sudo zypper -y install texlive-latexpand   #Expand \input and \include in a LaTeX document
    sudo zypper -y install texlive-latex2man  # Translate LaTeX-based manual pages into Unix man format
    sudo zypper -y install fcitx-table-latex   # Latex table for Fcitx
    sudo zypper -y install texlive-latexdemo  # Demonstrate LaTeX code with its resulting output
    sudo zypper -y install texlive-fig4latex  # Management of figures for large LaTeX documents
    sudo zypper -y install perl-LaTeX-Encode ## encode characters for LaTeX formatting
    sudo zypper -y install gedit-plugin-latex # GEdit Plugin for Editing LaTeX Documents
    sudo zypper -y install texlive-cursolatex # A LaTeX tutorial
    sudo zypper -y install texlive-latexcheat # A LaTeX cheat sheet
    sudo zypper -y install texlive-cweb-latex   # A LaTeX version of CWEB
    sudo zypper -y install kde3-klatexformula  # A KDE Application to easily create an image from a LaTeX equation
    sudo zypper -y install texlive-wnri-latex # LaTeX support for wnri fonts
    sudo zypper -y install texlive-latexconfig  # Package latexconfig
    sudo zypper -y install texlive-latexindent  # Indent a LaTeX document, highlighting the programming structure
    sudo zypper -y install texlive-tufte-latex  # Document classes inspired by the work of Edward Tufte
    sudo zypper -y install texlive-epslatex-fr  # French version of "graphics in LaTeX".
    sudo zypper -y install texlive-duerer-latex # LaTeX support for the Duerer fonts
    sudo zypper -y install texlive-lualatex-doc  # A guide to use of LaTeX with LuaTeX
    sudo zypper -y install texlive-lualatex-math  # Fixes for mathematics-related LuaLaTeX issues
    sudo zypper -y install texlive-mylatexformat  # Build a format based on the preamble of a LaTeX file
    sudo zypper -y install texlive-apprends-latex  # Apprends LaTeX!
    sudo zypper -y install texlive-guide-to-latex  # Package guide-to-latex
    sudo zypper -y install texlive-first-latex-doc # A document for absolute LaTeX beginners
    sudo zypper -y install texlive-latexcourse-rug  # A LaTeX course book
    sudo zypper -y install python-matplotlib-latex # Allow rendering latex in python-matplotlib
    sudo zypper -y install texlive-amslatex-primer # Getting up and running with AMS-LaTeX
    sudo zypper -y install python3-matplotlib-latex # Allow rendering latex in python3-matplotlib
    sudo zypper -y install texlive-latexfileversion # Prints the version and date of a LaTeX class or style file
    sudo zypper -y install texlive-simplified-latex # A Simplified Introduction to LaTeX
    sudo zypper -y install texlive-cjk-latex-extras  # Extra fonts and scripts for CJK LaTeX
    sudo zypper -y install texlive-collection-latex # LaTeX fundamental packages
    sudo zypper -y install texlive-latexfileinfo-pkgs # A comparison of packages showing LaTeX file information
    sudo zypper -y install texlive-latex2e-help-texinfo  # Unoffical reference manual covering LaTeX2e
    sudo zypper -y install texlive-collection-latexextra # LaTeX additional packages
    sudo zypper -y install texlive-translation-biblatex-de # German translation of the documentation of biblatex
    sudo zypper -y install texlive-collection-latexrecommended  
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# uncomment this for a NEW system only
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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
    all)
        install_codecs
        install_editors
        install_latex
    ;;
    *)
        echo "Installation in progress, almost done!"
    esac
