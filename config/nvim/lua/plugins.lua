--[[ require("plugins.nvim-tree")
require("plugins.nvim-lspconfig")
require("plugins.nvim-lightbulb")
require("plugins.nvim-cmp")
require("plugins.nvim-dap")
require("plugins.nvim-dap-ui")
require("plugins.nvim-tree")
require("plugins.nvim-tmux-navigation")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.neoformat")
require("plugins.lspkind")
require("plugins.treesitter")
require("plugins.registers")
require("plugins.lspsaga")
require("plugins.symbols-outline")
require("plugins.indent-blankline")
require("plugins.copilot")

require("nvim-autopairs").setup()
require("trouble").setup()
require("lsp_signature").setup() ]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

--[[ -- Plugin specification
require("lazy").setup({
  -- LSP and Treesitter
  { "neovim/nvim-lspconfig" },
  { "nvim-treesitter/nvim-treesitter" },
  { "kosayoda/nvim-lightbulb" },

  -- Completion plugins
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/vim-vsnip" },

  -- UI plugins
  { "kyazdani42/nvim-web-devicons" },
  { "kyazdani42/nvim-tree.lua" },
  { "hoob3rt/lualine.nvim" },
  { "romgrk/barbar.nvim" },
  { "folke/trouble.nvim" },
  { "simrat39/symbols-outline.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "zbirenbaum/copilot.lua" },

  -- Utility plugins
  { "windwp/nvim-autopairs" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "rktjmp/lush.nvim" },
  { "npxbr/gruvbox.nvim" },
  { "lewis6991/gitsigns.nvim" },
  { "sbdchd/neoformat" },
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui" },
  { "b3nj5m1n/kommentary" },
  { "ray-x/lsp_signature.nvim" },
  { "tversteeg/registers.nvim" },
  { "onsails/lspkind-nvim" },
  { "rafamadriz/friendly-snippets" },
  { "sakhnik/nvim-gdb" },
  { "alexghergh/nvim-tmux-navigation" },
  { "ilidar/git-tree.nvim" },
  { "chr4/nginx.vim" },
  { "editorconfig/editorconfig-vim" },
  { "aklt/plantuml-syntax" },
  { "glepnir/lspsaga.nvim" },
  { "nvim-neotest/nvim-nio" },
}) ]]


-- Plugin specification
require("lazy").setup({
  -- Plugins with their respective configuration files
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require('plugins.copilot')
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require('plugins.nvim-tree')
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require('plugins.nvim-lspconfig')
    end,
  },
  {
    "kosayoda/nvim-lightbulb",
    config = function()
      require('plugins.nvim-lightbulb')
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require('plugins.nvim-cmp')
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require('plugins.nvim-dap')
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require('plugins.nvim-dap-ui')
    end,
  },
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      require('plugins.nvim-tmux-navigation')
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('plugins.gitsigns')
    end,
  },
  {
    "hoob3rt/lualine.nvim",
    config = function()
      require('plugins.lualine')
    end,
  },
  {
    "sbdchd/neoformat",
    config = function()
      require('plugins.neoformat')
    end,
  },
  {
    "onsails/lspkind-nvim",
    config = function()
      require('plugins.lspkind')
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require('plugins.treesitter')
    end,
  },
  {
    "tversteeg/registers.nvim",
    config = function()
      require('plugins.registers')
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    config = function()
      require('plugins.lspsaga')
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('plugins.symbols-outline')
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require('plugins.indent-blankline')
    end,
  },

  -- Plugins with simple setup calls
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup()
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup()
    end,
  },

  -- Other plugins (examples)
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "rktjmp/lush.nvim" },
  { "npxbr/gruvbox.nvim" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/vim-vsnip" },
  { "kyazdani42/nvim-web-devicons" },
  { "romgrk/barbar.nvim" },
  { "rafamadriz/friendly-snippets" },
  { "sakhnik/nvim-gdb" },
  { "ilidar/git-tree.nvim" },
  { "chr4/nginx.vim" },
  { "editorconfig/editorconfig-vim" },
  { "aklt/plantuml-syntax" },
  { "nvim-neotest/nvim-nio" },
})
