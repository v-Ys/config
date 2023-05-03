--NOTE:
local telescope = require("telescope")

telescope.setup {
        defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                path_display = { "truncate" },
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                        horizontal = {
                                prompt_position = "top",
                                preview_width = 0.55,
                                results_width = 0.8,
                        },
                        vertical = {
                                mirror = false,
                        },
                        width = 0.87,
                        height = 0.80,
                        preview_cutoff = 120,
                },
        },

        mappings = {

        },

        pickers = {
                oldfiles = {
                        theme = "dropdown",
                        previewer = false,
                },
                find_files = {
                        find_command = { "fd", "-H", },
                },
                colorscheme = {
                        theme = "dropdown",
                },
                lsp_references = {
                        theme = "cursor",
                },
                lsp_definitions = {
                        theme = "cursor",
                },
                commands = {
                        theme = "dropdown",
                },
                live_grep = {
                        find_command = { "rg" },
                        theme = "ivy",
                },
                current_buffer_fuzzy_find = {
                        find_command = { "rg" },
                        theme = "ivy",
                },
                buffers = {
                        initial_mode = "normal",
                        theme = "dropdown",
                        mappings = {
                                n = {
                                        ["d"] = "delete_buffer"
                                }

                        },
                        path_display = { "tail" },

                },
                list_tabs = {

                        theme = "ivy",
                },
        },


        extensions = {
                fzf = {
                        fuzzy = true,                   -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true,    -- override the file sorter
                        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                },
                project = {
                        base_dirs = {
                                { '~/.dotfiles', max_depth = 1 },
                                -- { '~/code', max_depth = 1 },
                                -- { '~/dev/src3', max_depth = 4 },
                                { path = '~/Dev' },
                                -- { path = '~/dev/src5', max_depth = 2 },
                        },
                        hidden_files = true, -- default: false
                        -- theme = "dropdown",
                        order_by = "asc",
                        search_by = "title",
                },
                ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                                -- even more opts
                        }

                        -- pseudo code / specification for writing custom displays, like the one
                        -- for "codeactions"
                        -- specific_opts = {
                        --   [kind] = {
                        --     make_indexed = function(items) -> indexed_items, width,
                        --     make_displayer = function(widths) -> displayer
                        --     make_display = function(displayer) -> function(e)
                        --     make_ordinal = function(e) -> string
                        --   },
                        --   -- for example to disable the custom builtin "codeactions" display
                        --      do the following
                        --   codeactions = false,
                        -- }
                }
        },


}


telescope.load_extension('fzf')
telescope.load_extension('project')
telescope.load_extension('ui-select')
