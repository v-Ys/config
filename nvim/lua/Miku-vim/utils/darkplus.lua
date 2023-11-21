local api, opt, g = vim.api, vim.opt, vim.g
local M = {}

local c = {
        fg = '#D4D4D4',
        bg = '#1E1E1E',
        dark = '#252525',
        accent = '#BBBBBB',
        popup_back = '#2D2D30',
        search_orange = '#613214',
        search_blue = '#5e81ac',
        gray = '#808080',
        dark_gray = '#3e3e3e',
        context = '#606060',
        light_gray = '#c8c9c1',
        blue = '#569CD6',
        dark_blue = '#223E55',
        light_blue = '#9CDCFE',
        -- cyan = '#4EC9B0',
        cyan = '#D4D4D4',
        green = '#6A9955',
        light_green = '#B5CEA8',
        red = '#F44747',
        light_red = '#D16969',
        orange = '#CE9178',
        -- yellow = '#DCDCAA',
        yellow = '#569CD6',
        yellow_orange = '#D7BA7D',
        purple = '#C586C0',
        magenta = '#D16D9E',
        cursor_fg = '#515052',
        cursor_bg = '#AEAFAD',
        error_red = '#F44747',
        warning_orange = '#ff8800',
        info_yellow = '#FFCC66',
        hint_blue = '#4FC1FF',
        ui_blue = '#264F78',
        diff_add = '#587c0c',
        diff_change = '#0c7d9d',
        diff_delete = '#94151b',
        diff_text = '#265478',
}

