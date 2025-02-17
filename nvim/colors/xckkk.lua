-- orange    #cb4b16
-- violet    #6c71c4
local colors = {
        base04 = '#00202b',
        base03 = '#002837',
        base02 = '#073642',
        base01 = '#586e75',
        base00 = '#657b83',
        base0 = '#839496',
        base1 = '#93a1a1',
        base2 = '#eee8d5',
        base3 = '#fdf6e3',
        yellow = '#b58900',
        orange = '#b86114',
        red = '#d75f5f',
        violet = '#887ec8',
        blue = '#268bd2',
        cyan = '#2aa198',
        green = '#84a800',
        magenta = '#d33682',
        -- Custom modifications
        fg = '#b6b6b6', -- Brighter foreground

        --- ------------------------
        --- ------------------------
        --- ------------------------
        text = '#000000',
        bg = '#FFFFFF',
        CursorLine = '#E7EAF0',
        comment = "#7A7A7A",
        string = "#077D18",
        string_esc = "#0137A6",
        string_regexp = "#264eff",
        number = "#1750EB",

}
-- StatusLine     xxx guifg="#f6f8fa" guibg=#5094e4
--                    links to Normal
-- guifg = #ffffff
-- guibg = #ffffff
-- guisp = #f6f8fa

vim.g.colors_name = 'fjaskldf'

local function shl(group, properties)
        vim.api.nvim_set_hl(0, group, properties)
end

local function load_solarized()
        vim.cmd("hi clear")

        -- General editor highlights
        shl('Normal', { fg = colors.text, bg = colors.bg })
        shl('CursorLine', { bg = colors.CursorLine })
        shl('Comment', { fg = colors.comment, italic = false })
        shl('String', { fg = colors.string })
        shl('Number', { fg = colors.number })
        shl('Title', { link = 'Number' })
        shl('StatusLine', { bg = colors.number, fg = colors.base02, reverse = false })
        shl('StatusLineNC', { bg = colors.number, fg = colors.base02, reverse = false })

        -- shl('CursorLineNr', { fg = colors.base1, bg = colors.base02 })
        -- shl('LineNr', { fg = colors.base01 })
        -- shl('EndOfBuffer', { fg = colors.base03 })
        -- shl('WildMenu', { fg = colors.base2, bg = colors.base02, reverse = true })

        shl('Function', { fg = colors.blue })
        shl('Keyword', { fg = colors.green, bold = true })
        shl('Constant', { fg = colors.violet })
        shl('Identifier', { fg = colors.blue })
        shl('Statement', { fg = colors.green })
        shl('PreProc', { fg = colors.orange })
        shl('Type', { fg = colors.yellow })
        shl('Special', { fg = colors.orange })
        shl('Operator', { fg = colors.base0 })
        shl('Underlined', { fg = colors.violet, underline = true })
        shl('Todo', { fg = colors.magenta, bold = true })
        shl('Error', { fg = colors.red, bg = colors.base03, bold = true })
        shl('WarningMsg', { fg = colors.orange })
        shl('IncSearch', { fg = colors.base03, bg = colors.orange })
        shl('Search', { fg = colors.base03, bg = colors.yellow })
        shl('Visual', { fg = colors.base01, bg = colors.base03, reverse = true })
        shl('Pmenu', { fg = colors.base0, bg = colors.base04 })
        shl('PmenuMatch', { fg = colors.cyan, bg = colors.base04, bold = true })
        shl('PmenuMatchSel', { fg = colors.cyan, bg = colors.base00, bold = true })
        shl('PmenuSel', { fg = colors.base3, bg = colors.base00 })
        shl('PmenuSbar', { bg = colors.base1 })
        shl('PmenuThumb', { bg = colors.base01 })
        shl('MatchParen', { bg = colors.base02 })
        shl('WinBar', { bg = colors.base02 })
        shl('NormalFloat', { bg = colors.base02 })
        shl('FloatBorder', { fg = colors.blue })
        shl('WinSeparator', { fg = colors.base00 })


        shl('ModeMsg', { fg = colors.cyan })
        shl('ColorColumn', { bg = colors.base02 })
        shl('Folded', { bg = colors.base02, fg = colors.base0 })
        shl('ErrorMsg', { fg = colors.red })

        -- Treesitter highlights
        shl('@comment', { fg = colors.comment, italic = false })
        shl('@string', { fg = colors.cyan })
        shl('@string.escape', { fg = colors.string_esc })
        shl('@string.regexp', { fg = colors.string_regexp })



        --
        shl('@function', { fg = colors.blue })
        shl('@function.builtin', { fg = colors.blue })
        shl('@variable', { fg = colors.fg })
        shl('@variable.builtin', { fg = colors.fg })
        shl('@keyword', { fg = colors.green })
        shl('@keyword.import', { link = 'PreProc' })
        shl('@type', { fg = colors.yellow })
        shl('@type.builtin', { link = '@type' })
        shl('@constant', { link = 'Constant' })
        shl('@constant.builtin', { link = 'Constant' })
        shl('@constant.macro', { link = 'Constant' })
        shl('@constructor', { link = 'Function' })
        shl('@parameter', { fg = colors.base0 })
        shl('@class', { fg = colors.yellow })
        shl('@method', { fg = colors.blue })
        shl('@property', { link = '@variable' })
        shl('@field', { fg = colors.base0 })
        shl('@interface', { fg = colors.yellow })
        shl('@namespace', { fg = colors.base0 })
        shl('@punctuation', { fg = colors.base0 })
        shl('@operator', { link = 'Operator' })
        shl('@attribute', { fg = colors.yellow })
        shl('@boolean', { link = 'Constant' })
        shl('@number', { link = 'Number' })
        shl('@tag', { fg = colors.green })
        shl('@tag.attribute', { fg = colors.base0 })
        shl('@tag.delimiter', { fg = colors.base0 })

        -- Diagnostics
        shl('DiagnosticError', { fg = colors.red })
        shl('DiagnosticWarn', { fg = colors.yellow })
        shl('DiagnosticInfo', { fg = colors.blue })
        shl('DiagnosticHint', { fg = colors.cyan })
        shl('DiagnosticUnderlineError', { undercurl = true, sp = colors.red })
        shl('DiagnosticUnderlineWarn', { undercurl = true, sp = colors.yellow })
        shl('DiagnosticUnderlineInfo', { undercurl = true, sp = colors.blue })
        shl('DiagnosticUnderlineHint', { undercurl = true, sp = colors.cyan })

        -- LSP
        shl('LspReferenceText', { bg = colors.base02 })
        shl('LspReferenceRead', { bg = colors.base02 })
        shl('LspReferenceWrite', { bg = colors.base02 })

        -- Indentmini
        shl('IndentLine', { link = 'Comment' })
        shl('IndentLineCurrent', { fg = '#084352' })

        -- GitSigns
        shl('GitSignsAdd', { fg = colors.green, bg = colors.base03 })
        shl('GitSignsChange', { fg = colors.yellow, bg = colors.base03 })
        shl('GitSignsDelete', { fg = colors.red, bg = colors.base03 })
        shl('DashboardHeader', { fg = colors.green })
        shl('ModeLineMode', { bold = true })

        vim.cmd('hi! link StatusLine Normal')
end

load_solarized()
