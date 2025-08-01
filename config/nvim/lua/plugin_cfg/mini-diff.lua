return {
    "echasnovski/mini.diff", -- Inline and better diff over the default
    config = function()
        local diff = require("mini.diff")
        diff.setup({
            source = diff.gen_source.none(),
        })
    end,
}
