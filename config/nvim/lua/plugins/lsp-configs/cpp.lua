local base = require("plugins.lsp-configs.base")

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.offsetEncoding = { "utf-16" }

require("lspconfig").clangd.setup({
    on_attach = base.lsp_on_attach,
    capabilities = capabilities,
})
