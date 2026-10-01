return {
    -- Tmux navigation
    {
        "alexghergh/nvim-tmux-navigation",
        event = "VeryLazy",
        opts = {
            disable_when_zoomed = true,
            keybindings = {
                left = "<C-S-h>",
                down = "<C-S-j>",
                up = "<C-S-k>",
                right = "<C-S-l>",
            },
        },
    },

    -- Syntax plugins
    { "chr4/nginx.vim", ft = "nginx" },
    { "aklt/plantuml-syntax", ft = "plantuml" },
    {
        "likec4/likec4.nvim",
        ft = "likec4",
        build = "npm install -g @likec4/lsp",
        init = function()
            vim.filetype.add({
                extension = {
                    c4 = "likec4",
                    likec4 = "likec4",
                },
            })
        end,
        config = function()
            -- Use the standalone server instead of the plugin's default LikeC4 CLI.
            vim.lsp.config("likec4", {
                cmd = { "likec4-lsp", "--stdio" },
            })
        end,
    },

    -- Git signs
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },
}
