--NOTE:
local opt = vim.opt


opt.scrolloff     = 5     --scroll 时留下五行
opt.wrap          = false --不要换行
opt.fileencodings = 'utf-8'

-- smartindent = true --智能缩进-
opt.autoindent    = true --回车后下一行自动缩进
opt.shiftwidth    = 8    -- the number of spaces inserted for each indentation
opt.copyindent    = true --复制粘贴时保留原有的缩进
opt.tabstop       = 8    --一个tab键所占的列数
opt.expandtab     = true --自动将tab键输入转化为相应的空格数
--
opt.ignorecase    = true --搜索时忽略大小写
opt.hlsearch      = true --高亮显示搜索的匹配结果，输入结束时才显示
opt.incsearch     = true --高亮显示搜索的匹配过程，每输入一个字符，就自动跳到第一个匹配的结果：
opt.smartcase     = true --智能搜索
