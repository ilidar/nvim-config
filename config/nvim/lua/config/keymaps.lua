-- Keymaps configuration
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

------------------------------------------------------------
-- Window navigation
------------------------------------------------------------
map("n", "<C-j>", "<C-W>j", opts)
map("n", "<C-k>", "<C-W>k", opts)
map("n", "<C-h>", "<C-W>h", opts)
map("n", "<C-l>", "<C-W>l", opts)

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
-- DAP (Debug Adapter Protocol)
------------------------------------------------------------
map("n", "<F5>", "<cmd>lua require('dap').continue()<CR>", opts)
map("n", "<F10>", "<cmd>lua require('dap').step_over()<CR>", opts)
map("n", "<F11>", "<cmd>lua require('dap').step_into()<CR>", opts)
map("n", "<F12>", "<cmd>lua require('dap').step_out()<CR>", opts)
map("n", "<F7>", "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
map("n", "<F8>", "<cmd>lua require('dap').toggle_breakpoint(vim.fn.input('Breakpoint Condition: '), nil, nil, true)<CR>", opts)
map("n", "<leader>dv", '<cmd>lua require("dap.ui.widgets").hover()<CR>', opts)
map("n", "<leader>df", '<cmd>lua local w = require("dap.ui.widgets"); w.centered_float(w.frames)<CR>', opts)
map("n", "<leader>ds", '<cmd>lua local w = require("dap.ui.widgets"); w.centered_float(w.scopes)<CR>', opts)
map("n", "<leader>dS", '<cmd>lua require("dap.ui.widgets").sidebar(widgets.scopes).toggle()<CR>', opts)
map("n", "<leader>dr", '<cmd>lua require("dap.repl").toggle({height=15})<CR>', opts)
map("n", "<leader>dg", '<cmd>lua require("dap").run_to_cursor()<CR>', opts)
map("n", "<leader>dc", '<cmd>lua require("dap").disconnect({ terminateDebuggee = true }); require("dap").close()<CR>', opts)
map("n", "<leader>du", '<cmd>lua require("dapui").toggle()<CR>', opts)

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

------------------------------------------------------------
-- Copilot
------------------------------------------------------------
vim.api.nvim_set_keymap("i", "<M-l>", 'copilot#Accept("<CR>")', { expr = true, silent = true, noremap = true })
vim.api.nvim_set_keymap("i", "<M-j>", "copilot#Next()", { expr = true, silent = true, noremap = true })
