-- Keep all LikeC4-specific capabilities and root markers scoped to this server.
return {
    cmd = { "likec4-lsp", "--stdio" },
    filetypes = { "likec4" },
    root_markers = { "likec4.config.json", "likec4.config.ts", "likec4.config.mjs", ".git" },
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            },
        },
    },
}
