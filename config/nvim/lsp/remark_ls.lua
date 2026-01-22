-- Remark (Markdown) Language Server configuration
return {
    cmd = { "remark-language-server", "--stdio" },
    filetypes = { "markdown" },
    root_markers = { ".remarkrc", ".remarkrc.json", ".remarkrc.js", ".remarkrc.mjs", ".remarkrc.cjs", ".remarkrc.yaml", ".remarkrc.yml", ".git" },
}
