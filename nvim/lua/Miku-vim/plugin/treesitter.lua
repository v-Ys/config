return {
        "nvim-treesitter/nvim-treesitter",
        dependencies = "RRethy/nvim-treesitter-textsubjects",
        build = ":TSUpdate",
        config = function()
                require("nvim-treesitter.configs").setup({
                        ensure_installed = { "rust", "c", "cpp", "lua" },
                        sync_install = false,
                        highlight = {
                                enable = true,
                        },
                        indent = {
                                enable = true,
                        },
                        incremental_selection = {
                                enable = true,
                                keymaps = {
                                        node_incremental = "v",
                                        node_decremental = "<BS>",
                                        init_selection = false,
                                        scope_incremental = false,
                                },

                        },
                        textsubjects = {
                                enable = true,
                                prev_selection = '.',
                                keymaps = {
                                        ['<CR>'] = 'textsubjects-smart',
                                },
                        },
                })
        end,
}
