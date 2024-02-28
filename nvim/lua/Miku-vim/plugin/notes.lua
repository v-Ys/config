return {
        --PLUG: markdown
        {
                "dhruvasagar/vim-table-mode",
                ft = "markdown",
        },

        {
                "ybian/smartim",
                config = function()
                        vim.g.smartim_default = "com.apple.keylayout.ABC"
                end,
                ft = { "markdown", "typst", "tex" },
        },
}
