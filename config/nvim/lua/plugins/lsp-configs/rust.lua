local base = require("plugins.lsp-configs.base")

require("lspconfig").rust_analyzer.setup {
  on_attach = base.lsp_on_attach,
  capabilities = base.capabilities,
  settings = {
    ['rust-analyzer'] = {},
  },
}
