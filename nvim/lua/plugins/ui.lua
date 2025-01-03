local M = {}


--PLUG: icons
M[#M + 1] = {
        "nvim-tree/nvim-web-devicons"
}

--PLUG: alpha
M[#M + 1] = {
        "goolord/alpha-nvim",
        opts = {
                layout = {

                        --val c:2 a:9
                        { type = "padding", val = 4 },
                        {
                                type = "text",
                                val = require('utils.header').e,
                                opts = {
                                        position = "center",
                                        hl = "KeyWord",
                                },

                        },
                },
                opts = {
                        margin = 5,
                },

        }
}


--PLUG:
M[#M + 1] = {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
                scope = {
                        enabled = false,
                },
                indent = {
                        char = "│",
                        tab_char = "│",
                },
                exclude = {
                        filetypes = {
                                "help",
                                "Trouble",
                                "alpha",
                                "typst",
                                "markdown",
                        },
                        buftypes = {
                                "terminal",
                                "nofile",
                        }
                }
        },
        event = "VeryLazy",

}

--PLUG:
M[#M + 1] = {
        "nvim-lualine/lualine.nvim",
        opts = function()
                local statusline = require("utils.statusline")
                return {
                        options = {
                                component_separators = '',
                                section_separators = '',
                                theme = 'auto',
                                globalstatus = true,
                        },
                        sections = {
                                lualine_a = {},
                                lualine_b = {},
                                lualine_y = {},
                                lualine_z = {},
                                lualine_c = statusline.left,
                                lualine_x = statusline.right,
                        },
                        inactive_sections = {},
                }
        end,
        dependencies = 'nvim-tree/nvim-web-devicons',
}

--PLUG:
M[#M + 1] = {
        'projekt0n/github-nvim-theme',
        opts = {},
        config = function()
                vim.cmd.colorscheme "github_dark"
                -- vim.cmd.colorscheme "github_dark_default"
        end
}

M[#M + 1] = {
        'NvChad/nvim-colorizer.lua',

        opts = {
                user_default_options = {
                        RGB = true,
                        RRGGBB = true,
                        names = false,
                }
        }
}
return M
