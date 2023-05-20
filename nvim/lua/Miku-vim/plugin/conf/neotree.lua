local neotree = require("neo-tree")


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
neotree.setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_diagnostics = false,
        hijack_netrw_behavior = "open_default",
        default_component_configs = {
                icon = {
                        folder_closed = "",
                        folder_open = "",
                        folder_empty = "",
                        default = "",
                        highlight = "NeoTreeFileIcon",
                },
                indent = {
                        indent_size = 3,
                        padding = 0, -- extra padding on left hand side
                        -- indent guides
                        with_markers = false,
                },
                git_status = {
                        symbols = {
                                added = "",
                                deleted = "",
                                modified = "",
                                renamed = "➜",
                                untracked = "",

                                ignored = "",
                                unstaged = "",
                                staged = "",
                                conflict = "",
                        },
                },
        },
        window = {
                width = 30,
                mappings = {
                        ["o"] = "open",
                        ["Z"] = "expand_all_nodes",
                        ["n"] = "close_window",
                        ["l"] = "set_root",
                        ["h"] = "navigate_up",
                }
        },
        filesystem = {
                filtered_items = {
                        hide_by_name = {
                        },
                        never_show = {
                                ".DS_Store",
                                ".git",
                        },
                },
                follow_current_file = true,
                hijack_netrw_behavior = "open_current", -- netrw disabled, opening a directory opens neo-tree
                use_libuv_file_watcher = true,          -- This will use the OS level file watchers to detect changes
        },
})
