vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable", -- latest stable release
                lazypath,
        })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

        --PLUG: comment
        {
                'numToStr/Comment.nvim',
                config = function()
                        require("Comment").setup()
                end,
        },
        --PLUG: leap
        {
                'ggandor/leap.nvim',
                config = function()
                        require("leap").opts.safe_labels = {
                                "f",
                                "e",
                                "h",
                                "i",
                                "n",
                                "c",
                                "w",
                                "r",
                                "o",
                                "a",
                                "s",
                                "d",
                                "t",
                                "g",
                                "v",
                                "m",
                                "l",
                                "q",
                                "x",
                                "b",
                        }
                        vim.api.nvim_set_hl(0, 'LeapBackdrop', { fg = '' })
                end,
        },

        --PLUG: surround
        {
                "kylechui/nvim-surround",
                version = "*",
                event = "VeryLazy",
                config = true,
        },
        --PLUG: markdown
        {
                'ybian/smartim',
                ft = {
                        'markdown',
                        'latex'
                },
                config = function()
                        vim.g.smartim_default = 'com.apple.keylayout.ABC'
                end
        },
}
local options = {
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
}
require("lazy").setup(plugins, options)
