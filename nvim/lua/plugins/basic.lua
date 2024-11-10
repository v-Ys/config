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
}


-- PLUG: surround
M[#M + 1] = {
        "kylechui/nvim-surround",
        version = "*",
        config = true,
        event = "VeryLazy",
}

--PLUG: todo
M[#M + 1] = {
        "folke/todo-comments.nvim",
        opts = {
                keywords = {
                        FIX = { icon = "󰨰 ", color = "#DC2626", alt = { "BUG", "ISSUE" }, },
                        TEST = { icon = " ", color = "#AF7AC5", alt = { "FUNC", "PLUG" } },
                        WARN = { icon = " ", color = "#C0392B" },
                        TODO = { icon = " ", color = "#DC2626", },
                        DONE = { icon = " ", color = "#1957F3" },
                        NOTE = { icon = "", color = "#10B981", alt = { "INFO", "TIPS" } },
                },
                merge_keywords = false,
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
        opts = {
                focus = true,
                auto_preview = false,
                win = { position = "right" },
                preview = {
                        type = "float",
                        relative = "editor",
                        border = "single",
                        position = { 0, -2 },
                        size = { width = 0.3, height = 0.3 },
                        zindex = 200,
                },
                modes = {
                        symbols = {
                                auto_preview = false,
                                focus = true,
                        },
                },
        },
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

-- PLUG: nvim-tree
M[#M + 1] = {
        "nvim-tree/nvim-tree.lua",
        opts = function()
                local R = {}
                R.on_attach = function(bufnr)
                        local api = require "nvim-tree.api"
                        local keymap_set = vim.keymap.set
                        local keymap_del = vim.keymap.del

                        local function opts(desc)
                                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                        end
                        local function my_h()
                                api.tree.change_root_to_parent()
                                api.tree.collapse_all()
                        end

                        api.config.mappings.default_on_attach(bufnr)

                        keymap_del("n", "f", { buffer = bufnr })
                        keymap_del("n", "F", { buffer = bufnr })
                        keymap_del("n", "y", { buffer = bufnr })
                        keymap_del("n", "d", { buffer = bufnr })
                        keymap_del("n", "gy", { buffer = bufnr })
                        keymap_del("n", "P", { buffer = bufnr })
                        keymap_del("n", "s", { buffer = bufnr })
                        keymap_del("n", "x", { buffer = bufnr })
                        keymap_del("n", "c", { buffer = bufnr })

                        keymap_set("n", "l", api.tree.change_root_to_node, opts "next")
                        keymap_set("n", "i", api.node.navigate.parent, opts "parent")
                        keymap_set("n", "h", my_h, opts "pre")
                        keymap_set("n", "yy", api.fs.copy.node, opts "copy")
                        keymap_set("n", "dd", api.fs.remove, opts "delete")
                        keymap_set("n", "cc", api.fs.cut, opts "delete")
                        keymap_set("n", "=", api.node.run.system, opts "open system")
                        keymap_set("n", "Y", api.fs.copy.absolute_path, opts "absolute_path")
                end

                R.disable_netrw = true
                R.hijack_netrw = true
                R.hijack_cursor = true
                R.hijack_unnamed_buffer_when_opening = false
                R.sync_root_with_cwd = true
                R.update_focused_file = {
                        enable = true,
                        update_root = false,
                }
                R.view = {
                        adaptive_size = false,
                        side = "left",
                        width = 30,
                        preserve_window_proportions = true,
                }
                R.filesystem_watchers = { enable = true }
                R.actions = {
                        open_file = {
                                resize_window = true,
                                quit_on_open = true,
                        },
                }
                R.renderer = {
                        root_folder_label = false,
                        highlight_git = true,
                        highlight_opened_files = "none",
                        icons = { show = { git = false, } }
                }
                R.filters = {
                        dotfiles = false,
                        custom = {
                                ".DS_Store",
                        }
                }
                return R
        end
}


--PLUG: fold
M[#M + 1] = {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        opts = {
                provider_selector = function(_, _, _)
                        return { 'treesitter', 'indent' }
                end
        },
}


--PLUG: treesitter
M[#M + 1] = {
        "nvim-treesitter/nvim-treesitter",
        dependencies = "RRethy/nvim-treesitter-textsubjects",
        build = ":TSUpdate",
        config = function()
                require("nvim-treesitter.configs").setup({
                        ensure_installed = { "vimdoc", "lua", "cpp", "c", "rust", "go", "python", "typst" },
                        sync_install = false,
                        highlight = {
                                enable = true,
                        },
                        indent = {
                                enable = true,
                        },
                        incremental_selection = {
                                enable = true,
                                keymaps = {
                                        node_incremental = "v",
                                        node_decremental = "<BS>",
                                        init_selection = false,
                                        scope_incremental = false,
                                },

                        },
                        textsubjects = {
                                enable = true,
                                prev_selection = '.',
                                keymaps = {
                                        ['<CR>'] = 'textsubjects-smart',
                                },
                        },
                })
        end

}

--PLUG: align
M[#M + 1] = {
        "junegunn/vim-easy-align",
        config = function()
                local set = vim.keymap.set
                set({ "n", "v" }, ";a", "<Plug>(EasyAlign)", { noremap = true, silent = true })
        end
}

--PLUG: table
M[#M + 1] = {
        "dhruvasagar/vim-table-mode",
        ft = "markdown",
}

M[#M + 1] = {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons

}
return M
