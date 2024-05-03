local bo = vim.bo
local fn = vim.fn
local api = vim.api
local cmd = vim.cmd
local M = {}

local config = {
        ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        ignore_buftype = { "quickfix", "nofile", "help" },
        open_folds = true,
        dont_center = false,
}

M.set_cursor_position = function()
        for _, k in pairs(config["ignore_buftype"]) do
                if bo.buftype == k then
                        return
                end
        end
        for _, k in pairs(config["ignore_filetype"]) do
                if bo.filetype == k then
                        return
                end
        end

        -- Return if the file doesn't exist, like a new and unsaved file
        if fn.empty(fn.glob(fn.expand("%"))) ~= 0 then
                return
        end

        local cursor_position = api.nvim_buf_get_mark(0, '"')
        local row = cursor_position[1]
        local col = cursor_position[2]

        -- If the saved row is less than the number of rows in the buffer,
        -- then continue
        if row > 0 and row <= api.nvim_buf_line_count(0) then
                -- If the last row is visible within this window, like in a very short
                -- file, or user requested us not centering the screen, just set the cursor
                -- position to the saved position
                if api.nvim_buf_line_count(0) == fn.line("w$") or config["dont_center"] then
                        api.nvim_win_set_cursor(0, cursor_position)

                        -- If we're in the middle of the file, set the cursor position and center
                        -- the screen
                elseif api.nvim_buf_line_count(0) - row > ((fn.line("w$") - fn.line("w0")) / 2) - 1 then
                        api.nvim_win_set_cursor(0, cursor_position)
                        cmd("norm! zz")

                        -- If we're at the end of the screen, set the cursor position and move
                        -- the window up by one with C-e. This is to show that we are at the end
                        -- of the file. If we did "zz" half the screen would be blank.
                else
                        api.nvim_win_set_cursor(0, cursor_position)
                        api.nvim_feedkeys(api.nvim_replace_termcodes("<c-e>", true, false, true), "n", false)
                end
        end

        -- If the row is within a fold, make the row visible and recenter the screen
        if api.nvim_eval("foldclosed('.')") ~= -1 and config["open_folds"] then
                cmd("norm! zvzz")
        end
end

return M
