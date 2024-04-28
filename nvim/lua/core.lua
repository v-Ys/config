--NOTE: options
local opt          = vim.opt
local keymap       = vim.keymap.set
local cmd          = vim.api.nvim_create_user_command
local key_opts     = { noremap = true, silent = true }

-- opt.autochdir      = true      -- auto cd
opt.termguicolors  = true  --true color
opt.scrolloff      = 5     --scroll 时留下五行
opt.cursorline     = false
opt.wrap           = false --no wrap
opt.linebreak      = true  --换行显示时不把一个单词拆开，遇到指定的符号（比如空格，连词号和其他标点符号）才换行
opt.numberwidth    = 3     --行号宽度
opt.number         = true
opt.relativenumber = true
opt.showtabline    = 0 -- don't showtabline
opt.signcolumn     = 'yes' -- sign colume
opt.list           = true -- 显示空白的符号
opt.fillchars      = { eob = " " } -- hide  "~"
opt.listchars      = { tab = '  ', extends = '⟩', precedes = '⟨', trail = '·' } --("eol:↴,tab:»·,trail:·")
opt.splitright     = true
opt.splitbelow     = true

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
opt.shiftwidth     = 8                                 -- the number of spaces inserted for each indentation
opt.tabstop        = 8                                 --一个tab键所占的列数
opt.expandtab      = true                              --自动将tab键输入转化为相应的空格数
opt.smartindent    = true                              --智能缩进-
opt.autoindent     = true                              --回车后下一行自动缩进
opt.copyindent     = true                              --复制粘贴时保留原有的缩进
--
opt.ignorecase     = true                              --搜索时忽略大小写
opt.smartcase      = true                              --智能搜索
opt.hlsearch       = true                              --高亮显示搜索的匹配结果，输入结束时才显示
opt.incsearch      = true                              --高亮显示搜索的匹配过程，每输入一个字符，就自动跳到第一个匹配的结果：
opt.completeopt    = { 'menu', 'menuone', 'noselect' } --for cmp
opt.showcmd        = true                              --显示输入命令
opt.wildmenu       = true                              --在命令模式下，按下 tab 键可以自动补全命令
opt.wildmode       = 'longest:list,full'
--set fold
opt.foldcolumn     = '0' --show fold in line number
opt.foldlevel      = 99  -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable     = true




--NOTE: //
vim.g.rust_recommended_style = 0
vim.filetype.add({
        pattern = {
                [".*.typ"] = 'typst',
        },
})




--NOTE: diagnostic config
local signs = {
        { name = "DiagnosticSignError", text = "▎" },
        { name = "DiagnosticSignWarn", text = "▎" },
        { name = "DiagnosticSignHint", text = "▎" },
        { name = "DiagnosticSignInfo", text = "▎" },
        --   󰌕   ✎   ▎ ▏ │             
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




--NOTE: lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable",
                lazypath,
        })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
        spec = {
                { import = "plugins" },
        },
        ui = {
                border = "single",
        },
        install = {
                colorscheme = { 'github_light', },
        },
        performance = {
                rtp = {
                        disabled_plugins = {
                                "2html_plugin",
                                "tohtml",
                                "getscript",
                                "getscriptPlugin",
                                "gzip",
                                "logipat",
                                "netrw",
                                "netrwPlugin",
                                "netrwSettings",
                                "netrwFileHandlers",
                                "matchit",
                                "tar",
                                "tarPlugin",
                                "rrhelper",
                                "spellfile_plugin",
                                "vimball",
                                "vimballPlugin",
                                "zip",
                                "zipPlugin",
                                "tutor",
                                "rplugin",
                                "syntax",
                                "synmenu",
                                "optwin",
                                "compiler",
                                "bugreport",
                                "ftplugin",
                        },
                },
        },
})




--NOTE: mode
-- insert_mode       = "i",
-- normal_mode       = "n",
-- term_mode         = "t",
-- visual_mode       = "v",
-- visual_block_mode = "x",
-- command_mode      = "c",
-- operator_mode     = "o",
-- select_mode       = "s"

