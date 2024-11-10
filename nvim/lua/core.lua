--NOTE: options
local opt          = vim.opt
local keymap       = vim.keymap.set
local cmd          = vim.api.nvim_create_user_command
local autocmd      = vim.api.nvim_create_autocmd
local key_opts     = { noremap = true, silent = true }

opt.backup         = false
opt.swapfile       = false
opt.errorbells     = false
opt.autochdir      = false
opt.termguicolors  = true
opt.splitright     = true
opt.splitbelow     = true
opt.number         = true
opt.relativenumber = true
opt.numberwidth    = 3
opt.smartindent    = true  -- 智能缩进
opt.copyindent     = true  -- 自动缩进时，复制已有的行的缩进结构
opt.hlsearch       = true  -- 高亮显示搜索的匹配结果，输入结束时才显示
opt.incsearch      = true  -- 高亮显示搜索的匹配过程，每输入一个字符，就自动跳到第一个匹配的结果：
opt.ignorecase     = true  -- 搜索时忽略大小写
opt.smartcase      = true  -- 智能搜索
--
opt.wrap           = false --no wrap
opt.linebreak      = true  --换行显示时不把一个单词拆开，遇到指定的符号（比如空格，连词号和其他标点符号）才换行
opt.scrolloff      = 5
opt.showtabline    = 0
opt.signcolumn     = 'yes' -- sign colume
opt.list           = true
opt.listchars      = { tab = '  ', extends = '⟩', precedes = '⟨', trail = '·' } --("eol:↴,tab:»·,trail:·")
opt.fillchars      = { eob = " " } -- hide  "~"
opt.completeopt    = { 'menu', 'menuone', 'noselect', 'popup' } --for cmp
--set fold
opt.foldcolumn     = '0' --show fold in line number
opt.foldlevel      = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable     = true
--
opt.expandtab      = true -- tab->spaces
opt.shiftwidth     = 8    -- the number of spaces inserted for each indentation
opt.tabstop        = 8    -- 一个tab键所占的列数
opt.cursorline     = true
opt.conceallevel   = 0    -- Hide * ... 0: no ,1: leave space, 2:hide space



--NOTE: //
vim.g.rust_recommended_style = 0
vim.filetype.add({
        pattern = {
                [".*.typ"] = "typst",
                [".*.mdx"] = "markdown"
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
                source = "if_many",
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
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

keymap({ "i", }, "jk", "<esc>", key_opts)
keymap({ "n", "o", }, "L", "$", key_opts)
keymap({ "x" }, "L", "$h", key_opts)
keymap("", "H", "^", key_opts)
keymap("", "K", "5k", key_opts)
keymap("", "J", "5j", key_opts)
keymap("", ";;", "%", key_opts)
keymap("", ";z", "J", key_opts)
keymap("n", ";k", "<cmd>nohl<CR>", key_opts)
keymap("n", ";j", require("utils.M").highlightCword, key_opts)
--buffers
keymap({ 'n', 'i', 'x' }, "<M-m>", "<cmd>bn<cr>", key_opts)
keymap({ 'n', 'i', 'x' }, "<M-n>", "<cmd>bp<cr>", key_opts)
keymap({ 'n', 'i', 'x' }, "<M-w>", "<cmd>bd<cr>", key_opts)
-- Resize with arrows
keymap({ "n", "x" }, "<M-Up>", "<cmd>resize +2<CR>", key_opts)
keymap({ "n", "x" }, "<M-Down>", "<cmd>resize -2<CR>", key_opts)
keymap({ "n", "x" }, "<M-Left>", "<cmd>vertical resize -2<CR>", key_opts)
keymap({ "n", "x" }, "<M-Right>", "<cmd>vertical resize +2<CR>", key_opts)
-- Move  line / code block
keymap({ "n", "i" }, "<M-->", "<cmd>m .+1<CR>==", key_opts)
keymap({ "n", "i" }, "<M-=>", "<cmd>m .-2<CR>==", key_opts)
keymap({ "x" }, "<M-->", ":m '>+1<cr>gv=gv", key_opts)
keymap({ "x" }, "<M-=>", ":m '<-2<cr>gv=gv", key_opts)
keymap({ "n" }, "<", "<<", key_opts)
keymap({ "n" }, ">", ">>", key_opts)
keymap({ "x", }, "<", "<gv", key_opts)
keymap({ "x", }, ">", ">gv", key_opts)
--Plugin
keymap({ "n", "x" }, "f", require("flash").jump, key_opts)
keymap("n", "<leader>n", require('nvim-tree.api').tree.open, key_opts)
keymap("n", "<leader>j", require('telescope.builtin').buffers, key_opts)
keymap("n", "<Leader>fm", require('telescope.builtin').marks, key_opts)
keymap("n", "<leader>fr", require('telescope.builtin').builtin, key_opts)
keymap("n", "<leader>fh", require('telescope.builtin').oldfiles, key_opts)
keymap("n", "<leader>fl", require('telescope.builtin').live_grep, key_opts)
keymap("n", "<leader>ff", require('telescope.builtin').find_files, key_opts)
keymap("n", "<Leader>fs", require('telescope.builtin').colorscheme, key_opts)
keymap("n", "<leader>fp", require('utils.telescope_tools').zoxide, key_opts)
keymap("n", "<leader>fw", require('telescope.builtin').current_buffer_fuzzy_find, key_opts)
keymap({ "n" }, "<leader>m", require('utils.M').run, key_opts)
keymap({ "n" }, "tx", require('utils.M').trouble.close, key_opts)
keymap({ "n" }, "tj", require('utils.M').trouble.next, key_opts)
keymap({ "n" }, "tk", require('utils.M').trouble.prev, key_opts)
keymap("t", "<C-\\>", "<C-\\><C-N>", key_opts)



--NOTE: user command
cmd("FormatJSON", "%!python3 -m json.tool", {})
cmd("Bpwd", require('utils.M').BufferPwd, {})
cmd("CBpwd", require('utils.M').cdBufferPwd, {})




--NOTE: autocmd
autocmd("BufWritePre", {
        pattern = { "*.lua", "*.c", "*.cpp", "*.h", "*.rs", "*.go", "*.py", "*.js", "*.jsx", "*.mjs" },
        callback = function()
                vim.lsp.buf.format { sync = true }
        end,
        group = vim.api.nvim_create_augroup("AUTOFORMAT", { clear = true }),
})


autocmd({ "BufWinEnter" }, {
        callback = function()
                require("utils.lastplace").set_cursor_position()
        end,
        group = vim.api.nvim_create_augroup("LASTPLACE", { clear = true }),
})

autocmd("FileType", {
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

autocmd({ 'FileType' }, {
        pattern = { 'typst', },
        group = vim.api.nvim_create_augroup("TYPST", { clear = true }),
        callback = function()
                cmd("TypstFigures", "silent !mkdir figures", {})
        end,
})
