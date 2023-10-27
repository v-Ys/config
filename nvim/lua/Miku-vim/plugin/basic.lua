local M = {}

-- PLUG: oil
M[#M + 1] = {
        'stevearc/oil.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
                keymaps = {
                        ["g?"] = "actions.show_help",
                        ["<Right>"] = "actions.select",
                        ["<C-v>"] = "actions.select_vsplit",
                        ["<C-s>"] = "actions.select_split",
                        ["<C-t>"] = "actions.select_tab",
                        ["<M-p>"] = "actions.preview",
                        ["n"] = "actions.close",
                        ["q"] = "actions.close",
                        ["<C-r>"] = "actions.refresh",
                        ["<Left>"] = "actions.parent",
                        ["H"] = "actions.open_cwd",
                        ["-"] = "actions.cd",
                        ["~"] = "actions.tcd",
                        ["."] = "actions.toggle_hidden",
                },
        }
}

-- PLUG: autopairs
M[#M + 1] = {
        "windwp/nvim-autopairs",
        config = function()
                require("nvim-autopairs").setup {
                        disable_filetype = { "TelescopePrompt", "fzf" },
                        enable_check_bracket_line = false
                }
                require("nvim-autopairs").get_rules("'")[1].not_filetypes = { "scheme", "lisp" }
                require("nvim-autopairs").get_rules("`")[1].not_filetypes = { "typst" }
        end,
        event = "VeryLazy",
}

-- PLUG: comment
M[#M + 1] = {
        "numToStr/Comment.nvim",
        config = true,
        event = "VeryLazy",
}

-- PLUG: surround
M[#M + 1] = {
        "kylechui/nvim-surround",
        version = "*",
        config = true,
        event = "VeryLazy",
}

-- PLUG: lastplac
M[#M + 1] = {
        "ethanholz/nvim-lastplace",
        opts = {
                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
                lastplace_open_folds = true,
        },
        event = "VeryLazy",
}



return M