keymap({ "n" }, ";k", "<cmd>nohl<CR>", key_opts)
keymap({ "n", "o", }, "L", "$", key_opts)
keymap({ "x" }, "L", "$h", key_opts)
keymap("", "K", "5k", key_opts)
keymap("", "J", "5j", key_opts)
keymap("", "H", "^", key_opts)
keymap("", ";;", "%", key_opts)
keymap("", ";z", "J", key_opts)
keymap("n", ";j", require("utils.M").highlightCword, key_opts)
--buffers
keymap({ 'n', 'i', 'x', }, "<A-]>", "<cmd>bn<cr>", key_opts)
keymap({ 'n', 'i', 'x', }, "<A-[>", "<cmd>bp<cr>", key_opts)
keymap({ 'n', 'i', 'x', }, "<C-]>", "<cmd>bd<cr>", key_opts)
-- Resize with arrows
keymap({ "n", "x", }, "<A-Up>", "<cmd>resize +2<CR>", key_opts)
keymap({ "n", "x", }, "<A-Down>", "<cmd>resize -2<CR>", key_opts)
keymap({ "n", "x", }, "<A-Left>", "<cmd>vertical resize -2<CR>", key_opts)
keymap({ "n", "x", }, "<A-Right>", "<cmd>vertical resize +2<CR>", key_opts)
-- Move  line / code block
keymap({ "n" }, "<A-->", "<cmd>m .+1<CR>==", key_opts)
keymap({ "n", }, "<A-=>", "<cmd>m .-2<CR>==", key_opts)
keymap({ "x", }, "<A-->", ":m '>+1<cr>gv=gv", key_opts)
keymap({ "x", }, "<A-=>", ":m '<-2<cr>gv=gv", key_opts)
keymap({ "n" }, "<", "<<", key_opts)
keymap({ "n" }, ">", ">>", key_opts)
keymap({ "x", }, "<", "<gv", key_opts)
keymap({ "x", }, ">", ">gv", key_opts)
--Plugin
keymap({ "n", "x" }, "<leader>n", require('nvim-tree.api').tree.open, key_opts)
keymap({ "n" }, "<leader>j", require('telescope.builtin').buffers, key_opts)
keymap({ "n" }, "<Leader>fm", require('telescope.builtin').marks, key_opts)
keymap({ "n" }, "<leader>fr", require('telescope.builtin').builtin, key_opts)
keymap({ "n" }, "<leader>fh", require('telescope.builtin').oldfiles, key_opts)
keymap({ "n" }, "<leader>fl", require('telescope.builtin').live_grep, key_opts)
keymap({ "n" }, "<leader>ff", require('telescope.builtin').find_files, key_opts)
keymap({ "n" }, "<Leader>fs", require('telescope.builtin').colorscheme, key_opts)
keymap({ "n" }, "<leader>fp", require('utils.telescope_tools').zoxide, key_opts)
keymap({ "n" }, "<leader>fw", require('telescope.builtin').current_buffer_fuzzy_find, key_opts)
keymap({ "n", "v", "x", }, "f", require("flash").jump, key_opts)
keymap({ "n", }, "tj", function() require("trouble").next({ skip_groups = true, jump = true }); end, key_opts)
keymap({ "n", }, "tk", function() require("trouble").previous({ skip_groups = true, jump = true }); end, key_opts)
-- Terminal
keymap({ "t", }, "<C-\\>", "<C-\\><C-N>", key_opts)
-- run code
keymap({ "n" }, "<leader>m", require('utils.M').run, key_opts)




--NOTE: user command
cmd("FormatJSON", "%!python3 -m json.tool", {})
cmd("BufferPwd", "lua require('utils.M').BufferPwd()<CR>", {})


--NOTE: autocmd

vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.lua", "*.c", "*.cpp", "*.h", "*.rs", "*.go", "*.py", },
        callback = function()
                vim.lsp.buf.format { sync = true }
        end,
        group = vim.api.nvim_create_augroup("AUTOFORMAT", { clear = true }),
})

vim.api.nvim_create_autocmd("FileType", {
        pattern = { 'markdown', 'typst', },
        group = vim.api.nvim_create_augroup("WRITING", { clear = true }),
        callback = function()
                vim.opt_local.tabstop     = 4
                vim.opt_local.shiftwidth  = 4
                vim.opt_local.softtabstop = 4
                vim.opt_local.wrap        = true

                keymap({ "x", "n" }, "j", "gj", { silent = true, buffer = true })
                keymap({ "x", "n" }, 'k', "gk", { silent = true, buffer = true })

                keymap("", "H", "g^", { silent = true, buffer = true })
                keymap("", "L", "g$", { silent = true, buffer = true })
        end,
})



vim.api.nvim_create_autocmd({ 'FileType' },
        {
                pattern = { 'typst', },
                group = vim.api.nvim_create_augroup("TYPST", { clear = true }),
                callback = function()
                        vim.api.nvim_create_user_command("TypstFigures",
                                "silent !mkdir figures",
                                {})
                end,
        })
