vim.g.tex_flavor = 'latex' -- Default tex file format

-- vim.g.vimtex_indent_bib_enabled = 0
-- vim.g.vimtex_indent_enabled = 0

vim.g.vimtex_complete_enabled = 0
-- Disable imaps (using Ultisnips)
vim.g.vimtex_imaps_enabled = 0
-- auto open quickfix on compile erros
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_view_method = 'skim'

vim.g.vimtex_compiler_latexmk_engines = {
        _        = '-lualatex',
        pdflatex = '-pdf',
        dvipdfex = '-pdfdvi',
        lualatex = '-lualatex',
        xelatex  = '-xelatex',
}

-- vim.cmd([[
-- let g:vimtex_compiler_latexmk_engines = {
--     \ '_'                : '-pdf',
--     \ 'pdflatex'         : '-pdf',
--     \ 'dvipdfex'         : '-pdfdvi',
--     \ 'lualatex'         : '-lualatex',
--     \ 'xelatex'          : '-xelatex',
--     \}
-- context (pdftex) = '-pdf -pdflatex=texexec',
-- \ 'context (luatex)' : '-pdf -pdflatex=context',
-- \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
-- ]])
