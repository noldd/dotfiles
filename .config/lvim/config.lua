-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onenord"

-- Keymapping
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<Space>"] = "/"
lvim.keys.normal_mode["<Esc>"] = ":nohlsearch<CR>"
lvim.keys.normal_mode["<C-p>"] = ":Telescope git_files<CR>"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Enable emmet
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "emmet_ls"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- Formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- TODO: See if necessary
  { command = "prettier" },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "shellcheck" },
}

-- Additional Plugins
lvim.plugins = {
  { "rmehri01/onenord.nvim" },
  { "tpope/vim-surround" },
}

-- Debugger
-- lvim.builtin.dap = true

-- Relative line numbers
vim.opt.relativenumber = true

-- Disable mouse
vim.opt.mouse = ""

-- Disable moving lines with alt j and k (Messes with my tmux config)
-- The line swapping still works like that in visual mode, because it's kinda useful
lvim.keys.insert_mode["<A-j>"] = false
lvim.keys.insert_mode["<A-k>"] = false
lvim.keys.normal_mode["<A-j>"] = false
lvim.keys.normal_mode["<A-k>"] = false
