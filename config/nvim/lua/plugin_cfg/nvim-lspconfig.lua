return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "saghen/blink.cmp",
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local keymap = vim.keymap

        -- Keymap setup function
        local function setup_keymaps(bufnr)
            local opts = { buffer = bufnr, silent = true }

            local keymaps = {
                -- Note: Neovim 0.11+ has default LSP keymaps (grn, gra, grr, gri)
                -- These custom mappings use different keys to avoid conflicts
                { "n", "gr", "<cmd>Telescope lsp_references<CR>", "Show LSP references" },
                { "n", "gD", vim.lsp.buf.declaration, "Go to declaration" },
                { "n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions" },
                { "n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations" },
                { "n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions" },
                { { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "See available code actions" },
                { "n", "<leader>rn", vim.lsp.buf.rename, "Smart rename" },
                { "n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics" },
                { "n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics" },
                { "n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, "Go to previous diagnostic" },
                { "n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, "Go to next diagnostic" },
                { "n", "K", vim.lsp.buf.hover, "Show documentation for what is under cursor" },
                { "n", "<leader>rs", ":LspRestart<CR>", "Restart LSP" },
            }

            for _, map in ipairs(keymaps) do
                local mode, lhs, rhs, desc = unpack(map)
                opts.desc = desc
                keymap.set(mode, lhs, rhs, opts)
            end
        end

        -- Create autocommand for setting up keymaps when LSP attaches
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                setup_keymaps(ev.buf)
            end,
        })

        -- Get capabilities from blink.cmp
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- Diagnostic configuration (Neovim 0.11+ style)
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

        -- LSP server configurations
        -- These servers will be auto-installed by mason-lspconfig
        local servers = {
            bashls = {},
            cmake = {},
            dockerls = {},
            remark_ls = {},
            pyright = {},
            rust_analyzer = {},
            ts_ls = {},
            cssls = {},
            yamlls = {},
            texlab = {},
        }

        for server, config in pairs(servers) do
            config.capabilities = capabilities
            lspconfig[server].setup(config)
        end

        -- Clangd with special offset encoding
        lspconfig.clangd.setup({
            capabilities = vim.tbl_extend("keep", capabilities, {
                offsetEncoding = { "utf-16" },
            }),
        })

        -- HTML with Django support
        lspconfig.html.setup({
            cmd = { "vscode-html-language-server", "--stdio" },
            flags = { debounce_text_changes = 150 },
            filetypes = { "html", "htmldjango" },
            capabilities = capabilities,
        })

        -- Lua LS with Neovim runtime
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
            capabilities = capabilities,
        })
    end,
}
