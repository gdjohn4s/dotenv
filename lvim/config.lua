--   ____                                                       _       _
--  /  __    _       _______        ___                       _| |_  _ | |
-- |   \ \__| |_    |____   |_ _   /  /                      |_  __|| || |
-- |   /  __    \   ___/  _/|_|_| |  |___  __   ___________   / // \| || |
--    /  _\/ /\  | |___  _____|   |   _  \|  | |___________| /__  /_| || |
--    | |/ _/_/  |   /  /____     |  | |  |  |                / _/ /|_|| |
--    \___/  \__/    \_______|   /__/   \___/                /_/  / ___| |  |
--                                                            \_/\_\\____|  |
--                                                                     ____/

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.linespace = 4

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"

-- add your own keymapping
lvim.keys.normal_mode["bn"] = ":bn<cr>"
lvim.keys.normal_mode["bp"] = ":bp<cr>"
lvim.keys.normal_mode["bl"] = ":BufferKill<cr>"
lvim.keys.normal_mode["tl"] = ":Telescope<cr>"

-- todo-comments keymapping
lvim.keys.normal_mode["tt"] = ":TodoLocList<cr>"
-- get the current filename to open TodoLocList only on the file opened
vim.keymap.set('n', 'tc', function()
  local cwd_file_name = vim.fn.expand('%')
  local command = string.format(":TodoLocList cwd=%s", cwd_file_name);

  if not vim.cmd(command) then
    local error_msg = string.format("Error while opening file %s", cwd_file_name)
    error(error_msg, 1)
  end
end)

-- split screen keybindings
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"

-- toggle term keymap
lvim.keys.normal_mode["<C-s>"] = ":ToggleTerm size=15 direction=horizontal<CR>"

-- -- Change theme settings
lvim.colorscheme = "kanagawa"
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- lvim.colorscheme = "github_dark_dimmed"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  { "EdenEast/nightfox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "akinsho/toggleterm.nvim",    version = "*", config = true },
  { 'projekt0n/github-nvim-theme' },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    'stevearc/conform.nvim',
    opts = {},
  },
  { 'xiyaowong/transparent.nvim' },
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Todo comments setup
require 'todo-comments'.setup()

-- Pyright config
require 'lspconfig'.pyright.setup {
  on_attach = function(client, bufnr)
  end,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace"
      }
    }
  }
}
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Disable hover in favor of Pyright
  client.server_capabilities.hoverProvider = false
  -- Mappings.
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>F', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Configure `ruff-lsp`.
require('lspconfig').ruff_lsp.setup {
  on_attach = on_attach,
  init_options = {
    settings = {
      args = {},
    }
  }
}
-- Formatter Configuration
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact", "vue", "javascript", "python", "rust" },
  },
}

-- Conform prettier setup
local conform = require("conform")
conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "ruff" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
    rust = { "rust-analyzer" }
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

-- Set autocommand to format file on save using conform
vim.api.nvim_create_autocmd("BufWritePre", {
  -- pattern = { "*.ts", "*.tsx", "*.vue", "*.js", "*.py", "*.rs", "*.lua" },
  pattern = "*",
  callback = function(args)
    vim.lsp.buf.format({ bufnr = args.buf })
  end,
})

local function toggleTermOnStartup()
  local t_heigth = 15;
  local t_position = "horizontal";
  local command = ":ToggleTerm size=" + t_heigth + "direction=" + t_position + "<CR>";
  vim.cmd(command);
end

-- Overrides configurations

-- nvim tree configuration
lvim.builtin.nvimtree.setup.view.side = "right"
