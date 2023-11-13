return {

        {
                "sainnhe/edge",
                event = "VeryLazy",
        },
        {
                "rose-pine/neovim",
                name = 'rose-pine'
        },
        {

                "EdenEast/nightfox.nvim",
                event = "VeryLazy",
        },
        {
                "projekt0n/github-nvim-theme",
                opts = {},
                config = function()
                        -- vim.cmd.colorscheme "github_light"
                        vim.cmd.colorscheme "monokai"
                end,
        }
}
