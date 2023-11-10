local M = {}

--PLUG: leetcode
M[#M + 1] = {
        "ianding1/leetcode.vim",
        config = function()
                vim.g.leetcode_browser = "chrome"
                vim.g.leetcode_solution_filetype = "rust"
        end,
        cmd = "LeetCodeList",
}

--PLUG: todo
M[#M + 1] =
{
        "folke/todo-comments.nvim",
        opts = {
                keywords = {
                        -- alt ： 别名
                        FIX = {
                                icon = " ",
                                color = "#C0392B",
                                alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "!" },
                        },
                        TODO = { icon = " ", color = "#AF7AC5", alt = { "PLUG" } },
                        HACK = { icon = " ", color = "#7C3AED" },
                        WARN = { icon = " ", color = "#E74C3C", alt = { "WARNING", "XXX" } },
                        PERF = { icon = " ", color = "#5DADE2", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                        NOTE = { icon = "󰎞", color = "#10B981", alt = { "INFO" } },
                },
        },
        event = "VeryLazy",
}

--PLUG: toggleterm
M[#M + 1] =
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
}

--PLUG:  motion
M[#M + 1] = {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
                labels = "asdfghjkl;weruiopzxcvnm",
                modes = {

                        char = {
                                enabled = false,
                        },
                        search = {
                                enabled = false,
                        },
                },
                highlight = {
                        backdrop = false,
                },
                jump = {
                        forward = true,
                        wrap = true,
                },
                prompt = {
                        enabled = false,
                },
        },
        keys = {
                {
                        "f",
                        mode = { "n", "v" },
                        function()
                                require("flash").jump()
                        end,
                        desc = "Flash"
                },
        },
}

--PLUG: deffview
M[#M + 1] = {
        'sindrets/diffview.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        cmd = "DiffviewOpen",
}
M[#M + 1] = {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
                {
                        "<leader>tj",
                        mode = { "n", },
                        function()
                                require("trouble").next({ skip_groups = true, jump = true });
                        end,
                },
                {
                        "<leader>tk",
                        mode = { "n", },
                        function()
                                require("trouble").next({ skip_groups = true, jump = true });
                        end,
                },
        },
}

return M
