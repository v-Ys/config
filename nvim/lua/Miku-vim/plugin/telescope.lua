local M = {
        'nvim-telescope/telescope.nvim',
        dependencies = {
                'nvim-lua/plenary.nvim',
                'nvim-telescope/telescope-ui-select.nvim',
                {
                        'nvim-telescope/telescope-fzf-native.nvim',
                        build =
                        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
                },
        },
        event = "VeryLazy",
}


function M.config()
        local telescope = require("telescope")
        local actions = require "telescope.actions"
        local tools = require("Miku-vim.utils.telescope_tools")

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
                        mappings = {
                                i = {
                                        ["<C-[>"] = actions.close,
                                },
                        }
                },


                pickers = {
                        oldfiles = tools.theme.single_dropdown({
                                previewer = false,
                        }),
                        find_files = tools.theme.single_dropdown({
                                find_command = { "fd", "-H", }
                        }),
                        colorscheme = tools.theme.single_dropdown({
                                previewer = false,
                        }),
                        builtin = tools.theme.single_dropdown({
                        }),


                        lsp_references = tools.theme.simple_ivy({}),
                        lsp_definitions = tools.theme.simple_ivy({}),

                        live_grep = tools.theme.simple_ivy({
                                find_command = { "rg" },
                        }),
                        current_buffer_fuzzy_find = tools.theme.simple_ivy({
                                find_command = { "rg" },
                        }),
                        buffers = {
                                initial_mode = "normal",
                                theme = "dropdown",
                                mappings = {
                                        n = {
                                                ["d"] = "delete_buffer"
                                        },
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
                                override_generic_sorter = true,
                                override_file_sorter = true,
                                case_mode = "smart_case",
                        },
                        ["ui-select"] = {
                                require("telescope.themes").get_dropdown(tools.theme.single_dropdown({})),
                        },
                }


        }


        telescope.load_extension('fzf')
        telescope.load_extension('ui-select')
end

return M
