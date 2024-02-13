local M = {}

--NOTE: Zoxide opts

local zoxide_opts = {
        -- entry_maker
        entry_maker = function(item)
                local trimmed = string.gsub(item, '^%s*(.-)%s*$', '%1')
                local item_path = string.gsub(trimmed, '^[^%s]* (.*)$', '%1')
                local score = tonumber(string.gsub(trimmed, '^([^%s]*) .*$', '%1'), 10)

                return {
                        value = item_path,
                        ordinal = item_path,
                        display = item_path,
                        z_score = score,
                        path = item_path
                }
        end,
        -- zoxide list shell cmd
        cmd = { vim.o.shell, "-c", "zoxide query -ls" },
        -- mappings
        mappings = {
                default = {
                        action = function(selection)
                                vim.cmd.cd(selection.path)
                                print(selection.path)
                        end,
                },
                ["<C-f>"] = {
                        keepinsert = true,
                        action = function(selection)
                                require("telescope.builtin").find_files({ cwd = selection.path })
                        end
                },
                ["<C-t>"] = {
                        action = function(selection)
                                vim.cmd.lcd(selection.path)
                        end
                },
        },

        create_mapping = function(prompt_bufnr, mapping_config)
                local actions = require('telescope.actions')
                local action_state = require('telescope.actions.state')
                return function()
                        local selection = action_state.get_selected_entry()
                        if mapping_config.before_action ~= nil then
                                mapping_config.before_action(selection)
                        end

                        -- Close Telescope window
                        actions._close(prompt_bufnr, mapping_config.keepinsert or false)

                        mapping_config.action(selection)
                end
        end,
        map_both = function(map, keys, func)
                map("i", keys, func)
                map("n", keys, func)
        end


}

-- NOTE:  Zoxide Fun
function M.zoxide(opts)
        opts = opts or {}

        -- require
        local pickers = require "telescope.pickers"
        local finders = require "telescope.finders"
        local conf = require("telescope.config").values
        local utils = require('telescope.utils')
        local actions = require('telescope.actions')

        -- for pickers
        local entry_maker = zoxide_opts.entry_maker
        local mappings = zoxide_opts.mappings
        local create_mapping = zoxide_opts.create_mapping
        local map_both = zoxide_opts.map_both

        local cmd = { vim.o.shell, "-c", "zoxide query -ls" }
        if opts.borderchars == nil then
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
        end
        local theme = require('telescope.themes').get_ivy(opts)
        pickers.new(theme, {
                prompt_title = "Zoxide",
                finder = finders.new_table {
                        results = utils.get_os_command_output(cmd),
                        entry_maker = entry_maker
                },
                sorter = conf.generic_sorter(opts),
                attach_mappings = function(prompt_bufnr, map)
                        -- Set default mapping '<cr>'
                        actions.select_default:replace(create_mapping(prompt_bufnr, mappings.default))

                        -- Add extra mappings
                        for mapping_key, mapping_config in pairs(mappings) do
                                if mapping_key ~= "default" then
                                        map_both(map, mapping_key, create_mapping(prompt_bufnr, mapping_config))
                                end
                        end

                        return true
                end,
        }):find()
end

return M
