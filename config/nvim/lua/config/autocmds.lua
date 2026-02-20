-- Autocommands configuration
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

------------------------------------------------------------
-- Dockerfile autodetect
------------------------------------------------------------
autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "Dockerfile*",
    callback = function()
        vim.opt_local.syntax = "dockerfile"
    end,
})

------------------------------------------------------------
-- Highlight on yank
------------------------------------------------------------
autocmd("TextYankPost", {
    group = augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
})

------------------------------------------------------------
-- Relative numbers only in normal mode
------------------------------------------------------------
autocmd({ "InsertEnter" }, {
    group = augroup("relative_number_insert", { clear = true }),
    callback = function()
        vim.opt_local.relativenumber = false
    end,
})

autocmd({ "InsertLeave" }, {
    group = augroup("relative_number_insert", { clear = false }),
    callback = function()
        vim.opt_local.relativenumber = true
    end,
})

------------------------------------------------------------
-- Resize splits on window resize
------------------------------------------------------------
autocmd("VimResized", {
    group = augroup("resize_splits", { clear = true }),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

------------------------------------------------------------
-- Close some filetypes with <q>
------------------------------------------------------------
autocmd("FileType", {
    group = augroup("close_with_q", { clear = true }),
    pattern = { "help", "lspinfo", "man", "notify", "qf", "checkhealth" },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

------------------------------------------------------------
-- Enforce formatoptions (some ftplugins override this)
------------------------------------------------------------
autocmd("FileType", {
    group = augroup("formatoptions", { clear = true }),
    callback = function()
        vim.opt_local.formatoptions:remove("o")
    end,
})

------------------------------------------------------------
-- Auto create directories when saving
------------------------------------------------------------
autocmd("BufWritePre", {
    group = augroup("auto_create_dir", { clear = true }),
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})
