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

    -- Mason-lspconfig bridge
    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "lua_ls",
                "bashls",
                "pyright",
                "rust_analyzer",
                "ts_ls",
                "cssls",
                "html",
                "yamlls",
                "dockerls",
                "clangd",
                "texlab",
                "remark_ls",
                "gopls",
            },
            automatic_enable = true,
        },
    },

    -- LSP Config (provides bundled server configs + clangd commands)
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        dependencies = {
            "saghen/blink.cmp",
            { "antosha417/nvim-lsp-file-operations", config = true },
        },
        config = function()
            vim.api.nvim_create_user_command("LspLog", function()
                vim.cmd("tabnew " .. vim.lsp.log.get_filename())
            end, { desc = "Opens the LSP client log" })

            -- Diagnostic configuration
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.HINT] = "󰠠 ",
                        [vim.diagnostic.severity.INFO] = " ",
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

            vim.lsp.config('*', {
                capabilities = capabilities,
            })
        end,
    },
}
