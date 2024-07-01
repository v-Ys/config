local M = {}

local colors = {
        bg       = '#202328',
        fg       = '#bbc2cf',
        yellow   = '#ECBE7B',
        cyan     = '#008080',
        darkblue = '#081633',
        green    = '#98be65',
        orange   = '#FF8800',
        violet   = '#a9a1e1',
        magenta  = '#c678dd',
        blue     = '#51afef',
        red      = '#ec5f67',
        purple   = '#1E50A2',
        gray     = "#bdbebd",
}

local conditions = {
        buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
        end,
        hide_in_width = function()
                return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
                local filepath = vim.fn.expand('%:p:h')
                local gitdir = vim.fn.finddir('.git', filepath .. ';')
                return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
}

local function wordcount()
        return tostring(vim.fn.wordcount().chars)
end
local function m_color()
        -- auto change color according to neovims mode
        local mode_color = {
                n = colors.red,
                i = colors.green,
                v = colors.blue,
                [''] = colors.blue,
                V = colors.blue,
                c = colors.magenta,
                no = colors.red,
                s = colors.orange,
                S = colors.orange,
                [''] = colors.orange,
                ic = colors.yellow,
                R = colors.violet,
                Rv = colors.violet,
                cv = colors.red,
                ce = colors.red,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!'] = colors.red,
                t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()], gui = 'bold' }
end

M.left = {
        -- '▊'
        {
                function()
                        return ' '
                end,
                padding = { right = 1 },
        },
        -- mode component
        {
                function()
                        return 'MIKU'
                end,
                color = m_color,
                padding = { right = 1 },
        },
        -- filename
        {
                'filename',
                cond = conditions.buffer_not_empty,
                color = { fg = colors.magenta, gui = 'bold' },
                symbols = {
                        newfile = '',
                        modified = '',
                        readonly = '',
                        unnamed = '',
                }
        },
        -- wordcount
        {
                wordcount,
                cond = conditions.buffer_not_empty,
                color = { fg = colors.gray, gui = 'bold' }
        },
        -- location
        {
                'location',
                color = { fg = colors.gray, gui = 'bold' }
        },
        -- progress
        {
                'progress',
                color = { fg = colors.gray, gui = 'bold' }
        },
        -- diagnostics
        {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                symbols = { error = ' ', warn = ' ', info = ' ' },
                diagnostics_color = {
                        color_error = { fg = colors.red },
                        color_warn = { fg = colors.yellow },
                        color_info = { fg = colors.cyan },
                },
        },
        --NOTE:
        {
                function()
                        return '%='
                end,
        },

}

M.right = {
        -- filetype
        {
                'filetype',
                icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
                color = { fg = colors.green, gui = 'bold' },
        },
        -- branch
        {
                'branch',
                icon = '',
                color = { fg = colors.violet, gui = 'bold' },
        },
        -- diff
        {
                'diff',
                -- Is it me or the symbol for modified us really weird
                symbols = { added = ' ', modified = ' ', removed = ' ' },
                diff_color = {
                        added = { fg = colors.green },
                        modified = { fg = colors.orange },
                        removed = { fg = colors.red },
                },
                cond = conditions.hide_in_width,
                padding = { left = 1 },
        },
        -- ' '
        {
                function()
                        return ' '
                end,
                padding = { left = 1 },
        },


}

return M
