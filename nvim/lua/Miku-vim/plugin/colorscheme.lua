return {

        {
                "projekt0n/github-nvim-theme",
                opts = {},
                config = function()
                        vim.cmd.colorscheme "github_light"
                end,
        },

        {
                "sainnhe/edge",
                "EdenEast/nightfox.nvim",
                {
                        "catppuccin/nvim",
                        name = "catppuccin",
                },
                event = "VeryLazy",
        },
}
