return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    lazy = false,
    opts = {
        ensure_installed = {
            "json",
            "yaml",
            "html",
            "markdown",
            "markdown_inline",
            "bash",
            "lua",
            "vim",
            "vimdoc",
            "dockerfile",
            "gitignore",
            "c",
            "cpp",
            "python",
            "rust",
            "typescript",
            "javascript",
            "css",
        },
        highlight = { enable = true },
        indent = { enable = true },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
