local M = {}

local entry_maker = function(item)
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
end

local mappings = {
        default = {
                action = function(selection)
                        vim.notify(selection.path)
                        vim.cmd.cd(selection.path)
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
}

local create_mapping = function(prompt_bufnr, mapping_config)
        local actions = require('telescope.actions')
        local action_state = require('telescope.actions.state')
        return function()
                local selection = action_state.get_selected_entry()

                -- Close Telescope window
                actions._close(prompt_bufnr, mapping_config.keepinsert or false)
                mapping_config.action(selection)
        end
end

local map_both = function(map, keys, func)
        map("i", keys, func)
        map("n", keys, func)
end



-- NOTE:  Zoxide Fun
function M.zoxide(opts)
        opts = opts or {}
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

        -- require
        local pickers = require("telescope.pickers")
        local finders = require "telescope.finders"
        local conf = require("telescope.config").values
        local utils = require('telescope.utils')
        local actions = require('telescope.actions')

        local cmd = { vim.o.shell, "-c", "zoxide query -ls" }
        local theme = require('telescope.themes').get_ivy(opts)

        pickers.new(theme, {
                prompt_title = "Zoxide",

                finder = finders.new_table {
                        results = utils.get_os_command_output(cmd),
                        entry_maker = entry_maker
                },
                sorter = conf.generic_sorter(),

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
