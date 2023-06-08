--NOTE:
local options = {
        termguicolors  = true,  --真彩模式
        scrolloff      = 5,     --scroll 时留下五行
        cursorline     = true,  --编辑行下划线
        wrap           = false, --不要换行
        -- linebreak      = true, --换行显示时不把一个单词拆开，遇到指定的符号（比如空格，连词号和其他标点符号）才换行
        numberwidth    = 3,     --行号宽度
        number         = true,  --显示行号
        relativenumber = true,  --相对行数
        signcolumn     = 'yes',
        list           = true,
        fillchars      = ({ eob = ' ' }), -- hide the "~" at the start of an empty line
        listchars      = ("trail:·,tab:»·"),
        showtabline    = 0,               -- don't showtabline
        -- laststatus     = 3, --always show statusline on the bottom
        -- listchars      = ("eol:↴,tab:»·,trail:·"),
        -- autochdir      = true,
        --
        backup         = false, --禁止生成临时文件
        swapfile       = false,
        errorbells     = false, --关闭错误信息响铃
        fileencodings  = 'utf-8',
        --
        -- smartindent    = true,                              --智能缩进-
        autoindent     = true,                              --回车后下一行自动缩进
        shiftwidth     = 8,                                 -- the number of spaces inserted for each indentation
        copyindent     = true,                              --复制粘贴时保留原有的缩进
        tabstop        = 8,                                 --一个tab键所占的列数
        expandtab      = true,                              --自动将tab键输入转化为相应的空格数
        --
        ignorecase     = true,                              --搜索时忽略大小写
        hlsearch       = true,                              --高亮显示搜索的匹配结果，输入结束时才显示
        incsearch      = true,                              --高亮显示搜索的匹配过程，每输入一个字符，就自动跳到第一个匹配的结果：
        smartcase      = true,                              --智能搜索
        completeopt    = { 'menu', 'menuone', 'noselect' }, --for cmp
        showcmd        = true,                              --显示输入命令
        wildmenu       = true,                              --在命令模式下，按下 tab 键可以自动补全命令
        wildmode       = 'longest:list,full',
        --set fold
        --foldcolumn = 1, --show fold in line number
        foldlevel      = 99, -- Using ufo provider need a large value, feel free to decrease the value
        foldlevelstart = 99,
        foldenable     = true,
        foldmethod     = 'expr',
        foldexpr       = 'nvim_treesitter#foldexpr()',
        --
        -- bg             = 'dark'
        bg             = 'light',

}

vim.g.rust_recommended_style = 0

for k, v in pairs(options) do
        vim.opt[k] = v
end
