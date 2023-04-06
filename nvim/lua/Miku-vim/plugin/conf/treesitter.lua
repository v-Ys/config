--NOTE:
--fold
require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
                return { 'treesitter', 'indent' }
        end
})


require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "cpp", "lua" },
        sync_install = false,


        highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
        },
        indent = {
                enable = true
        }
}
