return {
    { "nvim-telescope/telescope.nvim" },
    { "romgrk/barbar.nvim" },
    { "chr4/nginx.vim" },
    { "aklt/plantuml-syntax" },
    { "lukas-reineke/indent-blankline.nvim" },
    { "hoob3rt/lualine.nvim" },
    { "kosayoda/nvim-lightbulb" },
    { "neovim/nvim-lspconfig" },
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            -- Add a space between comment and line
            padding = true,
            -- Whether the cursor should stay at its position
            sticky = true,
            -- LHS of toggle mappings in NORMAL mode
            toggler = {
                line = "<leader>cc",
                block = "<leader>bc",
            },
            -- LHS of operator-pending mappings in NORMAL and VISUAL mode
            opleader = {
                line = "<leader>c",
                block = "<leader>b",
            },
        },
    },
    { "windwp/nvim-autopairs" },
    { "stevearc/dressing.nvim", event = "VeryLazy" },
    -- lsp_signature.nvim removed: Neovim 0.11+ has built-in signature help (CTRL-S in insert mode)
}
