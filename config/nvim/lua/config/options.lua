-- Options configuration
local opt = vim.opt
local g = vim.g

------------------------------------------------------------
-- Leader key (must be set before lazy.nvim)
------------------------------------------------------------
g.mapleader = ","
g.maplocalleader = ","

------------------------------------------------------------
-- General
------------------------------------------------------------
opt.filetype.plugin = true
opt.filetype.indent = true

------------------------------------------------------------
-- UI
------------------------------------------------------------
opt.hlsearch = true
opt.expandtab = true          -- Use spaces instead of tabs
opt.hidden = true             -- Enable background buffers
opt.ignorecase = true         -- Ignore case
opt.joinspaces = false        -- No double spaces with join
opt.list = true               -- Show some invisible characters
opt.number = true             -- Show line numbers
opt.relativenumber = true     -- Relative line numbers
opt.scrolloff = 4             -- Lines of context
opt.shiftround = true         -- Round indent
opt.shiftwidth = 4            -- Size of an indent
opt.sidescrolloff = 8         -- Columns of context
opt.smartcase = true          -- Do not ignore case with capitals
opt.smartindent = true        -- Insert indents automatically
opt.splitbelow = true         -- Put new windows below current
opt.splitright = true         -- Put new windows right of current
opt.tabstop = 4               -- Number of spaces tabs count for
opt.termguicolors = true      -- True color support
opt.wrap = false              -- Disable line wrap
opt.cursorline = true         -- Cursor line highlight
opt.title = true
opt.clipboard = "unnamedplus"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.formatoptions:remove("o")

------------------------------------------------------------
-- Colors
------------------------------------------------------------
vim.cmd("syntax on")
opt.background = "dark"
opt.encoding = "utf8"

------------------------------------------------------------
-- Backups
------------------------------------------------------------
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.swapfile = false

------------------------------------------------------------
-- Performance
------------------------------------------------------------
opt.updatetime = 100
opt.signcolumn = "yes:1"

------------------------------------------------------------
-- Disable providers
------------------------------------------------------------
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
