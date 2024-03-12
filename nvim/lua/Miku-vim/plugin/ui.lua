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
                                "Trouble",
                                "alpha"
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
        "projekt0n/github-nvim-theme",
        config = function()
                require('github-theme').setup({
                        groups = {
                                all = {
                                        Pmenu = { bg = 'bg0', fg = 'bg0' },
                                        CmpDocumentationBorder = { fg = 'bg0', bg = 'bg0', },
                                        CmpDocumentation = { fg = 'bg0', bg = 'bg0', },
                                },
                        },
                })
                vim.cmd.colorscheme "github_light"
                -- vim.cmd.colorscheme "github_dark"
        end
}
M[#M + 1] = {
        "rose-pine/neovim",
        config = function()
                require("rose-pine").setup({
                        styles = {
                                italic = false,
                        },
                })
        end,
        event = "VeryLazy",
}
return M
