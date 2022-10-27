" Set Variables
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set relativenumber
set ignorecase              " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set smartindent             " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set scrolloff=8
set mouse=a                 " enable mouse click
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set termguicolors
set backspace=indent,eol,start
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

let g:airline#extensions#tabline#enabled = 1
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" filetype
filetype plugin indent on   "allow auto-indenting depending on file type
filetype plugin on

" syntax
syntax on
