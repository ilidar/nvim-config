local base = require("plugins.lsp-configs.base")

require("lspconfig").pyright.setup({
    on_attach = base.lsp_on_attach,
    capabilities = base.capabilities,
    flags = {
        debounce_text_changes = 150,
    },
    --[[ settings = {
        python = {
            analysis = {
                autoSearchPaths = false,
                useLibraryCodeForTypes = false,
                diagnosticMode = "openFilesOnly",
            },
        },
    }, ]]
})
