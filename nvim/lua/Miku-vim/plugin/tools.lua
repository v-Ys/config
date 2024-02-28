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
        --PLUG: toggleterm
        {
                "akinsho/toggleterm.nvim",
                version = "*",
                opts = {
                        size = 20,
                        open_mapping = [[<A-m>]],
                        hide_numbers = true,
                        shade_filetypes = {},
                        shade_terminals = true,
                        shading_factor = 2,
                        start_in_insert = true,
                        insert_mappings = true,
                        persist_size = true,
                        direction = "float",
                        close_on_exit = true,
                        shell = vim.o.shell,
                        float_opts = {
                                border = "single",
                                winblend = 0,
                                highlights = {
                                        border = "Normal",
                                        background = "Normal",
                                },
                        },
                },
                event = "VeryLazy",
        },
}
