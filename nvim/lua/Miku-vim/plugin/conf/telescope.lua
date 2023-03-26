--NOTE:
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
        return
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
                        -- "--exclude={Applications,Library,.git,.idea,.vscode,.sass-cache,node_modules,build}" },
                },
                colorscheme = {
                        theme = "dropdown",
                },
                lsp_references = {
                        theme = "cursor",
                        -- theme = "command_pane",
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
                                { '~/.dotfiles',  max_depth = 1 },
                                -- { '~/code', max_depth = 1 },
                                -- { '~/dev/src3', max_depth = 4 },
                                { path = '~/Code' },
                                -- { path = '~/dev/src5', max_depth = 2 },
                        },
                        hidden_files = true, -- default: false
                        -- theme = "dropdown",
                        -- theme = "ivy",
                        order_by = "asc",
                        search_by = "title",
                        sync_with_nvim_tree = true, -- default false
                }
        },


}


telescope.load_extension('fzf')
telescope.load_extension('project')
