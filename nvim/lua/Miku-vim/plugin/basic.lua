local M = {}

local function nvim_tree_on_attach(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        local function my_h()
                api.tree.change_root_to_parent()
                api.tree.collapse_all()
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.del("n", "f", { buffer = bufnr })
        vim.keymap.del("n", "F", { buffer = bufnr })
        vim.keymap.del("n", "y", { buffer = bufnr })
        vim.keymap.del("n", "d", { buffer = bufnr })
        vim.keymap.del("n", "gy", { buffer = bufnr })
        vim.keymap.del("n", "P", { buffer = bufnr })
        vim.keymap.del("n", "s", { buffer = bufnr })
        vim.keymap.del("n", "x", { buffer = bufnr })
        vim.keymap.del("n", "c", { buffer = bufnr })
        vim.keymap.set("n", "l", api.tree.change_root_to_node, opts "next")
        vim.keymap.set("n", "i", api.node.navigate.parent, opts "parent")
        vim.keymap.set("n", "h", my_h, opts "pre")
        vim.keymap.set("n", "n", api.tree.close, opts "Close")
        vim.keymap.set("n", "yy", api.fs.copy.node, opts "copy")
        vim.keymap.set("n", "dd", api.fs.remove, opts "delete")
        vim.keymap.set("n", "cc", api.fs.cut, opts "delete")
        vim.keymap.set("n", "=", api.node.run.system, opts "open system")
        vim.keymap.set("n", "Y", api.fs.copy.absolute_path, opts "absolute_path")
end

-- PLUG: nvim-tree
M[#M + 1] = {
        "nvim-tree/nvim-tree.lua",
        opts = {
                on_attach = nvim_tree_on_attach,
                disable_netrw = true,
                hijack_netrw = true,
                hijack_cursor = true,
                hijack_unnamed_buffer_when_opening = false,
                sync_root_with_cwd = true,
                update_focused_file = {
                        enable = true,
                        update_root = true,
                },
                view = {
                        adaptive_size = false,
                        side = "left",
                        width = 30,
                        preserve_window_proportions = true,
                },
                filesystem_watchers = {
                        enable = true,
                },
                actions = {
                        open_file = {
                                resize_window = true,
                                quit_on_open = true,
                        },
                },
                renderer = {
                        root_folder_label = false,
                        highlight_git = true,
                        highlight_opened_files = "none",

                        icons = {
                                show = {
                                        git = false,
                                },
                        }
                },
                filters = {
                        dotfiles = false,
                        custom = {
                                ".git",
                                ".DS_Store"
                        }
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
}

--PLUG: todo
M[#M + 1] = {
        "folke/todo-comments.nvim",
        opts = {
                keywords = {
                        -- alt ： 别名
                        FIX = {
                                icon = " ",
                                color = "#C0392B",
                                alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "!" },
                        },
                        TODO = { icon = " ", color = "#AF7AC5", alt = { "PLUG" } },
                        HACK = { icon = " ", color = "#7C3AED" },
                        WARN = { icon = " ", color = "#E74C3C", alt = { "WARNING", "XXX" } },
                        PERF = { icon = " ", color = "#5DADE2", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                        NOTE = { icon = "󰎞", color = "#10B981", alt = { "INFO" } },
                },
        },
        event = "VeryLazy",
}
--PLUG: deffview
M[#M + 1] = {
        "sindrets/diffview.nvim",
        dependencies = 'nvim-lua/plenary.nvim',
        cmd = "DiffviewOpen",
}

--PLUG: trouble
M[#M + 1] = {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true,
}

--PLUG:  motion
M[#M + 1] = {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
                labels = "asdfghjkl;weruiopzxcvnm",
                modes = {

                        char = {
                                enabled = false,
                        },
                        search = {
                                enabled = false,
                        },
                },
                highlight = {
                        backdrop = false,
                },
                jump = {
                        forward = true,
                        wrap = true,
                },
                prompt = {
                        enabled = false,
                },
        },
}

--PLUG: markdown table
M[#M + 1] = {
        "dhruvasagar/vim-table-mode",
        ft = "markdown",
}

--PLUG: smart insert
M[#M + 1] = {
        "ybian/smartim",
        config = function()
                vim.g.smartim_default = "com.apple.keylayout.ABC"
        end,
        ft = { "typst", "tex", "markdown" },
}

M[#M + 1] = {
        "NvChad/nvim-colorizer.lua",
        opts = {
                user_default_options = {
                        RGB = true,    -- #RGB hex codes
                        RRGGBB = true, -- #RRGGBB hex codes
                        names = false,
                }
        }
}

return M
