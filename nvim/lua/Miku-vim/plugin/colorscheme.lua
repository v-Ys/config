local theme = {
        light = {
                {
                        "projekt0n/github-nvim-theme",
                        opts = {},
                        config = function()
                                vim.opt.bg = 'light'
                                vim.cmd.colorscheme "github_light"
                        end,
                },
                {

                        "EdenEast/nightfox.nvim",
                        event = "VeryLazy",
                }
        },
        dark = {
                {
                        "EdenEast/nightfox.nvim",
                        config = function()
                                vim.opt.bg = 'dark'
                                vim.cmd.colorscheme "duskfox"
                        end,
                },
                {

                        "projekt0n/github-nvim-theme",
                        event = "VeryLazy",
                }
        }
}

return {

        {
                "sainnhe/edge",
                event = "VeryLazy",
        },
        {
                "catppuccin/nvim",
                name = "catppuccin",
                event = "VeryLazy",
        },
        {
                'rose-pine/neovim',
                name = 'rose-pine'
        },
        theme.light,
}
