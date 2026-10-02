local tools = require("config.tools")

return {
    -- Mason for installing LSP servers
    {
        "mason-org/mason.nvim",
        lazy = false,
        build = ":MasonUpdate",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },

    -- Install formatter executables that are not managed by mason-lspconfig
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = "VeryLazy",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = tools.formatters,
            auto_update = false,
            run_on_start = true,
            start_delay = 3000,
            debounce_hours = 24,
        },
    },

    -- Lazily expose Neovim/plugin libraries to lua_ls
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },

    -- Mason-lspconfig bridge
    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = tools.servers,
            -- Do not start formatter LSPs (e.g. stylua) or unrelated installed servers.
            automatic_enable = tools.servers,
        },
    },

    -- LSP Config (provides bundled server configs + clangd commands)
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        dependencies = {
            "saghen/blink.cmp",
            {
                "antosha417/nvim-lsp-file-operations",
                dependencies = { "nvim-tree/nvim-tree.lua" },
                config = true,
            },
        },
        config = function()
            vim.api.nvim_create_user_command("LspLog", function()
                vim.cmd("tabnew " .. vim.fn.fnameescape(vim.lsp.log.get_filename()))
            end, { desc = "Open the LSP client log" })

            -- Diagnostic configuration
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "󰅚 ",
                        [vim.diagnostic.severity.WARN] = "󰀪 ",
                        [vim.diagnostic.severity.HINT] = "󰌶 ",
                        [vim.diagnostic.severity.INFO] = "󰋽 ",
                    },
                },
                virtual_text = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = true,
                },
            })

            -- Merge blink.cmp + lsp-file-operations capabilities globally
            -- blink.cmp already includes nvim defaults via get_lsp_capabilities()
            local capabilities = require("blink.cmp").get_lsp_capabilities(
                require("lsp-file-operations").default_capabilities()
            )

            vim.lsp.config("*", {
                capabilities = capabilities,
            })

            -- Use the standalone LikeC4 server available on PATH.
            vim.lsp.enable("likec4")
        end,
    },
}
