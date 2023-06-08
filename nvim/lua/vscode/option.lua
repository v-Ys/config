--NOTE:
local options = {
        scrolloff     = 5,     --scroll 时留下五行
        wrap          = false, --不要换行
        -- linebreak      = true, --换行显示时不把一个单词拆开，遇到指定的符号（比如空格，连词号和其他标点符号）才换行
        signcolumn    = 'yes',
        --
        fileencodings = 'utf-8',
        --
        -- smartindent = true, --智能缩进-
        autoindent    = true, --回车后下一行自动缩进
        shiftwidth    = 8,    -- the number of spaces inserted for each indentation
        copyindent    = true, --复制粘贴时保留原有的缩进
        tabstop       = 4,    --一个tab键所占的列数
        expandtab     = true, --自动将tab键输入转化为相应的空格数
        --
        ignorecase    = true, --搜索时忽略大小写
        hlsearch      = true, --高亮显示搜索的匹配结果，输入结束时才显示
        incsearch     = true, --高亮显示搜索的匹配过程，每输入一个字符，就自动跳到第一个匹配的结果：
        smartcase     = true, --智能搜索
        showcmd       = true, --显示输入命令
}


for k, v in pairs(options) do
        vim.opt[k] = v
end
