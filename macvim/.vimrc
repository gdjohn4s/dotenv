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
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set termguicolors
let g:airline#extensions#tabline#enabled = 1

" Check if system OS is Darwin or Linux
if system('uname -s') == "Darwin\n"
    set clipboard=unnamed "OSX
else
    set clipboard=unnamedplus "Linux
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'preservim/nerdtree'
Plugin 'jaredgorski/spacecamp'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'sheerun/vim-polyglot'
Plugin 'honza/vim-snippets'
Plugin 'preservim/nerdcommenter'
Plugin 'mhinz/vim-startify'
Plugin 'junegunn/fzf.vim'
Plugin 'voldikss/vim-floaterm'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}
Plugin 'bluz71/vim-nightfly-guicolors'
Plugin 'tomasiser/vim-code-dark'
Plugin 'ayu-theme/ayu-vim'


" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
nnoremap <silent> <C-x> :NERDTreeToggle `pwd`<CR>

syntax on
set backspace=indent,eol,start
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" FloatTerm mapping
nmap <C-t> :FloatermNew<CR>
nmap <C-f> :FloatermKill<CR>
nmap <C-h> :Files<CR>

" Buffer Explorer Mapping
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

"colorscheme spacecamp
"colorscheme delek
"colorscheme iceberg
"colorscheme ayu
"colorscheme codedark
colorscheme gruvbox

" Remove Background
hi Normal guibg=NONE ctermbg=NONE


set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces
