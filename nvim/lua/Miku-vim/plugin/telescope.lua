local theme = {
        single_dropdown = function(opts)
                opts.theme = "dropdown"
                opts.borderchars = {
                        prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
                        results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
                        preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                }
                return opts
        end,

        simple_ivy = function(opts)
                opts.theme = "ivy"
                opts.borderchars = {
                        prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
                        results = { " " },
                        preview = { "", "", "", " ", "", "", "", "" },
                }
                opts.layout_config = {
                        height = 22,
                        preview_width = 0.60,
                }
                opts.results_title = ""
                opts.preview_title = ""
                return opts
        end,
}

local config = function()
        local telescope = require("telescope")
        local actions = require "telescope.actions"
        local trouble = require("trouble.providers.telescope")
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
                                        ["<C-c>"] = actions.close,
                                },
                                n = {
                                        ["<C-c>"] = actions.close,
                                },
                        }
                },

                pickers = {
                        oldfiles = theme.single_dropdown({
                                previewer = false,
                                mappings = {
                                        i = {
                                                ["<c-t>"] = trouble.open_with_trouble,
                                        },
                                        n = {
                                                ["<c-t>"] = trouble.open_with_trouble,
                                        },
                                }
                        }),

                        find_files = theme.single_dropdown({
                                find_command = { "fd", "-H", },
                                mappings = {
                                        i = {
                                                ["<c-t>"] = trouble.open_with_trouble,
                                        },
                                        n = {
                                                ["<c-t>"] = trouble.open_with_trouble,
                                        },
                                }

                        }),

                        colorscheme = theme.single_dropdown({
                                previewer = false,
                        }),

                        builtin = theme.single_dropdown({}),

                        lsp_references = theme.simple_ivy({
                                mappings = {
                                        i = {
                                                ["<c-t>"] = trouble.open_with_trouble,
                                        },
                                        n = {
                                                ["<c-t>"] = trouble.open_with_trouble,
                                        },
                                }
                        }),

                        lsp_definitions = theme.simple_ivy({
                                mappings = {
                                        i = {
                                                ["<c-t>"] = trouble.open_with_trouble,
                                        },
                                        n = {
                                                ["<c-t>"] = trouble.open_with_trouble,
                                        },
                                }
                        }),

                        live_grep = theme.simple_ivy({
                                find_command = { "rg" },
                                mappings = {
                                        i = {
                                                ["<c-t>"] = trouble.open_with_trouble,
                                        },
                                        n = {
                                                ["<c-t>"] = trouble.open_with_trouble,
                                        },
                                }
                        }),

                        current_buffer_fuzzy_find = theme.simple_ivy({
                                find_command = { "rg" },
                                mappings = {
                                        i = {
                                                ["<c-t>"] = trouble.open_with_trouble,
                                        },
                                        n = {
                                                ["<c-t>"] = trouble.open_with_trouble,
                                        },
                                }
                        }),

                        buffers = {
                                initial_mode = "normal",
                                theme = "dropdown",
                                mappings = {
                                        i = {
                                                ["<c-t>"] = trouble.open_with_trouble,
                                                ["<c-d>"] = "delete_buffer",
                                        },
                                        n = {
                                                ["<c-t>"] = trouble.open_with_trouble,
                                                ["d"] = "delete_buffer",
                                                ["<c-d>"] = "delete_buffer",
                                        },
                                },
                                path_display = { "tail" },

                        },
                },


                extensions = {
                        fzf = {
                                fuzzy = true,
                                override_generic_sorter = true,
                                override_file_sorter = true,
                        },
                        ["ui-select"] = {
                                require("telescope.themes").get_dropdown(theme.single_dropdown({})),
                        },
                }


        }


        telescope.load_extension('fzf')
        telescope.load_extension('ui-select')
end


--PLUG:
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
        config = config,
}

return M
