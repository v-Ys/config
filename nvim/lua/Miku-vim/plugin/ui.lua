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
                        { type = "padding", val = 2 },
                        {
                                type = "text",
                                val = require('Miku-vim.utils.header').c,
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
                                "packer",
                                "neogitstatus",
                                "neo-tree",
                                "Trouble",
                                "alpha"
                        },
                        buftypes = {
                                "terminal",
                                "nofile",
                                "neo-tree"
                        }
                }
        },
        event = "VeryLazy",

}

M[#M + 1] = {
        'NvChad/nvim-colorizer.lua',
        opts = {
                user_default_options = {
                        RGB = true,    -- #RGB hex codes
                        RRGGBB = true, -- #RRGGBB hex codes
                        names = false,
                }
        }
}



return M
