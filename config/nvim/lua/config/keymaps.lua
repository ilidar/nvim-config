-- Keymaps configuration
local map = vim.keymap.set

------------------------------------------------------------
-- Commenting (native Neovim 0.11+)
------------------------------------------------------------
map("n", "<leader>cc", "gcc", { remap = true, desc = "Toggle comment" })
map("x", "<leader>cc", "gc", { remap = true, desc = "Toggle comment" })

------------------------------------------------------------
-- Clear search highlight
------------------------------------------------------------
map("n", "<leader><CR>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

------------------------------------------------------------
-- Search
------------------------------------------------------------
map("n", "<space>", "/", { desc = "Search forward" })
map("n", "<C-space>", "?", { desc = "Search backward" })

------------------------------------------------------------
-- Tabs
------------------------------------------------------------
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New tab" })
map("n", "<leader>to", "<cmd>tabonly<CR>", { desc = "Close other tabs" })
map("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close tab" })
map("n", "<leader>tm", "<cmd>tabmove<CR>", { desc = "Move tab to end" })
map("n", "<leader>tl", "<cmd>tabnext<CR>", { desc = "Next tab" })

------------------------------------------------------------
-- Telescope
------------------------------------------------------------
map("n", "<C-n>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<C-g>", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })

------------------------------------------------------------
-- nvim-tree
------------------------------------------------------------
map("n", "<leader>nn", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

------------------------------------------------------------
-- Trouble
------------------------------------------------------------
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Workspace diagnostics" })
map(
    "n",
    "<leader>xX",
    "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
    { desc = "Buffer diagnostics" }
)
map("n", "<leader>so", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Document symbols" })
map(
    "n",
    "<leader>cl",
    "<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
    { desc = "LSP definitions/references" }
)
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>", { desc = "Location list" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix list" })

------------------------------------------------------------
-- Formatting (conform.nvim)
------------------------------------------------------------
map("n", "<leader>cf", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
end, { silent = true, desc = "Format buffer" })

------------------------------------------------------------
-- LSP (attached to buffer on LspAttach)
------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function(ev)
        local function lsp_opts(desc)
            return { buffer = ev.buf, silent = true, desc = desc }
        end

        -- Inlay hints (enabled by default for servers that support them)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if
            client
            and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, ev.buf)
        then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        end
        if client and client.name == "clangd" then
            map(
                "n",
                "<leader>sh",
                "<cmd>LspClangdSwitchSourceHeader<CR>",
                lsp_opts("Switch source/header")
            )
        end
        map("n", "<leader>th", function()
            vim.lsp.inlay_hint.enable(
                not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }),
                { bufnr = ev.buf }
            )
        end, lsp_opts("Toggle inlay hints"))

        map("n", "gD", vim.lsp.buf.declaration, lsp_opts("Go to declaration"))
        map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", lsp_opts("Go to definition"))
        map("n", "gr", "<cmd>Telescope lsp_references<CR>", lsp_opts("Show references"))
        map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", lsp_opts("Show implementations"))
        map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", lsp_opts("Type definition"))
        map("n", "K", vim.lsp.buf.hover, lsp_opts("Hover documentation"))
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, lsp_opts("Code action"))
        map("n", "<leader>rn", vim.lsp.buf.rename, lsp_opts("Rename symbol"))
        map(
            "n",
            "<leader>D",
            "<cmd>Telescope diagnostics bufnr=0<CR>",
            lsp_opts("Buffer diagnostics")
        )
        map("n", "<leader>d", vim.diagnostic.open_float, lsp_opts("Line diagnostics"))
        map("n", "[d", function()
            vim.diagnostic.jump({ count = -1 })
        end, lsp_opts("Previous diagnostic"))
        map("n", "]d", function()
            vim.diagnostic.jump({ count = 1 })
        end, lsp_opts("Next diagnostic"))
        map("n", "<leader>rs", "<cmd>lsp restart<CR>", lsp_opts("Restart LSP"))
    end,
})

------------------------------------------------------------
-- barbar.nvim (buffer management)
------------------------------------------------------------
map("n", "<A-c>", "<cmd>BufferClose<CR>", { desc = "Close buffer" })
map("n", "<A-,>", "<cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
map("n", "<A-.>", "<cmd>BufferNext<CR>", { desc = "Next buffer" })
map("n", "<A-<>", "<cmd>BufferMovePrevious<CR>", { desc = "Move buffer left" })
map("n", "<A->>", "<cmd>BufferMoveNext<CR>", { desc = "Move buffer right" })
for index = 1, 9 do
    map(
        "n",
        "<A-" .. index .. ">",
        "<cmd>BufferGoto " .. index .. "<CR>",
        { desc = "Go to buffer " .. index }
    )
end
