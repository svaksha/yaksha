"###############################################################################
" File       : .vimrc
" Description: Configuration file for Vi Improved, save as ~/.vimrc to use.
" AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha>
" COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
" Dates      : Created:2005nov05 - Updated:2015aug22 
" LICENSE    : GNU AGPLv3 License <http://www.gnu.org/licenses/agpl.html>
" Permission is hereby granted, free of charge, to any person obtaining a copy 
" of this software and associated documentation files (the "Software"), to deal 
" in the Software without restriction, including without limitation the rights 
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
" copies of the Software, and to permit persons to whom the Software is 
" furnished to do so, subject to the following conditions: ALL copies of this 
" work and repository forks must retain the Copyright, LICENSE(.md) notice and 
" this permission notice in substantial portions of the software. 
" See the [LICENSE.md](https://github.com/svaksha/yaksha/blob/master/LICENSE.md) file.
"###############################################################################
" NOTES : Borrowed code from the folks listed in the Credits section
" CREDITS: 
" http://dougblack.io/words/a-good-vimrc.html
" http://vim.wikia.com/wiki/Vim_Tips_Wiki
" http://askubuntu.com/questions/500315/need-good-example-of-vimrc-file
"===============================================================================


"-------------------------------------------------------------------------------
" use Vim mode instead of pure Vi, it must be the FIRST instruction
" This setting prevents vim from emulating the original vi's bugs and limitations.
"-------------------------------------------------------------------------------
set nocompatible

set viminfo=""
set updatecount=0
set visualbell
set ff=unix
set uc=0
set history=1001
" set autoindent shiftwidth=3
set foldmethod=syntax
" set foldclose=all
set foldlevel=1
if &t_Co > 1
   syntax on
endif
"

" Always start on first line of git commit message 
"-------------------------------------------------------------------------------
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])


" COLORS && syntax highlighting, Themes must be installed first
"-------------------------------------------------------------------------------
colorscheme badwolf        " colorscheme source, https://github.com/sjl/badwolf/
set background=dark        " dark background for console
syntax enable              " enable syntax highlighting/processing
" More themes
"colorscheme solarized     " https://github.com/altercation/Vim-colors-solarized 
"colorscheme molokai       " https://github.com/tomasr/molokai


" display settings 
"-------------------------------------------------------------------------------
set encoding=utf-8         " Set default encoding for files display to UTF-8.
set ruler                  " show the cursor position all the time
set showmode               " show insert/replace/visual mode
set number                 " show line numbers
set showmatch              " highlight matching braces [{()}]


" write settings
"-------------------------------------------------------------------------------
set confirm                " confirm :q in case of unsaved changes
set fileencoding=utf-8     " encoding used when saving file"
set nobackup               " do not keep the backup~ file"


"-------------------------------------------------------------------------------
" Reopen at last position
" :h last-position-jump
"-------------------------------------------------------------------------------
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

"-------------------------------------------------------------------------------
"  Taglist"
"-------------------------------------------------------------------------------
let tlist_foo_settings = 'foo;m:macros;t:types;v:array types;g:module variables;i:interfaces;r:routines'
"let tlist_foo_settings = 'foo;m:macro;a:attribute;i:interface;f:function;s:subroutine'
" 
let Tlist_Ctags_Cmd = '~/bin/ctags'
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 35
let Tlist_Enable_Fold_Column = 0
let Tlist_Exist_OnlyWindow = 1
let Tlist_Sort_Type = "order" " sort by order or name 
" let Tlist_Display_Prototype = 1
" let Tlist_Display_Tag_Scope = 0
nnoremap <silent> <F2> :TlistToggle<CR>
"

" edit settings
"-------------------------------------------------------------------------------
set backspace=indent,eol,start     " backspacing over everything in insert mode
set expandtab                      " fill tabs with spaces
set nojoinspaces                   " no extra space after '.' when joining lines
set shiftwidth=4                   " set indentation depth to 4 columns
set softtabstop=4                  " backspacing over 4 spaces like over tabs
set tabstop=4                      " set tabulator length to 4 columns, number of visual spaces per TAB
set textwidth=80                   " wrap lines automatically at 80th column

" search settings
"-------------------------------------------------------------------------------
set hlsearch                " highlight search result matches
set ignorecase              " do case insensitive search...
set incsearch               " do incremental search as characters are entered
set smartcase               " ...unless capital letters are used
set wildmenu                " visual autocomplete that provides a graphical menu of all the matches you can cycle through.

" file type specific settings
"-------------------------------------------------------------------------------
filetype on " enable file type detection
filetype plugin on " load the plugins for specific file types
filetype indent on " automatically indent code


" characters for displaying non-printable characters
set listchars=eol:$,tab:>-,trail:.,nbsp:_,extends:+,precedes:+

" tuning for gVim only
"-------------------------------------------------------------------------------
if has('gui_running')
        set background=light            " light background for GUI
        set columns=84 lines=48         " GUI window geometry
        set guifont=Courier 10 Pitch\ 12       " font for GUI window
        set number " show line numbers
endif

" automatic commands
"-------------------------------------------------------------------------------
if has('autocmd')
        " file type specific automatic commands

        " tuning textwidth for Java code
        autocmd FileType java setlocal textwidth=132
        if has('gui_running')
                autocmd FileType java setlocal columns=136
        endif

        " don't replace Tabs with spaces when editing makefiles
        autocmd Filetype makefile setlocal noexpandtab

        " disable automatic code indentation when editing TeX and XML files
        autocmd FileType tex,xml setlocal indentexpr=

        " clean-up commands that run automatically on write; use with caution

        " delete empty or whitespaces-only lines at the end of file
        autocmd BufWritePre * :%s/\(\s*\n\)\+\%$//ge

        " replace groups of empty or whitespaces-only lines with one empty line
        autocmd BufWritePre * :%s/\(\s*\n\)\{3,}/\r\r/ge

        " delete any trailing whitespaces
        autocmd BufWritePre * :%s/\s\+$//ge
endif


"-------------------------------------------------------------------------------
" general key mappings
"-------------------------------------------------------------------------------
" center view on the search result
noremap n nzz
noremap N Nzz

" press F4 to fix indentation in whole file; overwrites marker 'q' position
noremap <F4> mqggVG=`qzz
inoremap <F4> <Esc>mqggVG=`qzza

" press F5 to sort selection or paragraph
vnoremap <F5> :sort i<CR>
nnoremap <F5> Vip:sort i<CR>

" press F8 to turn the search results highlight off
noremap <F8> :nohl<CR>
inoremap <F8> <Esc>:nohl<CR>a

" press F12 to toggle showing the non-printable charactes
noremap <F12> :set list!<CR>
inoremap <F12> <Esc>:set list!<CR>a

