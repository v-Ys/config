local M = {}

--PLUG: icons
M[#M + 1] = {

        "nvim-tree/nvim-web-devicons"
}


--PLUG: alpha
M[#M + 1] = {
        "goolord/alpha-nvim",
        config = function()
                -- require("Miku-vim.plugin.conf.alpha")

                local alpha = require 'alpha'
                local dashboard = require 'alpha.themes.dashboard'
                dashboard.section.header.val = {


                        [[             ⢀⣴⡾⠃⠄⠄⠄⠄⠄⠈⠺⠟⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣶⣤⡀  ]],
                        [[           ⢀⣴⣿⡿⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣸⣿⣿⣿⣿⣿⣿⣿⣷ ]],
                        [[          ⣴⣿⡿⡟⡼⢹⣷⢲⡶⣖⣾⣶⢄⠄⠄⠄⠄⠄⢀⣼⣿⢿⣿⣿⣿⣿⣿⣿⣿ ]],
                        [[         ⣾⣿⡟⣾⡸⢠⡿⢳⡿⠍⣼⣿⢏⣿⣷⢄⡀⠄⢠⣾⢻⣿⣸⣿⣿⣿⣿⣿⣿⣿ ]],
                        [[       ⣡⣿⣿⡟⡼⡁⠁⣰⠂⡾⠉⢨⣿⠃⣿⡿⠍⣾⣟⢤⣿⢇⣿⢇⣿⣿⢿⣿⣿⣿⣿⣿ ]],
                        [[      ⣱⣿⣿⡟⡐⣰⣧⡷⣿⣴⣧⣤⣼⣯⢸⡿⠁⣰⠟⢀⣼⠏⣲⠏⢸⣿⡟⣿⣿⣿⣿⣿⣿ ]],
                        [[      ⣿⣿⡟⠁⠄⠟⣁⠄⢡⣿⣿⣿⣿⣿⣿⣦⣼⢟⢀⡼⠃⡹⠃⡀⢸⡿⢸⣿⣿⣿⣿⣿⡟ ]],
                        [[      ⣿⣿⠃⠄⢀⣾⠋⠓⢰⣿⣿⣿⣿⣿⣿⠿⣿⣿⣾⣅⢔⣕⡇⡇⡼⢁⣿⣿⣿⣿⣿⣿⢣ ]],
                        [[      ⣿⡟⠄⠄⣾⣇⠷⣢⣿⣿⣿⣿⣿⣿⣿⣭⣀⡈⠙⢿⣿⣿⡇⡧⢁⣾⣿⣿⣿⣿⣿⢏⣾ ]],
                        [[      ⣿⡇⠄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢻⠇⠄⠄⢿⣿⡇⢡⣾⣿⣿⣿⣿⣿⣏⣼⣿ ]],
                        [[      ⣿⣷⢰⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⢰⣧⣀⡄⢀⠘⡿⣰⣿⣿⣿⣿⣿⣿⠟⣼⣿⣿ ]],
                        [[      ⢹⣿⢸⣿⣿⠟⠻⢿⣿⣿⣿⣿⣿⣿⣿⣶⣭⣉⣤⣿⢈⣼⣿⣿⣿⣿⣿⣿⠏⣾⣹⣿⣿ ]],
                        [[      ⢸⠇⡜⣿⡟⠄⠄⠄⠈⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟⣱⣻⣿⣿⣿⣿⣿⠟⠁⢳⠃⣿⣿⣿ ]],
                        [[       ⣰⡗⠹⣿⣄⠄⠄⠄⢀⣿⣿⣿⣿⣿⣿⠟⣅⣥⣿⣿⣿⣿⠿⠋  ⣾⡌⢠⣿⡿⠃ ]],
                        [[      ⠜⠋⢠⣷⢻⣿⣿⣶⣾⣿⣿⣿⣿⠿⣛⣥⣾⣿⠿⠟⠛⠉            ]],
                }

                dashboard.section.buttons.val = {
                        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
                }

                alpha.setup(dashboard.config)
        end,
}

