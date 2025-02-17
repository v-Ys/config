local M = {}

local create_mapping = function(prompt_bufnr, mapping_config)
        local actions = require('telescope.actions')
        local action_state = require('telescope.actions.state')
        return function()
                local selection = action_state.get_selected_entry()

                -- if need keep insert mode
                actions._close(prompt_bufnr, mapping_config.keepinsert or false)
                mapping_config.action(selection)
        end
end


M.picker_theme = {
        single_dropdown = function(opts)
                opts = opts or {}
                opts.theme = "dropdown"
                opts.borderchars = {
                        prompt = { " ", "", "", " ", "", "", "", "" },
                        results = { "─", "", "─", "", "", "", "", "" },
                        preview = { "─", "", "", "", "", "", "", "" },
                }
                return opts
        end,

        simple_ivy = function(opts)
                opts = opts or {}
                opts.theme = "ivy"
                opts.borderchars = {
                        prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
                        results = { " " },
                        preview = { "", "", "", " ", "", "", "", "" },
                }
                opts.layout_config = {
                        height = 0.4,
                        preview_width = 0.60,
                }
                opts.results_title = ""
                opts.preview_title = ""
                return opts
        end,
}

-- NOTE:  Zoxide Fun
function M.custom_picker(opts)
        -- require
        local pickers = require("telescope.pickers")
        local finders = require "telescope.finders"
        local conf = require("telescope.config").values
        local utils = require('telescope.utils')
        local actions = require('telescope.actions')
        local theme = require('telescope.themes').get_ivy(M.picker_theme.simple_ivy())
        local shell = vim.o.shell or "/bin/sh"

        pickers.new(theme, {
                prompt_title = opts.title,

                finder = finders.new_table {
                        results = utils.get_os_command_output({ shell, "-c", opts.cmd }),
                        entry_maker = opts.entry_maker
                },
                sorter = conf.generic_sorter(),

                attach_mappings = function(prompt_bufnr, map)
                        -- Set default mapping '<cr>'
                        actions.select_default:replace(create_mapping(prompt_bufnr, opts.default_mappings))
                        -- Add extra mappings
                        for map_key, map_action in pairs(opts.extra_mappings) do
                                map({ "i", "n" }, map_key, create_mapping(prompt_bufnr, map_action))
                                -- keymap({ "i", }, "jk", "<esc>", key_opts)
                        end

                        return true
                end,
        }):find()
end

return M
