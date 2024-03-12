local ts_config = function()
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
end

local ufo_config = {
        provider_selector = function(_, _, _)
                return { 'treesitter', 'indent' }
        end
}
return {
        {
                "nvim-treesitter/nvim-treesitter",
                dependencies = "RRethy/nvim-treesitter-textsubjects",
                build = ":TSUpdate",
                config = ts_config
        },
        {
                "kevinhwang91/nvim-ufo",
                dependencies = "kevinhwang91/promise-async",
                opts = ufo_config,
        },
}
