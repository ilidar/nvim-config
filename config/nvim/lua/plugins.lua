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

require("lazy").setup("plugin_cfg")

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

