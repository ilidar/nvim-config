require("nvim-treesitter.configs").setup({
    ensure_installed = { "python", "cpp", "lua", "vim" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
})
