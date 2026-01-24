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

            -- LSP keymaps on attach
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
                callback = function(ev)
                    local opts = { buffer = ev.buf, silent = true }
                    local map = vim.keymap.set

                    map("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
                    map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", vim.tbl_extend("force", opts, { desc = "Go to definition" }))
                    map("n", "gr", "<cmd>Telescope lsp_references<CR>", vim.tbl_extend("force", opts, { desc = "Show references" }))
                    map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", vim.tbl_extend("force", opts, { desc = "Show implementations" }))
                    map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", vim.tbl_extend("force", opts, { desc = "Type definition" }))
                    map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
                    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
                    map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
                    map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", vim.tbl_extend("force", opts, { desc = "Buffer diagnostics" }))
                    map("n", "<leader>d", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Line diagnostics" }))
                    map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
                    map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
                    map("n", "<leader>rs", ":LspRestart<CR>", vim.tbl_extend("force", opts, { desc = "Restart LSP" }))
                end,
            })

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
