if vim.b.did_ftplugin then
    return
end
vim.b.did_ftplugin = true
vim.bo.commentstring = "// %s"
vim.bo.comments = "s1:/*,mb:*,ex:*/,://"
vim.b.undo_ftplugin = "setlocal commentstring< comments<"

-- Custom token names from LikeC4, without changing other languages' highlights.
for token, group in pairs({
    identifier = "Identifier",
    delimiter = "Delimiter",
    constant = "Constant",
    specialChar = "SpecialChar",
}) do
    vim.api.nvim_set_hl(0, "@lsp.type." .. token .. ".likec4", { link = group, default = true })
end
