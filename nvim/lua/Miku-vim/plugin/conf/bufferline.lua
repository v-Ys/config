local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
        return
end

--      礼   
bufferline.setup {
        options = {
                numbers = "none",
                close_command = "Bdelete! %d",
                right_mouse_command = "Bdelete! %d",
                left_mouse_command = "buffer %d",
                middle_mouse_command = nil,
                buffer_close_icon = '',
                modified_icon = "",
                close_icon = "",
                -- close_icon = '',
                left_trunc_marker = "",
                right_trunc_marker = "",
                max_name_length = 30,
                max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
                tab_size = 21,
                diagnostics = false,    -- | "nvim_lsp" | "coc",
                diagnostics_update_in_insert = false,
                -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
                --   return "("..count..")"
                -- end,
                -- NOTE: this will be called a lot so don't do any heavy processing here
                offsets = { { filetype = "NeoTree", text = "", padding = 1 } },
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
                -- can also be a table containing 2 custom separators
                -- [focused and unfocused]. eg: { '|', '|' }
                separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
                enforce_regular_tabs = true,
                always_show_bufferline = true,
        },
}
