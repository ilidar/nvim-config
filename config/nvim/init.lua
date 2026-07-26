-- Neovim Configuration
-- Structure:
--   lua/config/options.lua  - Vim options and settings
--   lua/config/keymaps.lua  - Key mappings
--   lua/config/autocmds.lua - Autocommands
--   lua/config/lazy.lua     - Plugin manager setup
--   lua/plugins/            - Plugin specifications
--   after/lsp/              - Native LSP overrides (Neovim 0.12+)

-- Load options first (includes leader key)
require("config.options")

-- Load plugin manager and plugins
require("config.lazy")

-- Load keymaps after plugins (some keymaps depend on plugins)
require("config.keymaps")

-- Load autocommands
require("config.autocmds")
