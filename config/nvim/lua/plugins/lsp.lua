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
                "cmake",
                "texlab",
                "remark_ls",
            },
            automatic_enable = true,
        },
    },

    -- LSP Config (minimal - native configs in lsp/ folder)
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "saghen/blink.cmp",
            { "antosha417/nvim-lsp-file-operations", config = true },
        },
        config = function()
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

            local capabilities = vim.tbl_deep_extend(
                "force",
                vim.lsp.protocol.make_client_capabilities(),
                require("lsp-file-operations").default_capabilities()
            )

            -- Enable all LSP servers defined in lsp/ folder
            -- Neovim 0.11+ automatically loads configs from lsp/*.lua
            local servers = {
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
                "cmake",
                "texlab",
                "remark_ls",
            }

            for _, server in ipairs(servers) do
                vim.lsp.config(server, { capabilities = capabilities })
                vim.lsp.enable(server)
            end
        end,
    },
}
