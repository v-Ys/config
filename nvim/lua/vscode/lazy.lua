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

        { 'numToStr/Comment.nvim',
                config = function()
                        require("Comment").setup()
                end,
        }, --comment
        { 'ggandor/leap.nvim',
                config = function()

                        require('leap').opts.safe_labels = { 'f', 'e', 'j', 'k', 'i', 'n', 'c', 'w', 'r', 'o', 'a', 's',
                                'd', 't', 'g', 'v', 'm',
                                'l',
                                'q', 'x', 'b' }
                end,
        },

        { 'tpope/vim-surround',
                config = function()
                end,
        },
        -- enhance '.' for surround
        { 'tpope/vim-repeat',
                config = function()
                end,
        },
}
local options = {
        -- colorscheme = { 'github_light' }
}
require("lazy").setup(plugins, options)
