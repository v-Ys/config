return {
        --NOTE: theme
        {
                'projekt0n/github-nvim-theme',
                -- version = "v0.0.7",
                config = function()
                        require('github-theme').setup({
                                theme_style = "light",
                                colors = { bg2 = "#1E50A2" },
                        })
                end,
        },
        { "EdenEast/nightfox.nvim", },

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

        --PLUG: alpha
        {
                'goolord/alpha-nvim',
                config = function()
                        require("Miku-vim.plugin.conf.alpha")
                end,
        },
        --PLUG: indentline
        {
                'lukas-reineke/indent-blankline.nvim',
                config = function()
                        require("indent_blankline").setup {
                                show_end_of_line = true,
                        }
                        vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
                        vim.g.indent_blankline_filetype_exclude = {
                                "help",
                                "packer",
                                "neogitstatus",
                                "neo-tree",
                                "Trouble",
                        }
                end,
        },
        --PLUG:bufferline
        {
                'akinsho/bufferline.nvim',
                version = "v3.*",
                config = function()
                        require("Miku-vim.plugin.conf.bufferline")
                end,
        },

        --PLUG:cmp
        {
                'hrsh7th/nvim-cmp',
                dependencies = {
                        { 'hrsh7th/cmp-nvim-lsp' },
                        { 'hrsh7th/cmp-buffer' },
                        { 'hrsh7th/cmp-path' },
                        { 'hrsh7th/cmp-cmdline' },
                        --NOTE: snip,
                        {
                                'saadparwaiz1/cmp_luasnip',
                                dependencies = {
                                        { "L3MON4D3/LuaSnip", },
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
                        {
                                'williamboman/mason.nvim',
                                opts = {
                                        max_concurrent_installers = 10,
                                        ui = {
                                                icons = {
                                                        package_installed = "",
                                                        package_pending = "",
                                                        package_uninstalled = "",
                                                },
                                                border = "rounded",
                                        },
                                },
                        },
                        { 'ray-x/lsp_signature.nvim', },
                },
                config = function()
                        require("Miku-vim.plugin.conf.lsp")
                end,
        },
        -- PLUG: for fold  !!! Please load plugin afer lsp
        {
                'kevinhwang91/nvim-ufo',
                dependencies = 'kevinhwang91/promise-async',
                config = true,
                event = "VeryLazy",
        },
        --PLUG: null-ls for formatters and linters
        {
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                        local null_ls = require("null-ls")
                        local formatting = null_ls.builtins.formatting
                        -- local completion = null_ls.builtins.completion
                        null_ls.setup({
                                debug = false,
                                sources = {
                                        formatting.autopep8, -- for python
                                        -- completion.spell,
                                },
                        })
                end
        },
        --PLUG: Telescope,
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
                config = function()
                        require("nvim-treesitter.configs").setup({
                                ensure_installed = { "rust", "c", "cpp", "lua" },
                                sync_install = false,
                                highlight = {
                                        enable = true,
                                        -- additional_vim_regex_highlighting = true,
                                },
                                indent = {
                                        enable = true
                                }
                        })
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
        },
        --PLUG: add align
        {
                'junegunn/vim-easy-align',
                config = function()
                        vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", { noremap = true, silent = true })
                        vim.api.nvim_set_keymap("v", "ga", "<Plug>(EasyAlign)", { noremap = true, silent = true })
                end,
                event = "VeryLazy",
        },
        --PLUG: lastplace
        {
                'ethanholz/nvim-lastplace',
                opts = {
                        lastplace_ignore_buftype  = { "quickfix", "nofile", "help" },
                        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
                        lastplace_open_folds      = true
                },
        },
        --PLUG: todo
        {
                'folke/todo-comments.nvim',
                opts = {
                        keywords = {
                                -- alt ： 别名
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
                event = "VeryLazy",
        },
        --PLUG: toggleterm
        {
                "akinsho/toggleterm.nvim",
                version = '*',
                opts = {
                        size = 20,
                        open_mapping = [[<A-m>]],
                        hide_numbers = true,
                        shade_filetypes = {},
                        shade_terminals = true,
                        shading_factor = 2,
                        start_in_insert = true,
                        insert_mappings = true,
                        persist_size = true,
                        direction = "float",
                        close_on_exit = true,
                        shell = vim.o.shell,
                        float_opts = {
                                border = "curved",
                                winblend = 0,
                                highlights = {
                                        border = "Normal",
                                        background = "Normal",
                                },
                        },
                },
                event = "VeryLazy",
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
                config = function()
                        vim.g.tex_flavor = 'latex' -- Default tex file format

                        -- vim.g.vimtex_indent_bib_enabled = 0
                        -- vim.g.vimtex_indent_enabled = 0

                        vim.g.vimtex_complete_enabled = 0
                        -- Disable imaps (using Ultisnips)
                        vim.g.vimtex_imaps_enabled = 0
                        -- auto open quickfix on compile erros
                        vim.g.vimtex_quickfix_mode = 0
                        vim.g.vimtex_view_method = 'skim'

                        vim.g.vimtex_compiler_latexmk_engines = {
                                _        = '-lualatex',
                                pdflatex = '-pdf',
                                dvipdfex = '-pdfdvi',
                                lualatex = '-lualatex',
                                xelatex  = '-xelatex',
                        }
                end,
                dependencies = {
                        'ybian/smartim',
                        config = function()
                                vim.g.smartim_default = 'com.apple.keylayout.ABC'
                        end
                },
                ft = "tex",
        },
        --PLUG: markdown
        {
                'iamcco/markdown-preview.nvim',
                dependencies = {
                        'ybian/smartim',
                        config = function()
                                vim.g.smartim_default = 'com.apple.keylayout.ABC'
                        end
                },
                ft = 'markdown',
        },
        -- --PLUG: show color
        -- {
        --         'NvChad/nvim-colorizer.lua',
        --         -- cmd = "COLLLLLor",
        --         config = function()
        --                 require("colorizer").setup {
        --                         filetypes = { "lua" },
        --
        --                 }
        --         end
        -- },

        --PLUG: diff view
        --
        -- {
        -- 'sindrets/diffview.nvim',
        -- dependencies = 'nvim-lua/plenary.nvim'
        -- },
        --
        --

        {
                'Th3Whit3Wolf/one-nvim',
                event = "VeryLazy",
        },
        {
                "sainnhe/edge",
                event = "VeryLazy",
        },
        {
                'sonph/onehalf',
                config = function(plugin)
                        vim.opt.rtp:append(plugin.dir .. "/vim")
                end,
                event = "VeryLazy",
        },
        {
                "sainnhe/everforest",
                event = "VeryLazy",
        },
        {
                "catppuccin/nvim",
                name = "catppuccin",
                -- config = function()
                --         vim.cmd.colorscheme "catppuccin"
                -- end,
                event = "VeryLazy",
        },
}
