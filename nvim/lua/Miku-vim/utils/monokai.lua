local api, opt, g = vim.api, vim.opt, vim.g

local M = {}

local palette = {
        base0       = "#222426",
        base1       = "#272a30",
        base2       = "#26292C",
        base3       = "#2E323C",
        base4       = "#333842",
        base5       = "#4d5154",
        base6       = "#9ca0a4",
        base7       = "#b1b1b1",
        base8       = "#e3e3e1",
        border      = "#a1b5b1",
        brown       = "#504945",
        white       = "#f8f8f0",
        grey        = "#8F908A",
        black       = "#000000",
        pink        = "#f92672",
        green       = "#a6e22e",
        aqua        = "#66d9ef",
        yellow      = "#e6db74",
        orange      = "#fd971f",
        purple      = "#ae81ff",
        red         = "#e95678",
        diff_add    = "#10B981",
        diff_change = "#0099FF",
        diff_delete = "#FF0000",
        diff_text   = "#FF0033",
        vi_blue     = "#264F78",
}



local theme = {

        DiffAdd                    = { fg = palette.diff_add, bg = palette.base4 },
        DiffAdded                  = { fg = palette.diff_add },
        DiffChange                 = { bg = palette.base4, fg = palette.diff_change, },
        DiffDelete                 = { fg = palette.diff_delete, bg = palette.base4 },
        DiffRemoved                = { fg = palette.diff_text },
        DiffText                   = { bg = palette.base4, fg = palette.diff_text },
        DiffFile                   = { fg = palette.fg },
        DiffIndexLine              = { fg = palette.base5 },
        Normal                     = { fg = palette.white, bg = palette.base2, },
        NormalFloat                = { bg = palette.base1, },
        Pmenu                      = { fg = palette.white, bg = palette.base3, },
        PmenuSel                   = { fg = palette.base4, bg = palette.orange, },
        PmenuSelBold               = { fg = palette.base4, bg = palette.orange, },
        PmenuThumb                 = { fg = palette.purple, bg = palette.green, },
        PmenuSbar                  = { bg = palette.base3, },
        ColorColumn                = { bg = palette.base3, },
        CursorLine                 = { bg = palette.base3, },
        NonText                    = { fg = palette.base5, }, -- used for "eol", "extends" and "precedes" in listchars
        Visual                     = { bg = palette.vi_blue, },
        VisualNOS                  = { bg = palette.base3, },
        Search                     = { fg = palette.base0, bg = palette.yellow, },
        IncSearch                  = { fg = palette.base0, bg = palette.pink, },
        CurSearch                  = { link = 'IncSearch' },
        CursorLineNr               = { fg = palette.orange, bg = palette.base2, },
        MatchParen                 = { fg = palette.pink, },
        Question                   = { fg = palette.yellow, },
        ModeMsg                    = { fg = palette.white, bold = true },
        MoreMsg                    = { fg = palette.white, bold = true },
        ErrorMsg                   = { fg = palette.red, bold = true },
        WarningMsg                 = { fg = palette.yellow, bold = true },
        VertSplit                  = { fg = palette.base5, },
        LineNr                     = { fg = palette.base5, bg = palette.base2, },
        SignColumn                 = { fg = palette.white, bg = palette.base2, },
        StatusLine                 = { fg = palette.base7, bg = palette.base2, },
        StatusLineNC               = { fg = palette.grey, bg = palette.base2, },
        TabLineSel                 = { bg = palette.base4, },
        SpecialKey                 = { fg = palette.pink, },
        Title                      = { fg = palette.yellow, bold = true },
        Directory                  = { fg = palette.aqua, },
        Folded                     = { fg = palette.grey, bg = palette.base3, },
        FoldColumn                 = { fg = palette.white, },
        Constant                   = { fg = palette.aqua, },
        Number                     = { fg = palette.purple, },
        Float                      = { fg = palette.purple, },
        Boolean                    = { fg = palette.purple, },
        Character                  = { fg = palette.yellow, },
        String                     = { fg = palette.yellow, },
        Type                       = { fg = palette.aqua, },
        Structure                  = { fg = palette.aqua, },
        StorageClass               = { fg = palette.aqua, },
        Typedef                    = { fg = palette.aqua, },
        Identifier                 = { fg = palette.white, },
        Function                   = { fg = palette.green, },
        Statement                  = { fg = palette.pink, },
        Operator                   = { fg = palette.pink, },
        Label                      = { fg = palette.pink, },
        Keyword                    = { fg = palette.pink, },
        PreProc                    = { fg = palette.green, },
        Include                    = { fg = palette.aqua, },
        Define                     = { fg = palette.pink, },
        Macro                      = { fg = palette.pink, },
        PreCondit                  = { fg = palette.pink, },
        Special                    = { fg = palette.white, },
        SpecialChar                = { fg = palette.pink, },
        Delimiter                  = { fg = palette.white, },
        SpecialComment             = { fg = palette.grey, },
        Tag                        = { fg = palette.orange, },
        Todo                       = { fg = palette.orange, },
        Comment                    = { fg = palette.base6, },
        Error                      = { fg = palette.red, },
        Terminal                   = { fg = palette.white, bg = palette.base2, },
        EndOfBuffer                = { fg = palette.base2, },
        Conceal                    = { fg = palette.grey, },
        CursorColumn               = { bg = palette.base3, },
        Whitespace                 = { fg = palette.base5, }, -- used for "nbsp", "space", "tab" and "trail" in listchars
        WildMenu                   = { fg = palette.white, bg = palette.orange, },
        QuickFixLine               = { fg = palette.purple, bold = true, },
        Debug                      = { fg = palette.orange, },
        debugBreakpoint            = { fg = palette.base2, bg = palette.red, },
        Conditional                = { fg = palette.pink, },
        Repeat                     = { fg = palette.pink, },
        Exception                  = { fg = palette.pink, },

        --NOTE: plug

        DiagnosticSignError        = { fg = palette.red, },
        DiagnosticSignWarn         = { fg = palette.yellow, },
        DiagnosticSignInfo         = { fg = palette.white, },
        DiagnosticSignHint         = { fg = palette.aqua, },
        DiagnosticVirtualTextError = { fg = palette.red, },
        DiagnosticVirtualTextWarn  = { fg = palette.yellow, },
        DiagnosticVirtualTextInfo  = { fg = palette.white, },
        DiagnosticVirtualTextHint  = { fg = palette.aqua, },
        DiagnosticUnderlineError   = { sp = palette.red, },
        DiagnosticUnderlineWarn    = { sp = palette.yellow, },
        DiagnosticUnderlineInfo    = { sp = palette.white, },
        DiagnosticUnderlineHint    = { sp = palette.aqua, },

        -- Telescope
        TelescopeSelection         = { fg = palette.pink, bold = true, },
        TelescopeSelectionCaret    = { fg = palette.green, },
        TelescopeMultiSelection    = { fg = palette.pink, },
        TelescopeMatching          = { fg = palette.aqua, },

        FlashLabel                 = { fg = "#000000", bg = palette.pink },
}



M.setup = function()
        api.nvim_command('hi clear')
        opt.termguicolors = true
        opt.background = 'dark'
        g.colors_name = 'monokai'

        for group, conf in pairs(theme) do
                api.nvim_set_hl(0, group, conf)
        end
end

return M
