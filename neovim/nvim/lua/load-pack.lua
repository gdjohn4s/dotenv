packer = require 'packer'
packer.init {
    opt_default = false, -- Default to using opt (as opposed to start) plugins
    display = {
    non_interactive = false, -- If true, disable display windows for all operations
    compact = false, -- If true, fold updates results by default
    open_fn  = nil, -- An optional function to open a window for packer's display
    open_cmd = '65vnew \\[packer\\]', -- An optional command to open a window for packer's display
    working_sym = '⟳', -- The symbol for a plugin being installed/updated
    error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
    done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
    removed_sym = '-', -- The symbol for an unused plugin which was removed
    moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
    header_sym = '━', -- The symbol for the header line in packer's display
    show_all_info = true, -- Should packer show all update details automatically?
    prompt_border = 'double', -- Border style of prompt popups.
    keybindings = { -- Keybindings for the display window
      quit = 'q',
      toggle_update = 'u', -- only in preview
      continue = 'c', -- only in preview
      toggle_info = '<CR>',
      diff = 'd',
      prompt_revert = 'r',
    }
}

local use = packer.use
packer.reset()

packer.startup(function()

    " used Bundle instead of use)
    use 'preservim/nerdtree'
    use 'jaredgorski/spacecamp'
    use 'jiangmiao/auto-pairs'
    use 'vim-airline/vim-airline'
    use 'sheerun/vim-polyglot'
    use 'honza/vim-snippets'
    use 'preservim/nerdcommenter'
    use 'mhinz/vim-startify'
    use 'junegunn/fzf.vim'
    use 'voldikss/vim-floaterm'
    use 'junegunn/fzf', { 'do': { -> fzf#install() } }
    use 'mg979/vim-visual-multi', {'branch': 'master'}
    use 'bluz71/vim-nightfly-guicolors'
    use 'tomasiser/vim-code-dark'
    use 'ayu-theme/ayu-vim'
    use 'folke/tokyonight.nvim', { 'branch': 'main' }
    use 'luochen1990/rainbow'
    use 'neovim/nvim-lspconfig'

    " Compe
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

end)

