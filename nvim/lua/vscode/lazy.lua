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
                        require('leap').opts.safe_labels = { 'f', 'e', 'j', 'k', 'i', 'n', 'c', 'w', 'r', 'o', 'a', 's',
                                'd', 't', 'g', 'v', 'm',
                                'l',
                                'q', 'x', 'b' }
                end,
        },

        --PLUG: surround
        {
                'tpope/vim-surround',
                config = function()
                end,
        },
        --PLUG: enhance '.' for surround
        {
                'tpope/vim-repeat',
                config = function()
                end,
        },
        --PLUG: markdown
        {
                'ybian/smartim',
                -- ft = {
                --         'markdown',
                --         'latex'
                -- },
                config = function()
                        vim.g.smartim_default = 'com.apple.keylayout.ABC'
                end
        },
}
local options = {
        -- colorscheme = { 'github_light' }
}
require("lazy").setup(plugins, options)
