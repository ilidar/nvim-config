require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "gruvbox",
        component_separators = { "", "" },
        section_separators = { "", "" },
        disabled_filetypes = {},
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { { "filename", file_status = true, path = 2 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})
