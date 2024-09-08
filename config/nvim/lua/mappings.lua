local U = require("utils")

------------------------------------------------------------
-- Move between windows
------------------------------------------------------------
U.map("n", "<C-j>", "<C-W>j")
U.map("n", "<C-k>", "<C-W>k")
U.map("n", "<C-h>", "<C-W>h")
U.map("n", "<C-l>", "<C-W>l")

------------------------------------------------------------
-- Disable highlight when <leader><CR> is pressed
------------------------------------------------------------
U.map("n", "<leader><CR>", ":noh<CR>")

------------------------------------------------------------
-- Search
------------------------------------------------------------
U.map("n", "<space>", "/")
U.map("n", "<C-space>", "?")

------------------------------------------------------------
-- Tabs
------------------------------------------------------------
U.map("n", "<leader>tn", ":tabnew<CR>")
U.map("n", "<leader>to", ":tabonly<CR>")
U.map("n", "<leader>tc", ":tabclose<CR>")
U.map("n", "<leader>tm", ":tabmove<CR>")
U.map("n", "<leader>tl", ":tabnext<CR>")

------------------------------------------------------------
-- Telescope
------------------------------------------------------------
U.map("n", "<C-n>", "<cmd>Telescope find_files<CR>")
U.map("n", "<C-g>", "<cmd>Telescope live_grep<CR>")

------------------------------------------------------------
-- nvim-tree
------------------------------------------------------------
U.map("n", "<leader>nn", "<cmd>NvimTreeToggle<CR>")

------------------------------------------------------------
-- Trouble
------------------------------------------------------------
-- Diagnostics
U.map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>")
-- Buffer Diagnostics
U.map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>")
-- Symbols
U.map("n", "<leader>so", "<cmd>Trouble symbols toggle focus=false<CR>")
-- LSP Definitions / references / ...
U.map("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>")
-- Location List
U.map("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>")
-- Quickfix List
U.map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>")

------------------------------------------------------------
-- DAP
------------------------------------------------------------
U.map("n", "<F5>", "<cmd>lua require('dap').continue()<CR>")
U.map("n", "<F10>", "<cmd>lua require('dap').step_over()<CR>")
U.map("n", "<F11>", "<cmd>lua require('dap').step_into()<CR>")
U.map("n", "<F12>", "<cmd>lua require('dap').step_out()<CR>")
U.map("n", "<F7>", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
U.map(
    "n",
    "<F8>",
    "<cmd>lua require('dap').toggle_breakpoint(vim.fn.input('Breakpoint Condition: '), nil, nil, true)<CR>"
)
U.map("n", "<leader>dv", '<cmd>lua require("dap.ui.widgets").hover()<CR>')
U.map("n", "<leader>df", '<cmd>lua local w = require("dap.ui.widgets"); w.centered_float(w.frames)<CR>')
U.map("n", "<leader>ds", '<cmd>lua local w = require("dap.ui.widgets"); w.centered_float(w.scopes)<CR>')
U.map("n", "<leader>dS", '<cmd>lua require("dap.ui.widgets").sidebar(widgets.scopes).toggle()<CR>')
U.map("n", "<leader>dr", '<cmd>lua require("dap.repl").toggle({height=15})<CR>')
U.map("n", "<leader>dg", '<cmd>lua require("dap").run_to_cursor()<CR>')
U.map("n", "<leader>dc", '<cmd>lua require("dap").disconnect({ terminateDebuggee = true }); require("dap").close()<CR>')
U.map("n", "<leader>du", '<cmd>lua require("dapui").toggle()<CR>')

------------------------------------------------------------
-- kommentary
------------------------------------------------------------
vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<leader>cc", "<Plug>kommentary_visual_default", {})

------------------------------------------------------------
-- barbar.nvim
------------------------------------------------------------
U.map("n", "<A-c>", ":BufferClose<CR>")
U.map("n", "<A-,>", ":BufferPrevious<CR>")
U.map("n", "<A-.>", ":BufferNext<CR>")
U.map("n", "<A-<>", ":BufferMovePrevious<CR>")
U.map("n", "<A->>", ":BufferMoveNext<CR>")
U.map("n", "<A-1>", ":BufferGoto 1<CR>")
U.map("n", "<A-2>", ":BufferGoto 2<CR>")
U.map("n", "<A-3>", ":BufferGoto 3<CR>")
U.map("n", "<A-4>", ":BufferGoto 4<CR>")
U.map("n", "<A-5>", ":BufferGoto 5<CR>")
U.map("n", "<A-6>", ":BufferGoto 6<CR>")
U.map("n", "<A-7>", ":BufferGoto 7<CR>")
U.map("n", "<A-8>", ":BufferGoto 8<CR>")
U.map("n", "<A-9>", ":BufferGoto 9<CR>")

------------------------------------------------------------
-- GitTree
------------------------------------------------------------
U.map("n", "<leader>gg", ":GitTreeToggle<CR>")

------------------------------------------------------------
-- Docker & LSP
------------------------------------------------------------
U.map("n", "<F2>", '<cmd>lua require("utils").restart_lsp()<CR>')

------------------------------------------------------------
-- Neovim-Tmux Navigation
------------------------------------------------------------
U.map("n", "<C-h>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<CR>")
U.map("n", "<C-j>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<CR>")
U.map("n", "<C-k>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<CR>")
U.map("n", "<C-l>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<CR>")

------------------------------------------------------------
-- Clang
------------------------------------------------------------
U.map("n", "<leader>sh", ":ClangdSwitchSourceHeader<CR>")

------------------------------------------------------------
-- Copilot
------------------------------------------------------------
vim.api.nvim_set_keymap("i", "<M-l>", 'copilot#Accept("<CR>")', { expr = true, silent = true, noremap = true })
vim.api.nvim_set_keymap("i", "<M-j>", "copilot#Next()", { expr = true, silent = true, noremap = true })
