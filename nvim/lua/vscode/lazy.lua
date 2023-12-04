vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })

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

local plugins = {

        --PLUG: comment
        {
                'numToStr/Comment.nvim',
                config = true,
        },
        --PLUG: leap

        {
                "folke/flash.nvim",
                event = "VeryLazy",
                opts = {
                        modes = {

                                char = {
                                        enabled = false,
                                },
                                search = {
                                        enabled = false,
                                },
                        },
                        highlight = {
                                backdrop = false,
                        },
                        jump = {
                                forward = true,
                                wrap = true,
                        },
                },
                keys = {
                        {
                                "f",
                                mode = { "n", "v", "x" },
                                function()
                                        require("flash").jump()
                                end,
                                desc = "Flash"
                        },
                },
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
