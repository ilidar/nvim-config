return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "j-hui/fidget.nvim",
    },
    opts = {
        strategies = {
            chat = {
                adapter = "openai",
                model = "gpt-4.1",
            },
            inline = {
                adapter = "openai",
                model = "gpt-4.1",
            },
        },
        log_level = "DEBUG",
        display = {
            diff = {
                enabled = true,
                close_chat_at = 240,
                layout = "vertical",
                opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
                provider = "mini_diff",
            },
        },
    },
}