--PLUG: indentline
M[#M + 1] = {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
                require("indent_blankline").setup({
                        show_end_of_line = true,
                })
                vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile", "neo-tree" }
                vim.g.indent_blankline_filetype_exclude = {
                        "help",
                        "packer",
                        "neogitstatus",
                        "neo-tree",
                        "Trouble",
                }
        end,
}
--PLUG: lualine
M[#M + 1] = {
        "nvim-lualine/lualine.nvim",
        config = function()
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


                local left = {
                        --NOTE: ▊
                        {
                                function()
                                        -- return '▊'
                                        return ' '
                                end,
                                color = { fg = colors.purple },            -- Sets highlighting of component
                                padding = { left = 0, right = 1 },         -- We don't need space before this
                        },
                        --NOTE: mode component
                        {
                                -- mode component
                                function()
                                        return ''
                                end,
                                color = function()
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
                                        return { fg = mode_color[vim.fn.mode()] }
                                end,
                                padding = { right = 1 },
                        },
                        --NOTE: filename
                        {
                                'filename',
                                cond = conditions.buffer_not_empty,
                                color = { fg = colors.magenta, gui = 'bold' },
                                symbols = {
                                        newfile = '', -- Text to show for new created file before first writting
                                        modified = '', -- Text to show when the file is modified.
                                        readonly = '', -- Text to show when the file is non-modifiable or readonly.
                                        unnamed = '', -- Text to show for unnamed buffers.
                                }
                        },
                        --NOTE: filesize component
                        {
                                -- filesize component
                                'filesize',
                                cond = conditions.buffer_not_empty,
                                color = { fg = colors.gray, gui = 'bold' }
                        },
                        --NOTE: location
                        { 'location', color = { fg = colors.gray, gui = 'bold' } },
                        --NOTE: progress
                        { 'progress', color = { fg = colors.gray, gui = 'bold' } },
                        --NOTE: diagnostics
                        {
                                'diagnostics',
                                sources = { 'nvim_diagnostic' },
                                symbols = { error = ' ', warn = ' ', info = ' ' },
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

                local right = {
                        --NOTE: filetype
                        {
                                'filetype',
                                icons_enabled = true,         -- I think icons are cool but Eviline doesn't have them. sigh
                                color = { fg = colors.green, gui = 'bold' },
                        },
                        --NOTE: branch
                        {
                                'branch',
                                icon = '',
                                color = { fg = colors.violet, gui = 'bold' },
                        },
                        --NOTE: diff
                        {
                                'diff',
                                -- Is it me or the symbol for modified us really weird
                                symbols = { added = ' ', modified = ' ', removed = ' ' },
                                diff_color = {
                                        added = { fg = colors.green },
                                        modified = { fg = colors.orange },
                                        removed = { fg = colors.red },
                                },
                                cond = conditions.hide_in_width,
                        },
                        --NOTE:
                        {
                                function()
                                        return ' '
                                end,
                                color = { fg = colors.purple },
                                padding = { left = 1 },
                        },


                }
                require('lualine').setup({

                        options = {
                                -- Disable sections and component separators
                                component_separators = '',
                                section_separators = '',
                                theme = 'auto',
                                globalstatus = true,
                        },
                        sections = {
                                -- these are to remove the defaults
                                lualine_a = {},
                                lualine_b = {},
                                lualine_y = {},
                                lualine_z = {},
                                -- These will be filled later
                                lualine_c = left,
                                lualine_x = right,
                        },
                        inactive_sections = {
                                -- these are to remove the defaults
                                lualine_a = {},
                                lualine_b = {},
                                lualine_y = {},
                                lualine_z = {},
                                lualine_c = {},
                                lualine_x = {},
                        },
                })
        end,

}

return M