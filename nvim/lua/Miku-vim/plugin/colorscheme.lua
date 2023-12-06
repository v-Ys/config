return {
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
                                },
                        })
                        -- vim.cmd.colorscheme "github_light"
                        -- vim.cmd.colorscheme "github_dark"
                        -- vim.cmd.colorscheme "darkplus"
                end
        },

        { "EdenEast/nightfox.nvim" },

        {
                'rose-pine/neovim',
                name = 'rose-pine',
                config = function()
                        require('rose-pine').setup({
                                disable_italics = true,

                        })
                        vim.cmd.colorscheme "rose-pine-moon"
                end
        }


}
