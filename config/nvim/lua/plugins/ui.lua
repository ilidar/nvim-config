return {
    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "gruvbox",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
        },
    },

    -- Buffer line / tabs
    {
        "romgrk/barbar.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "lewis6991/gitsigns.nvim",
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {
            animation = true,
            tabpages = true,
            clickable = true,
        },
    },

    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            filters = {
                dotfiles = false,
            },
            view = {
                width = 30,
                adaptive_size = true,
            },
        },
    },

    -- Better UI elements
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- Code action lightbulb
    {
        "kosayoda/nvim-lightbulb",
        event = "LspAttach",
        opts = {
            autocmd = { enabled = true },
        },
    },

    -- LSP progress indicator
    {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        opts = {},
    },
}
