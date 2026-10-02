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
    { "chr4/nginx.vim", branch = "main", ft = "nginx" },
    { "aklt/plantuml-syntax", ft = "plantuml" },

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
