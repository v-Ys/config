local M = {
        "nvim-telescope/telescope.nvim",
}

local theme = {
        single_dropdown = function(opts)
                opts.theme = "dropdown"
                opts.borderchars = {
                        prompt = { " ", "", "", " ", "", "", "", "" },
                        results = { "─", "", "─", "", "", "", "", "" },
                        preview = { "─", "", "", "", "", "", "", "" },
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
                        height = 20,
                        preview_width = 0.60,
                }
                opts.results_title = ""
                opts.preview_title = ""
                return opts
        end,
}

M.dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        {
                "nvim-telescope/telescope-fzf-native.nvim",
                build =
                "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
        }
}

M.config = function()
        local telescope = require("telescope")
        local actions = require "telescope.actions"
        local trouble = require("trouble.providers.telescope")
        local map = function(maps)
                maps = maps or {}
                local mappings = {
                        i = {
                                ["<c-t>"] = trouble.open_with_trouble,
                        },
                        n = {
                                ["<c-t>"] = trouble.open_with_trouble,
                        },
                }
                for mode, keys in pairs(maps) do
                        for key, value in pairs(keys) do
                                mappings[mode][key] = value
                        end
                end
                return mappings
        end
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
                        builtin = theme.simple_ivy({}),

                        colorscheme = theme.simple_ivy({
                                previewer = false,
                        }),

                        buffers = theme.simple_ivy({
                                initial_mode = "normal",
                                theme = "dropdown",
                                mappings = map {
                                        i = {
                                                ["<c-d>"] = "delete_buffer",
                                        },
                                        n = {
                                                ["<c-d>"] = "delete_buffer",
                                        },
                                },
                                path_display = { "tail" },
                        }),

                        oldfiles = theme.simple_ivy({
                                previewer = false,
                                mappings = map()
                        }),

                        find_files = theme.simple_ivy({
                                previewer = false,
                                find_command = { "fd", "-H", },
                                mappings = map()
                        }),

                        live_grep = theme.simple_ivy({
                                find_command = { "rg" },
                                mappings = map()
                        }),

                        current_buffer_fuzzy_find = theme.simple_ivy({
                                find_command = { "rg" },
                                mappings = map()
                        }),
                        lsp_references = theme.simple_ivy({
                                mappings = map()
                        }),

                        lsp_definitions = theme.simple_ivy({
                                mappings = map()
                        }),

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




return M
