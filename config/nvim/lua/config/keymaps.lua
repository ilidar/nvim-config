-- Keymaps configuration
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

------------------------------------------------------------
-- Commenting (native Neovim 0.11+)
------------------------------------------------------------
map("n", "<leader>cc", "gcc", { remap = true, desc = "Toggle comment" })
map("x", "<leader>cc", "gc", { remap = true, desc = "Toggle comment" })

------------------------------------------------------------
-- Clear search highlight
------------------------------------------------------------
map("n", "<leader><CR>", ":noh<CR>", opts)

------------------------------------------------------------
-- Search
------------------------------------------------------------
map("n", "<space>", "/", opts)
map("n", "<C-space>", "?", opts)

------------------------------------------------------------
-- Tabs
------------------------------------------------------------
map("n", "<leader>tn", ":tabnew<CR>", opts)
map("n", "<leader>to", ":tabonly<CR>", opts)
map("n", "<leader>tc", ":tabclose<CR>", opts)
map("n", "<leader>tm", ":tabmove<CR>", opts)
map("n", "<leader>tl", ":tabnext<CR>", opts)

------------------------------------------------------------
-- Telescope
------------------------------------------------------------
map("n", "<C-n>", "<cmd>Telescope find_files<CR>", opts)
map("n", "<C-g>", "<cmd>Telescope live_grep<CR>", opts)

------------------------------------------------------------
-- nvim-tree
------------------------------------------------------------
map("n", "<leader>nn", "<cmd>NvimTreeToggle<CR>", opts)

------------------------------------------------------------
-- Trouble
------------------------------------------------------------
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", opts)
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", opts)
map("n", "<leader>so", "<cmd>Trouble symbols toggle focus=false<CR>", opts)
map("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", opts)
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>", opts)
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", opts)

------------------------------------------------------------
-- Formatting (conform.nvim)
------------------------------------------------------------
map("n", "<leader>cf", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
end, { noremap = true, silent = true, desc = "Format buffer" })

------------------------------------------------------------
-- LSP (attached to buffer on LspAttach)
------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function(ev)
        local bufopts = { buffer = ev.buf, silent = true }

        map("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", bufopts, { desc = "Go to declaration" }))
        map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", vim.tbl_extend("force", bufopts, { desc = "Go to definition" }))
        map("n", "gr", "<cmd>Telescope lsp_references<CR>", vim.tbl_extend("force", bufopts, { desc = "Show references" }))
        map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", vim.tbl_extend("force", bufopts, { desc = "Show implementations" }))
        map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", vim.tbl_extend("force", bufopts, { desc = "Type definition" }))
        map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", bufopts, { desc = "Hover documentation" }))
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", bufopts, { desc = "Code action" }))
        map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", bufopts, { desc = "Rename symbol" }))
        map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", vim.tbl_extend("force", bufopts, { desc = "Buffer diagnostics" }))
        map("n", "<leader>d", vim.diagnostic.open_float, vim.tbl_extend("force", bufopts, { desc = "Line diagnostics" }))
        map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, vim.tbl_extend("force", bufopts, { desc = "Previous diagnostic" }))
        map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, vim.tbl_extend("force", bufopts, { desc = "Next diagnostic" }))
        map("n", "<leader>rs", ":LspRestart<CR>", vim.tbl_extend("force", bufopts, { desc = "Restart LSP" }))
    end,
})

------------------------------------------------------------
-- barbar.nvim (buffer management)
------------------------------------------------------------
map("n", "<A-c>", ":BufferClose<CR>", opts)
map("n", "<A-,>", ":BufferPrevious<CR>", opts)
map("n", "<A-.>", ":BufferNext<CR>", opts)
map("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
map("n", "<A->>", ":BufferMoveNext<CR>", opts)
map("n", "<A-1>", ":BufferGoto 1<CR>", opts)
map("n", "<A-2>", ":BufferGoto 2<CR>", opts)
map("n", "<A-3>", ":BufferGoto 3<CR>", opts)
map("n", "<A-4>", ":BufferGoto 4<CR>", opts)
map("n", "<A-5>", ":BufferGoto 5<CR>", opts)
map("n", "<A-6>", ":BufferGoto 6<CR>", opts)
map("n", "<A-7>", ":BufferGoto 7<CR>", opts)
map("n", "<A-8>", ":BufferGoto 8<CR>", opts)
map("n", "<A-9>", ":BufferGoto 9<CR>", opts)

------------------------------------------------------------
-- Clang
------------------------------------------------------------
map("n", "<leader>sh", ":LspClangdSwitchSourceHeader<CR>", opts)
