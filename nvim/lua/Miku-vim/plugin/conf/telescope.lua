--NOTE:
local telescope = require("telescope")
local actions = require "telescope.actions"

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

        pickers = {
                oldfiles = {
                        theme = "dropdown",
                        previewer = false,
                },
                find_files = {
                        find_command = { "fd", "-H", },
                        theme = "ivy",
                        previewer = false,
                },
                colorscheme = {
                        theme = "dropdown",
                },
                lsp_references = {
                        theme = "ivy",
                },
                lsp_definitions = {
                        theme = "ivy",
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

                        theme = "dropdown",
                },
        },


        extensions = {
                fzf = {
                        fuzzy = true,
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true,    -- override the file sorter
                        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                },
                ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}

                },
        },


}


telescope.load_extension('fzf')
telescope.load_extension('ui-select')
telescope.load_extension('zoxide')
