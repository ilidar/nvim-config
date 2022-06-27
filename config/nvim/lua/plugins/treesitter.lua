require("nvim-treesitter.configs").setup({
    ensure_installed = { "python", "cpp", "lua", "vim" },
    highlight = { enable = true },
    indent = { enable = true },
})
