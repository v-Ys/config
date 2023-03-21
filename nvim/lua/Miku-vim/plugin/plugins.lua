return {
        --NOTE: theme
        { 'Th3Whit3Wolf/one-nvim' },
        { "EdenEast/nightfox.nvim" },
        { "sainnhe/edge" },
        {
                'sonph/onehalf',
                config = function(plugin)
                        vim.opt.rtp:append(plugin.dir .. "/vim")
                end
        },
        {
                'projekt0n/github-nvim-theme',
                version = "v0.0.7",
                config = function()
                        require('github-theme').setup({
                                theme_style = "light",
                        })
                end,
        },
        { "catppuccin/nvim",             name = "catppuccin" },
        { "sainnhe/everforest", },

        --NOTE: UI
        --
        --icons
        { 'nvim-tree/nvim-web-devicons', },

        --lualine
        {
                'nvim-lualine/lualine.nvim',
                config = function()
                        require('Miku-vim.plugin.conf.lualine')
                end
        },

        --PLUG:alpha
        {
                'goolord/alpha-nvim',
                config = function()
                        require("Miku-vim.plugin.conf.alpha")
                end,
        },
        --PLUG:indentline
        {
                'lukas-reineke/indent-blankline.nvim',
                config = function()
                        require("indent_blankline").setup {
                                show_end_of_line = true,
                        }
                        vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
                        vim.g.indent_blankline_filetype_exclude = {
                                "help",
                                "dashboard",
                                "packer",
                                "neogitstatus",
                                "NvimTree",
                                "Trouble",
                        }
                end,
        },
        --PLUG:bufferline
        {
                'akinsho/bufferline.nvim',
                version = "v2.*",
                config = function()
                        require("Miku-vim.plugin.conf.bufferline")
                end,
        },

        --PLUG:cmp
        {
                'hrsh7th/nvim-cmp',
                dependencies = {
                        { 'hrsh7th/cmp-nvim-lsp' }, --for lsp
                        { 'hrsh7th/cmp-buffer' },   -- buffer completions
                        { 'hrsh7th/cmp-path' },     -- path completions
                        { 'hrsh7th/cmp-cmdline' },  -- cmdline completions
                        --NOTE:snip,
                        {
                                'saadparwaiz1/cmp_luasnip',
                                dependencies = {
                                        --snippet engine
                                        { "L3MON4D3/LuaSnip", },
                                        -- a bunch of snippets to
                                        { 'rafamadriz/friendly-snippets', },
                                }
                        },
                },
                config = function()
                        require("Miku-vim.plugin.conf.cmp")
                end,
        },

        --PLUG:LSP
        {
                'neovim/nvim-lspconfig',
                dependencies = {
                        { 'williamboman/mason.nvim' },         -- install lsp server
                        { "jose-elias-alvarez/null-ls.nvim" }, -- for formatters and linters
                        { 'ray-x/lsp_signature.nvim', },       -- fun signature
                },
                config = function()
                        require("Miku-vim.plugin.conf.lsp")
                end,
        },
        --PLUG:Telescope,
        {
                'nvim-telescope/telescope.nvim',
                dependencies = {
                        { 'nvim-lua/plenary.nvim' },
                        { 'nvim-telescope/telescope-project.nvim' }, --project },
                        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', },
                },
                config = function()
                        require('Miku-vim.plugin.conf.telescope')
                end
        },
        --PLUG: treesitter
        {
                'nvim-treesitter/nvim-treesitter',
                build = ':TSUpdate',
                dependencies = {
                        'kevinhwang91/nvim-ufo',
                        dependencies = 'kevinhwang91/promise-async'
                }, --for fold
                config = function()
                        require('Miku-vim.plugin.conf.treesitter')
                end,
        },
        --PLUG: autopairs
        {
                'windwp/nvim-autopairs',
                config = true,
        },
        --PLUG: comment
        {
                'numToStr/Comment.nvim',
                config = true,
        },
        --PLUG: vim surround
        {
                'tpope/vim-surround',
        },
        --PLUG: enhance '.' for surround
        {
                'tpope/vim-repeat',
                config = function()
                        vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", { noremap = true, silent = true })
                        vim.api.nvim_set_keymap("v", "ga", "<Plug>(EasyAlign)", { noremap = true, silent = true })
                end,
        },
        --PLUG: add align
        {
                'junegunn/vim-easy-align',
        },
        --PLUG: lastplace
        {
                'ethanholz/nvim-lastplace',
                opts = {
                        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
                        lastplace_open_folds = true
                },
        },
        --PLUG: todo
        {
                'folke/todo-comments.nvim',
                opts = {
                        keywords = {
                                -- alt ： 别名
                                --
                                FIX = {
                                        icon = " ",
                                        color = "#C0392B",
                                        alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "!" }
                                },
                                TODO = { icon = " ", color = "#AF7AC5", alt = { "PLUG" } },
                                HACK = { icon = " ", color = "#7C3AED" },
                                WARN = { icon = " ", color = "#E74C3C", alt = { "WARNING", "XXX" } },
                                PERF = { icon = " ", color = "#5DADE2", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                                NOTE = { icon = " ", color = "#10B981", alt = { "INFO" } }
                        },
                },
        },
        --PLUG: easy motion
        {
                'ggandor/leap.nvim',
                config = function()
                        require('leap').opts.safe_labels = { 'f', 'e', 'j', 'k', 'i', 'n', 'c', 'w', 'r', 'o',
                                'a', 's', 'd', 't', 'g', 'v', 'm', 'l', 'q', 'x', 'b' }
                end,
        },
        --PLUG: toggleterm
        {
                "akinsho/toggleterm.nvim",
                version = '*',
                config = function()
                        require("Miku-vim.plugin.conf.toggleterm")
                end,
        },
        --PLUG: neotree
        {
                "nvim-neo-tree/neo-tree.nvim",
                branch = "v2.x",
                dependencies = "MunifTanjim/nui.nvim", --for neotree
                config = function()
                        require("Miku-vim.plugin.conf.neotree")
                end,
        },
        --PLUG: leetcode
        {
                'ianding1/leetcode.vim',
                dependencies = 'caenrique/nvim-maximize-window-toggle',
                config = function()
                        vim.g.leetcode_browser = 'chrome'
                        vim.g.leetcode_solution_filetype = 'rust'
                end,
                cmd = "LeetCode",
        },
        --PLUG: latex
        {
                'lervag/vimtex',
                ft = "tex",
        },
        --PLUG: markdown
        {
                'iamcco/markdown-preview.nvim',
                dependencies = 'ybian/smartim',
                ft = 'markdown',
        },

        --PLUG: show color
        -- {
        --         "norcalli/nvim-colorizer.lua",
        --         config = function()
        --                 vim.opt.termguicolors = true
        --         end
        -- },
        --PLUG: diff view
        -- {
        -- 'sindrets/diffview.nvim',
        -- dependencies = 'nvim-lua/plenary.nvim'
        -- },
}
