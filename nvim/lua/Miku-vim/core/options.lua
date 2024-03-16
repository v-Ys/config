--NOTE:
local opt          = vim.opt

-- opt.autochdir      = true      -- auto cd
opt.termguicolors  = true --true color
opt.scrolloff      = 5 --scroll 时留下五行
opt.cursorline     = true --编辑行下划线
opt.wrap           = false --no wrap
opt.linebreak      = true --换行显示时不把一个单词拆开，遇到指定的符号（比如空格，连词号和其他标点符号）才换行
opt.numberwidth    = 3 --行号宽度
opt.number         = true --显示行号
opt.relativenumber = true --相对行数
opt.showtabline    = 0 -- don't showtabline
opt.signcolumn     = 'yes' -- sign colume
opt.list           = true -- 显示空白的符号
opt.fillchars      = { eob = " " } -- hide  "~"
opt.listchars      = { tab = '  ', extends = '⟩', precedes = '⟨', trail = '·' } --("eol:↴,tab:»·,trail:·")

--
opt.backup         = false -- bak file
opt.swapfile       = false
opt.errorbells     = false -- bells
--timeout
opt.ttm            = 0
opt.tm             = 0
opt.to             = false
--
opt.autowrite      = true                              --Enable auto write
opt.grepprg        = 'rg --vimgrep'                    --use rg
--
opt.shiftwidth     = 4                                 -- the number of spaces inserted for each indentation
opt.tabstop        = 8                                 --一个tab键所占的列数
opt.expandtab      = true                              --自动将tab键输入转化为相应的空格数
opt.smartindent    = true                              --智能缩进-
opt.autoindent     = true                              --回车后下一行自动缩进
opt.copyindent     = true                              --复制粘贴时保留原有的缩进
--
opt.ignorecase     = true                              --搜索时忽略大小写
opt.hlsearch       = true                              --高亮显示搜索的匹配结果，输入结束时才显示
opt.incsearch      = true                              --高亮显示搜索的匹配过程，每输入一个字符，就自动跳到第一个匹配的结果：
opt.smartcase      = true                              --智能搜索
opt.completeopt    = { 'menu', 'menuone', 'noselect' } --for cmp
opt.showcmd        = true                              --显示输入命令
opt.wildmenu       = true                              --在命令模式下，按下 tab 键可以自动补全命令
opt.wildmode       = 'longest:list,full'
--set fold
opt.foldcolumn     = '0' --show fold in line number
opt.foldlevel      = 99  -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable     = true
--fold by nvim_treesitter
-- opt.foldmethod     = 'expr'
-- opt.foldexpr       = 'nvim_treesitter#foldexpr()'


vim.g.rust_recommended_style = 0
vim.filetype.add({
    pattern = {
        [".*.typ"] = 'typst',
    },
})


-- diagnostic config
local signs = {
    { name = "DiagnosticSignError", text = "▎" },
    { name = "DiagnosticSignWarn", text = "▎" },
    { name = "DiagnosticSignHint", text = "▎" },
    { name = "DiagnosticSignInfo", text = "▎" },
    -- -   󰌕      ✎      ▎ ▏ │          
}
for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
    virtual_text = false,
    signs = {
        active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "single",
        source = "always",
        header = "",
        prefix = "",
    },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "single",
})
