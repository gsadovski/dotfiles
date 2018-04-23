" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif
"
" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim
"
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif
"
if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif
"
" Only do this part when compiled with support for autocommands.
if has("autocmd")
"
" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
 au!
"
" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=100
"
 augroup END
"
else
"
set autoindent		" always set autoindenting on
"
endif " has("autocmd")
"
"" Add optional packages.
""
"" The matchit plugin makes the % command work better, but it is not backwards
"" compatible.
"" The ! means the package won't be loaded right away but when plugins are
"" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
" END OF DEFAULT CONTENT
"
" START OF GSADOVSKI THE CUSTOM CONTENT
" 
"START OF VIM-PLUG (PLUGINS MANAGER) SECTION
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'https://github.com/907th/vim-auto-save'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'
call plug#end()
"
"START OF PLUGINS SECTION
"
"VIM-AUTO-SAVE PLUGIN
"enable autosave on vim startup
let g:auto_save = 1
"do not display 'saved at hh:mm:ss' on status line on each autosave
"let g:auto_save_silent=1
"the events on which autosave will perform a save
let g:auto_save_events = ["TextChanged","TextChangedI"]
"ULTISNIPS PLUGIN
"Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"
"YOUCOMPLETEME PLUGIN
"When this option is set to 1, YCM will auto-close the preview window after
"the user accepts the offered completion string.
let g:ycm_autoclose_preview_window_after_completion = 1
"This option controls the key mappings used to select the first completion
"string. Invoking any of them repeatedly cycles forward through the completion
"list.
let g:ycm_key_list_select_completion = ['<Down>']
"keybind to cycle backwards through the completion list
let g:ycm_key_list_previous_completion = ['<Up>']
"search for the vim-snippets snippets
"let g:UltiSnipsSnippetDirectories="~/.vim/plugged/vim-snipplets"
"
" START OF MISC SECTION
" 
"enable filetype detection
filetype on
"enable filetype-specific indenting
filetype indent on
"enable filetype-specific plugins
filetype plugin on
"set to auto read when a file is changed from the outside
set autoread
"always show current cursor position as well as relative position (as per cent
"in status bar"
set ruler
"show matching brackets when text indicator is over them
set showmatch
"enable syntex hightlighting
syntax enable
"set uft8 as standard enconding and en_US as the standard language
set encoding=utf-8
"show partial commands in status line
set showcmd
"show line number lhs column
set number
