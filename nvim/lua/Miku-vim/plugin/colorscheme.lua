return {
        {

                'maxmx03/solarized.nvim',
                event = "VeryLazy",
        },
        {
                "rose-pine/neovim",
                name = 'rose-pine',
                event = "VeryLazy",
        },
        {

                "EdenEast/nightfox.nvim",
                event = "VeryLazy",
        },
        {
                "projekt0n/github-nvim-theme",
                config = function()
                        require('github-theme').setup({
                                groups = {
                                        all = {
                                                Pmenu = { bg = 'bg0', fg = 'bg0' },
                                                CmpDocumentationBorder = { fg = 'bg0', bg = 'bg0', },
                                                CmpDocumentation = { fg = 'bg0', bg = 'bg0', },
                                        },
                                }
                        })
                        -- vim.cmd.colorscheme "github_light"
                        vim.cmd.colorscheme "github_dark"
                        -- vim.cmd.colorscheme "monokai"
                end,
        },
}
