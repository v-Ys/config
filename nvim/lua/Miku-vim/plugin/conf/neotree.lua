local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then return end

neotree.setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_diagnostics = false,
        default_component_configs = {
                indent = {
                        padding = 0,
                        with_expanders = false,
                },
                icon = {
                        folder_closed = "",
                        folder_open = "",
                        folder_empty = "",
                        default = "",
                        highlight = "NeoTreeFileIcon",
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
                use_libuv_file_watcher = true,  -- This will use the OS level file watchers to detect changes
        },
        git_status = {
                window = {
                        position = "float",
                },
        },
})
