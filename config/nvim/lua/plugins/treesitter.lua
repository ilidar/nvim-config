return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        lazy = false,
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                branch = "main",
            },
        },
        init = function()
            local ensure_installed = {
                "json",
                "yaml",
                "html",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "vim",
                "vimdoc",
                "dockerfile",
                "gitignore",
                "c",
                "cpp",
                "python",
                "rust",
                "typescript",
                "javascript",
                "css",
                "go",
            }

            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })

            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyDone",
                once = true,
                callback = function()
                    local installed = require("nvim-treesitter").get_installed()
                    local to_install = vim.iter(ensure_installed)
                        :filter(function(parser)
                            return not vim.tbl_contains(installed, parser)
                        end)
                        :totable()
                    if #to_install > 0 then
                        require("nvim-treesitter").install(to_install)
                    end
                end,
            })
        end,
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = {
                    lookahead = true,
                    include_surrounding_whitespace = false,
                },
                move = {
                    set_jumps = true,
                },
            })

            -- Select textobjects
            local select_textobject = function(query)
                return function()
                    require("nvim-treesitter-textobjects.select").select_textobject(query, "textobjects")
                end
            end

            vim.keymap.set({ "x", "o" }, "af", select_textobject("@function.outer"), { desc = "Select outer function" })
            vim.keymap.set({ "x", "o" }, "if", select_textobject("@function.inner"), { desc = "Select inner function" })
            vim.keymap.set({ "x", "o" }, "ac", select_textobject("@class.outer"), { desc = "Select outer class" })
            vim.keymap.set({ "x", "o" }, "ic", select_textobject("@class.inner"), { desc = "Select inner class" })
            vim.keymap.set({ "x", "o" }, "aa", select_textobject("@parameter.outer"), { desc = "Select outer argument" })
            vim.keymap.set({ "x", "o" }, "ia", select_textobject("@parameter.inner"), { desc = "Select inner argument" })
            vim.keymap.set({ "x", "o" }, "ai", select_textobject("@conditional.outer"), { desc = "Select outer conditional" })
            vim.keymap.set({ "x", "o" }, "ii", select_textobject("@conditional.inner"), { desc = "Select inner conditional" })
            vim.keymap.set({ "x", "o" }, "al", select_textobject("@loop.outer"), { desc = "Select outer loop" })
            vim.keymap.set({ "x", "o" }, "il", select_textobject("@loop.inner"), { desc = "Select inner loop" })

            -- Move between textobjects
            local goto_next_start = function(query)
                return function()
                    require("nvim-treesitter-textobjects.move").goto_next_start(query, "textobjects")
                end
            end
            local goto_next_end = function(query)
                return function()
                    require("nvim-treesitter-textobjects.move").goto_next_end(query, "textobjects")
                end
            end
            local goto_previous_start = function(query)
                return function()
                    require("nvim-treesitter-textobjects.move").goto_previous_start(query, "textobjects")
                end
            end
            local goto_previous_end = function(query)
                return function()
                    require("nvim-treesitter-textobjects.move").goto_previous_end(query, "textobjects")
                end
            end

            vim.keymap.set({ "n", "x", "o" }, "]f", goto_next_start("@function.outer"), { desc = "Next function start" })
            vim.keymap.set({ "n", "x", "o" }, "]c", goto_next_start("@class.outer"), { desc = "Next class start" })
            vim.keymap.set({ "n", "x", "o" }, "]a", goto_next_start("@parameter.inner"), { desc = "Next argument" })
            vim.keymap.set({ "n", "x", "o" }, "]F", goto_next_end("@function.outer"), { desc = "Next function end" })
            vim.keymap.set({ "n", "x", "o" }, "]C", goto_next_end("@class.outer"), { desc = "Next class end" })
            vim.keymap.set({ "n", "x", "o" }, "[f", goto_previous_start("@function.outer"), { desc = "Previous function start" })
            vim.keymap.set({ "n", "x", "o" }, "[c", goto_previous_start("@class.outer"), { desc = "Previous class start" })
            vim.keymap.set({ "n", "x", "o" }, "[a", goto_previous_start("@parameter.inner"), { desc = "Previous argument" })
            vim.keymap.set({ "n", "x", "o" }, "[F", goto_previous_end("@function.outer"), { desc = "Previous function end" })
            vim.keymap.set({ "n", "x", "o" }, "[C", goto_previous_end("@class.outer"), { desc = "Previous class end" })

            -- Swap arguments
            vim.keymap.set("n", "<leader>sn", function()
                require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
            end, { desc = "Swap with next argument" })
            vim.keymap.set("n", "<leader>sp", function()
                require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
            end, { desc = "Swap with previous argument" })
        end,
    },
}
