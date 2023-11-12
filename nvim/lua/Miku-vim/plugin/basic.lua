local M = {}

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

local function my_on_attach(bufnr)
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

M[#M + 1] = {

        "nvim-tree/nvim-tree.lua",
        opts = {
                on_attach = my_on_attach,

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
                        dotfiles = true,
                },
        },
}


return M
