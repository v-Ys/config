local nv = {
        'NvChad/nvim-colorizer.lua',
        opts = {
                user_default_options = {
                        RGB = true,    -- #RGB hex codes
                        RRGGBB = true, -- #RRGGBB hex codes
                        names = false,
                }
        }
}
local groups = {
        all = {
                Pmenu = { bg = 'bg0', fg = 'bg0' },
                CmpDocumentationBorder = { fg = 'bg0', bg = 'bg0', },
                CmpDocumentation = { fg = 'bg0', bg = 'bg0', },
        },
}

local vimtex = {
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
                vim.g.vimtex_view_method = 'skim'

                -- vim.g.vimtex_view_method = "sioyek"

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
}
local lt = {
        "ianding1/leetcode.vim",
        config = function()
                vim.g.leetcode_browser = "chrome"
                vim.g.leetcode_solution_filetype = "rust"
        end,
        cmd = "LeetCodeList",
}


local term = {
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

local runCode = {
        c = function()
                vim.cmd("TermExec cmd=\"cd %:p:h && clang %:t -o %:t:r && ./%:t:r && rm %:t:r\"")
        end,

        -- cpp = function()
        --         vim.cmd("TermExec cmd=\"cd %:p:h && clang++ %:t -o %:t:r && ./%:t:r && rm %:t:r\"")
        -- end,

        --cpp 20
        cpp = function()
                vim.cmd(
                        "TermExec cmd=\"cd %:p:h && clang++ -std=c++20 -fmodules %:t -o %:t:r && ./%:t:r && rm %:t:r\"")
        end,

        go = function()
                vim.cmd(
                        "TermExec cmd=\"cd %:p:h && go run %:t\"")
        end,
        python = function()
                vim.cmd("TermExec cmd=\"cd %:p:h && python3 %:t\"")
        end,

        rust = function()
                vim.cmd("TermExec cmd=\"cd %:p:h && cargo run\"")
        end,

        markdown = function()
                vim.cmd("silent! !open %")
        end,

        typst = function()
                vim.cmd("silent! !open -a Skim.app %:p:r.pdf")
        end,
        scheme = function()
                vim.cmd("TermExec cmd=\"cd %:p:h && racket %:t\"")
        end
}

local nullls_config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local completion = null_ls.builtins.completion
        null_ls.setup({
                debug = false,
                sources = {
                        formatting.black,
                        completion.spell,
                },
        })
end

-- telescope theme
-- prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
-- results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
-- preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
