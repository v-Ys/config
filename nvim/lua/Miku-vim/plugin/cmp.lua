return {
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
                local luasnip = require("luasnip")
                local cmp = require("cmp")
                local cmp_autopairs = require('nvim-autopairs.completion.cmp')

                --NOTE: luasnip config
                luasnip.config.set_config({
                        enable_autosnippets = true
                })
                require("luasnip/loaders/from_vscode").lazy_load({
                        include = { "python", "rust", "cpp", "c", "lua", "markdown" }
                })
                require("luasnip.loaders.from_vscode").lazy_load({
                        paths = {
                                vim.fn.stdpath("config") .. "/lua/Miku-vim/snippets"
                        }
                })

                local check_backspace = function()
                        local col = vim.fn.col "." - 1
                        return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
                end
                local kind_icons = {
                        Array = "",
                        Boolean = "",
                        Class = "",
                        Color = "",
                        Constant = "",
                        Constructor = "",
                        Enum = "",
                        EnumMember = "",
                        Event = "",
                        Field = "",
                        File = "",
                        Folder = "",
                        Function = "",
                        Interface = "",
                        Key = "",
                        Keyword = "",
                        Method = "",
                        Module = "",
                        Namespace = "",
                        Null = "ﳠ",
                        Number = "",
                        Object = "",
                        Operator = "",
                        Package = "",
                        Property = "",
                        Reference = "",
                        Snippet = "",
                        String = "",
                        Struct = "",
                        Text = "",
                        TypeParameter = "",
                        Unit = "",
                        Value = "",
                        Variable = "",
                }

                cmp.setup({

                        snippet = {
                                expand = function(args)
                                        luasnip.lsp_expand(args.body) -- load snippets
                                end,
                        },
                        window = {
                                completion = cmp.config.window.bordered(
                                        {
                                                border = 'single',
                                                scrollbar = false,
                                        }

                                ),
                                documentation = cmp.config.window.bordered(
                                        { border = 'single', }

                                ),
                        },
                        formatting = {
                                fields = { "kind", "abbr", "menu" },
                                format = function(entry, vim_item)
                                        -- Kind icons
                                        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                                        -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                                        vim_item.menu = ({
                                                nvim_lsp = "[LSP]",
                                                luasnip = "[Snippet]",
                                                buffer = "[Buffer]",
                                                path = "[Path]",
                                        })[entry.source.name]
                                        return vim_item
                                end,
                        },
                        mapping = cmp.mapping.preset.insert {
                                ["<A-e>"] = cmp.mapping {
                                        i = cmp.mapping.abort(),
                                        c = cmp.mapping.close(),
                                },
                                ["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                                ["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                                ["<Tab>"] = cmp.mapping(function(fallback)
                                        if cmp.visible() then
                                                cmp.select_next_item()
                                        elseif luasnip.expandable() then
                                                luasnip.expand()
                                        elseif luasnip.expand_or_jumpable() then
                                                luasnip.expand_or_jump()
                                        elseif check_backspace() then
                                                fallback()
                                        else
                                                fallback()
                                        end
                                end, {
                                        "i",
                                        "s",
                                }),
                                ["<S-Tab>"] = cmp.mapping(function(fallback)
                                        if cmp.visible() then
                                                cmp.select_prev_item()
                                        elseif luasnip.jumpable(-1) then
                                                luasnip.jump(-1)
                                        else
                                                fallback()
                                        end
                                end, {
                                        "i",
                                        "s",
                                }),

                        },
                        sources = {
                                { name = "nvim_lsp" },
                                { name = "luasnip" },
                                { name = "buffer" },
                                { name = "path" },
                        },
                })

                -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
                cmp.setup.cmdline('/', {
                        mapping = cmp.mapping.preset.cmdline(),
                        sources = {
                                { name = 'buffer' }
                        }
                })
                cmp.setup.cmdline('?', {
                        mapping = cmp.mapping.preset.cmdline(),
                        sources = {
                                { name = 'buffer' }
                        }
                })
                -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
                cmp.setup.cmdline(':', {
                        mapping = cmp.mapping.preset.cmdline(),
                        sources = cmp.config.sources({
                                { name = 'path' }
                        }, {
                                { name = 'cmdline' }
                        }),
                })

                cmp.event:on(
                        'confirm_done',
                        cmp_autopairs.on_confirm_done()
                )
        end,
        event = "VeryLazy",

}
