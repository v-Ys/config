return {

        --PLUG: latex
        {
                "lervag/vimtex",
                config = function()
                        vim.g.tex_flavor = "latex" -- Default tex file format

                        -- vim.g.vimtex_indent_bib_enabled = 0
                        -- vim.g.vimtex_indent_enabled = 0

                        vim.g.vimtex_complete_enabled = 0
                        -- Disable imaps (using Ultisnips)
                        vim.g.vimtex_imaps_enabled = 0
                        -- auto open quickfix on compile erros
                        vim.g.vimtex_quickfix_mode = 0
                        -- vim.g.vimtex_view_method = 'skim'

                        vim.g.vimtex_view_method = "sioyek"

                        vim.g.vimtex_compiler_latexmk_engines = {
                                _ = "-lualatex",
                                pdflatex = "-pdf",
                                dvipdfex = "-pdfdvi",
                                lualatex = "-lualatex",
                                xelatex = "-xelatex",
                        }
                end,
                dependencies = {
                        "ybian/smartim",
                        config = function()
                                vim.g.smartim_default = "com.apple.keylayout.ABC"
                        end,
                },
                ft = "tex",
        },
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
                ft = "markdown",
        },

}
