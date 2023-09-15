return {
        --NOTE: theme
        {
                "projekt0n/github-nvim-theme",
                opts = {},
                config = function()
                        vim.cmd.colorscheme "github_light"
                end,
        },
        {
                "sainnhe/edge",
                "EdenEast/nightfox.nvim",
                {
                        "catppuccin/nvim",
                        name = "catppuccin",
                },
                event = "VeryLazy",
        },
        --NOTE: UI
        --
        --icons
        { "nvim-tree/nvim-web-devicons" },
        --lualine
        {
                "nvim-lualine/lualine.nvim",
                config = function()
                        require("Miku-vim.plugin.conf.lualine")
                end,
        },

        --PLUG: alpha
        {
                "goolord/alpha-nvim",
                config = function()
                        require("Miku-vim.plugin.conf.alpha")
                end,
        },
        --PLUG: indentline
        {
                "lukas-reineke/indent-blankline.nvim",
                config = function()
                        require("indent_blankline").setup({
                                show_end_of_line = true,
                        })
                        vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile", "neo-tree" }
                        vim.g.indent_blankline_filetype_exclude = {
                                "help",
                                "packer",
                                "neogitstatus",
                                "neo-tree",
                                "Trouble",
                        }
                end,
        },

        --PLUG:cmp
        {
                "hrsh7th/nvim-cmp",
                dependencies = {
                        "hrsh7th/cmp-nvim-lsp",
                        "hrsh7th/cmp-buffer",
                        "hrsh7th/cmp-path",
                        "hrsh7th/cmp-cmdline",
                        "windwp/nvim-autopairs",
                        --NOTE: snip,
                        {
                                "saadparwaiz1/cmp_luasnip",
                                dependencies = {
                                        "L3MON4D3/LuaSnip",
                                        "rafamadriz/friendly-snippets",
                                },
                        },
                },
                config = function()
                        require("Miku-vim.plugin.conf.cmp")
                end,
        },

        --PLUG:LSP
        {
                "neovim/nvim-lspconfig",
                dependencies = {
                        {
                                "williamboman/mason.nvim",
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
                },
                config = function()
                        require("Miku-vim.plugin.conf.lsp")
                end,
        },
        -- PLUG: for fold  !!! Please load plugin afer lsp
        {
                "kevinhwang91/nvim-ufo",
                dependencies = "kevinhwang91/promise-async",
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
                                        formatting.black, -- for python
                                        -- completion.spell,
                                },
                        })
                end,
        },
        --PLUG: FZF
        {
                "ibhagwan/fzf-lua",
                dependencies = { "nvim-tree/nvim-web-devicons" },
                config = function()
                        local actions = require "fzf-lua.actions"
                        require 'fzf-lua'.setup {
                                winopts      = {
                                        border  = 'single',
                                        preview = {
                                                scrollchars = { '', '' }, -- scrollbar chars ({ <full>, <empty> }
                                        }
                                },
                                keymap       = {
                                        builtin = {
                                                ["ctrl-;"] = "preview-page-down",
                                                ["ctrl-'"] = "preview-page-up",
                                        },
                                },
                                files        = {

                                        winopts = {

                                                height  = 0.60,
                                                width   = 0.45,
                                                row     = 0.23, -- 0=top, 1=bottom
                                                col     = 0.5,  -- 0=left, 1=right
                                                preview = {
                                                        layout   = 'vertical',
                                                        vertical = 'up:50%',
                                                }
                                        },
                                },

                                oldfiles     = {
                                        winopts   = {
                                                height = 0.33, -- window height
                                                width  = 0.45, -- window width
                                                row    = 0.43, -- window row position (0=top, 1=bottom)
                                                col    = 0.5,  -- window col position (0=left, 1=right)

                                        },
                                        previewer = false,
                                },

                                colorschemes = {
                                        live_preview = false,
                                        winopts      = {
                                                height = 0.33, -- window height
                                                width  = 0.45, -- window width
                                                row    = 0.43, -- window row position (0=top, 1=bottom)
                                                col    = 0.5,  -- window col position (0=left, 1=right)

                                        },
                                },
                                buffers      = {
                                        previewer = false,
                                        actions = {
                                                ["ctrl-d"] = { fn = actions.buf_del, reload = true },
                                                ["ctrl-x"] = { fn = actions.buf_switch, reload = true },
                                        },
                                        winopts = {
                                                height = 0.33, -- window height
                                                width  = 0.45, -- window width
                                                row    = 0.43, -- window row position (0=top, 1=bottom)
                                                col    = 0.5,  -- window col position (0=left, 1=right)

                                        },
                                },
                                tabs         = {
                                        previewer = false,
                                        actions = {
                                                ["ctrl-d"] = { fn = actions.buf_del, reload = true },
                                                ["ctrl-x"] = { fn = actions.buf_switch, reload = true },
                                        },
                                        winopts = {
                                                height = 0.33, -- window height
                                                width  = 0.45, -- window width
                                                row    = 0.43, -- window row position (0=top, 1=bottom)
                                                col    = 0.5,  -- window col position (0=left, 1=right)

                                        },
                                },
                        }
                end
        },
        --PLUG: treesitter
        {
                "nvim-treesitter/nvim-treesitter",
                dependencies = "RRethy/nvim-treesitter-textsubjects",
                build = ":TSUpdate",
                config = function()
                        require("nvim-treesitter.configs").setup({
                                ensure_installed = { "rust", "c", "cpp", "lua" },
                                sync_install = false,
                                highlight = {
                                        enable = true,
                                        -- additional_vim_regex_highlighting = true,
                                },
                                indent = {
                                        enable = true,
                                },
                                incremental_selection = {
                                        enable = true,
                                        keymaps = {
                                                node_incremental = "v",
                                                node_decremental = "<BS>",
                                                init_selection = false,
                                                scope_incremental = false,
                                        },

                                },
                                textsubjects = {
                                        enable = true,
                                        prev_selection = '.',
                                        keymaps = {
                                                ['<CR>'] = 'textsubjects-smart',
                                        },
                                },
                        })
                end,
        },
        --PLUG: Git
        {
                'sindrets/diffview.nvim',
                dependencies = 'nvim-lua/plenary.nvim',
                cmd = "DiffviewOpen",
        },
        --PLUG: autopairs
        {
                "windwp/nvim-autopairs",
                config = function()
                        require("nvim-autopairs").setup {
                                disable_filetype = { "TelescopePrompt" },
                                enable_check_bracket_line = false
                        }
                        require("nvim-autopairs").get_rules("'")[1].not_filetypes = { "scheme", "lisp" }
                end
        },
        --PLUG: comment
        {
                "numToStr/Comment.nvim",
                config = true,
        },
        --PLUG: surround
        {
                "kylechui/nvim-surround",
                version = "*",
                event = "VeryLazy",
                config = true,
        },
        --PLUG: lastplac
        {
                "ethanholz/nvim-lastplace",
                opts = {
                        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
                        lastplace_open_folds = true,
                },
        },
        --PLUG: todo
        {
                "folke/todo-comments.nvim",
                opts = {
                        keywords = {
                                -- alt ： 别名
                                FIX = {
                                        icon = " ",
                                        color = "#C0392B",
                                        alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "!" },
                                },
                                TODO = { icon = " ", color = "#AF7AC5", alt = { "PLUG" } },
                                HACK = { icon = " ", color = "#7C3AED" },
                                WARN = { icon = " ", color = "#E74C3C", alt = { "WARNING", "XXX" } },
                                PERF = { icon = " ", color = "#5DADE2", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                                NOTE = { icon = " ", color = "#10B981", alt = { "INFO" } },
                        },
                },
        },
        --PLUG: easy motion
        {
                "ggandor/leap.nvim",
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
                event = "VeryLazy",
        },
        --PLUG: toggleterm
        {
                "akinsho/toggleterm.nvim",
                version = "*",
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
        --PLUG: Oil
        {
                'stevearc/oil.nvim',
                dependencies = { "nvim-tree/nvim-web-devicons" },
                opts = {
                        keymaps = {
                                ["g?"] = "actions.show_help",
                                ["<Right>"] = "actions.select",
                                ["<C-v>"] = "actions.select_vsplit",
                                ["<C-s>"] = "actions.select_split",
                                ["<C-t>"] = "actions.select_tab",
                                ["<M-p>"] = "actions.preview",
                                ["n"] = "actions.close",
                                ["q"] = "actions.close",
                                ["<C-r>"] = "actions.refresh",
                                ["<Left>"] = "actions.parent",
                                ["H"] = "actions.open_cwd",
                                ["-"] = "actions.cd",
                                ["~"] = "actions.tcd",
                                ["."] = "actions.toggle_hidden",
                        },
                        float = {
                                padding = 2,
                                max_width = 0,
                                max_height = 0,
                                border = "rounded",
                                win_options = {
                                        winblend = 10,
                                },
                        },
                }
        },
        --PLUG: leetcode
        {
                "ianding1/leetcode.vim",
                config = function()
                        vim.g.leetcode_browser = "chrome"
                        vim.g.leetcode_solution_filetype = "rust"
                end,
                cmd = "LeetCodeList",
        },
        --PLUG: latex
        {
                "lervag/vimtex",
                config = function()
                        vim.g.tex_flavor = "latex" -- Default tex file format

                        -- vim.g.vimtex_indent_bib_enabled = 0
                        -- vim.g.vimtex_indent_enabled = 0

                        vim.g.vimtex_complete_enabled = 0
                        -- Disable imaps (using Ultisnips)
                        vim.g.vimtex_imaps_enabled = 0
                        -- auto open quickfix on compile erros
                        vim.g.vimtex_quickfix_mode = 0
                        -- vim.g.vimtex_view_method = 'skim'

                        vim.g.vimtex_view_method = "sioyek"

                        vim.g.vimtex_compiler_latexmk_engines = {
                                _ = "-lualatex",
                                pdflatex = "-pdf",
                                dvipdfex = "-pdfdvi",
                                lualatex = "-lualatex",
                                xelatex = "-xelatex",
                        }
                end,
                dependencies = {
                        "ybian/smartim",
                        config = function()
                                vim.g.smartim_default = "com.apple.keylayout.ABC"
                        end,
                },
                ft = "tex",
        },
        --PLUG: markdown
        {
                "dhruvasagar/vim-table-mode",
                ft = "markdown",
        },

        {
                "ybian/smartim",
                config = function()
                        vim.g.smartim_default = "com.apple.keylayout.ABC"
                end,
                ft = "markdown",
        },

}