local theme = {

        Boolean = { fg = c.orange },
        Character = { fg = c.green },
        ColorColumn = { bg = c.dark },
        Comment = { fg = c.gray, },
        Conceal = { fg = c.accent, bg = c.bg },
        Conditional = { fg = c.purple },
        Constant = { fg = c.orange },
        Cursor = { fg = c.cursor_fg, bg = c.cursor_bg },
        CursorColumn = { bg = c.dark },
        CursorIM = { fg = c.cursor_fg, bg = c.cursor_bg },
        CursorLine = { bg = c.dark },
        CursorLineNr = { fg = c.light_gray, },
        Debug = { fg = c.red },
        Define = { fg = c.purple },
        Delimiter = { fg = c.fg },
        DiffAdd = { fg = c.dark, bg = c.diff_add },
        DiffAdded = { fg = c.diff_add },
        DiffChange = { fg = c.dark, bg = c.diff_change, underline = true },
        DiffDelete = { fg = c.dark, bg = c.diff_delete },
        DiffRemoved = { fg = c.diff_delete },
        DiffText = { fg = c.dark, bg = c.diff_text },
        DiffFile = { fg = c.cyan },
        DiffIndexLine = { fg = c.gray },
        Directory = { fg = c.blue },
        EndOfBuffer = { fg = c.bg },
        Error = { fg = c.error_red, bg = c.bg, },
        ErrorMsg = { fg = c.error_red, bg = c.bg, },
        Exception = { fg = c.purple },
        Float = { fg = c.orange },
        FloatBorder = { fg = c.gray, bg = c.dark },
        FoldColumn = { fg = c.accent, bg = c.dark },
        Folded = { fg = c.accent, bg = c.dark },
        Function = { fg = c.blue },
        Identifier = { fg = c.fg },
        Ignore = { fg = c.cyan, bg = c.bg, },
        IncSearch = { fg = c.light_gray, bg = c.search_blue },
        Include = { fg = c.purple },
        Keyword = { fg = c.purple },
        Label = { fg = c.blue },
        LineNr = { fg = c.context },
        Macro = { fg = c.purple },
        MatchParen = { fg = "#c02c38" },
        MatchParenCur = { underline = true },
        MatchWord = { underline = true },
        MatchWordCur = { underline = true },
        ModeMsg = { fg = c.fg, bg = c.bg },
        MoreMsg = { fg = c.orange },
        MsgArea = { fg = c.fg, bg = c.bg },
        MsgSeparator = { fg = c.fg, bg = c.bg },
        NonText = { fg = c.context },
        Normal = { fg = c.fg, bg = c.bg },
        NormalFloat = { bg = c.dark },
        NormalNC = { fg = c.fg, bg = c.bg },
        Number = { fg = c.orange },
        Operator = { fg = c.purple },
        Pmenu = { fg = c.light_gray, bg = c.popup_back },
        PmenuSbar = { bg = c.dark },
        PmenuSel = { fg = c.dark, bg = c.blue },
        PmenuThumb = { bg = c.gray },
        PreCondit = { fg = c.purple },
        PreProc = { fg = c.purple },
        Question = { fg = c.orange },
        QuickFixLine = { bg = c.dark_gray },
        Repeat = { fg = c.purple },
        Search = { fg = c.light_gray, bg = c.search_blue },
        SignColumn = { bg = c.bg },
        Special = { fg = c.purple },
        SpecialChar = { fg = c.fg },
        SpecialComment = { fg = c.gray },
        SpecialKey = { fg = c.blue, },
        --
        Statement = { fg = c.purple },
        StatusLine = { fg = c.dark, bg = "#212121" },
        StatusLineNC = { fg = c.dark },
        StatusLineSeparator = { fg = c.dark },
        StatusLineTerm = { fg = c.dark },
        StatusLineTermNC = { fg = c.dark },
        StorageClass = { fg = c.cyan },
        String = { fg = c.green },
        Structure = { fg = c.purple },
        Substitute = { fg = c.light_gray, bg = c.search_orange },
        TabLine = { fg = c.light_gray, bg = c.dark },
        TabLineFill = { fg = c.fg, bg = c.dark },
        TabLineSel = { fg = c.fg, bg = c.dark },
        Tag = { fg = c.blue },
        TermCursor = { fg = c.cursor_fg, bg = c.cursor_bg },
        TermCursorNC = { fg = c.cursor_fg, bg = c.cursor_bg },
        Title = { fg = c.blue, },
        Todo = { fg = c.red, bg = c.bg, bold = true },
        Type = { fg = c.yellow, bold = false },
        Typedef = { fg = c.purple },
        Variable = { fg = c.cyan },
        VertSplit = { fg = c.bg, bg = c.dark },
        Visual = { bg = c.ui_blue },
        VisualNOS = { bg = c.dark },
        WarningMsg = { fg = c.error_red, bg = c.bg },
        Whitespace = { fg = c.gray },
        WildMenu = { fg = c.dark, bg = c.blue },
        lCursor = { fg = c.cursor_fg, bg = c.cursor_bg },

        --NOTE:PLUGIN
        -- Cmp
        CmpDocumentation = { fg = c.fg, bg = c.none },
        CmpDocumentationBorder = { fg = c.gray, bg = c.none },
        CmpItemAbbr = { fg = c.fg, bg = c.none },
        CmpItemAbbrDeprecated = { fg = c.gray, bg = c.none },
        CmpItemAbbrMatch = { fg = c.cyan, bg = c.none },
        CmpItemAbbrMatchFuzzy = { fg = c.cyan, bg = c.none },
        CmpItemKind = { fg = c.blue, bg = c.none },
        CmpItemMenu = { fg = c.light_gray, bg = c.none },
        DashboardHeader = { fg = c.blue },
        -- Diffview
        DiffViewNormal = { fg = c.gray, bg = c.dark },
        DiffviewFilePanelDeletion = { fg = c.diff_delete },
        DiffviewFilePanelInsertion = { fg = c.diff_add },
        DiffviewStatusAdded = { fg = c.diff_add },
        DiffviewStatusDeleted = { fg = c.diff_delete },
        DiffviewStatusModified = { fg = c.diff_change },
        DiffviewStatusRenamed = { fg = c.diff_change },
        DiffviewVertSplit = { bg = c.bg },
        -- Lsp
        DiagnosticFloatingError = { fg = c.error_red },
        DiagnosticFloatingHint = { fg = c.hint_blue },
        DiagnosticFloatingInfo = { fg = c.info_yellow },
        DiagnosticFloatingWarn = { fg = c.warning_orange },
        DiagnosticSignError = { fg = c.error_red },
        DiagnosticSignHint = { fg = c.hint_blue },
        DiagnosticSignInfo = { fg = c.info_yellow },
        DiagnosticSignWarn = { fg = c.warning_orange },
        DiagnosticUnderlineError = { underline = true },
        DiagnosticUnderlineHint = { underline = true },
        DiagnosticUnderlineInfo = { underline = true },
        DiagnosticUnderlineWarn = { underline = true },
        -- Telescope
        TelescopeBorder = { fg = c.cyan, bg = c.bg },
        TelescopeMatching = { fg = c.info_yellow, },
        TelescopePromptPrefix = { fg = c.purple },
        TelescopeSelection = { fg = c.hint_blue },
        -- Treesitter

        FlashLabel = { fg = "#000000", bg = c.purple },
}


M.load = function()
        api.nvim_command('hi clear')
        opt.termguicolors = true
        opt.background = 'dark'
        g.colors_name = 'darkplus'

        for group, conf in pairs(theme) do
                api.nvim_set_hl(0, group, conf)
        end
end

return M