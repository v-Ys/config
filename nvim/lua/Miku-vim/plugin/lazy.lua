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

local plugins = require("Miku-vim.plugin.plugins")
local opts = {
        ui = {
                -- a number <1 is a percentage., >1 is a fixed size
                size = { width = 0.8, height = 0.8 },
                wrap = true, -- wrap the lines in the ui
                -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
                border = "rounded",
        },
        install = {
                colorscheme = { 'github_light' },
        }
}

require("lazy").setup(plugins, opts)
