""""""""""""""""""""""""""""""""""""""""""
"_)        _)  |            _)            
"  |  __ \   |  __|  \ \   /  |  __ `__ \  
"  |  |   |  |  |     \ \ /   |  |   |   | 
" _| _|  _| _| \__| _) \_/   _| _|  _|  _| 
""""""""""""""""""""""""""""""""""""""""""                    

" packer
lua require('plugins')

" General Configuration
source ~/.config/nvim/plug-config/variables.vim
source ~/.config/nvim/plug-config/mapping.vim
source ~/.config/nvim/plug-config/general.vim

" LSP Configuration
lua require('lsp-servers')
source ~/.config/nvim/plug-config/nvim-lsp.vim

" Lua Configuration file
"luafile ~/.config/nvim/lua-config/lsp-config.lua
luafile ~/.config/nvim/lua-config/cmp-config.lua


" ...

filetype plugin indent on    " required
nnoremap <silent> <C-x> :NERDTreeToggle `pwd`<CR>

" colorscheme
colorscheme tokyonight-night

" remove background
hi Normal guibg=NONE ctermbg=NONE

