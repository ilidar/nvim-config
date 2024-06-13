return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local keymap = vim.keymap

        -- Keymap setup function
        local function setup_keymaps(bufnr)
            local opts = { buffer = bufnr, silent = true }

            local keymaps = {
                { "n", "gr", "<cmd>Telescope lsp_references<CR>", "Show LSP references" },
                { "n", "gD", vim.lsp.buf.declaration, "Go to declaration" },
                { "n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions" },
                { "n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations" },
                { "n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions" },
                { { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "See available code actions" },
                { "n", "<leader>rn", vim.lsp.buf.rename, "Smart rename" },
                { "n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics" },
                { "n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics" },
                { "n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic" },
                { "n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic" },
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

        -- Common capabilities for all LSP servers
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Diagnostic symbols
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- LSP server configurations
        local servers = {
            "bashls",
            "cmake",
            "clangd",
            "dockerls",
            "remark_ls",
            "pyright",
            "r_language_server",
            "rust_analyzer",
            "tsserver",
            "cssls",
            "yamlls",
        }

        for _, server in ipairs(servers) do
            lspconfig[server].setup({
                capabilities = capabilities,
            })
        end

        lspconfig.html.setup({
            cmd = { "vscode-html-language-server", "--stdio" },
            flags = { debounce_text_changes = 150 },
            filetypes = { "html", "htmldjango" },
            capabilities = capabilities,
        })

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
