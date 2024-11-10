local M = {
        "hrsh7th/nvim-cmp",
        event = "VeryLazy",
}

local cmp_border = { " ", " ", " ", " ", " ", " ", " ", " ", }

local check_backspace = function()
        local col = vim.fn.col "." - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local cmp_icons = {
        Array = "",
        Boolean = "",
        Class = "",
        Codeium = "",
        Color = "󰏘",
        Constant = "",
        Constructor = "",
        Enum = "",
        EnumMember = "",
        Event = "",
        Field = "",
        File = "",
        Function = "󰆧",
        Interface = "",
        Key = "",
        Keyword = "",
        Method = "󰆧",
        Module = "",
        Namespace = "",
        Null = "󰟢",
        Number = "",
        Object = "",
        Operator = "󰆕",
        Package = "",
        Property = "",
        Reference = "󰈇",
        Snippet = "",
        String = "",
        Struct = "󰙅",
        TabNine = "",
        Table = "",
        Tag = "",
        Text = "󰉿",
        TypeParameter = "󰊄",
        Unit = "",
        Value = "󰎠",
        Variable = "",
}

M.dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "windwp/nvim-autopairs",
        {
                "saadparwaiz1/cmp_luasnip",
                dependencies = {
                        "L3MON4D3/LuaSnip",
                        "rafamadriz/friendly-snippets",
                },
        },
}


M.config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')

        luasnip.config.set_config({
                enable_autosnippets = true
        })
        require("luasnip/loaders/from_vscode").lazy_load({
                include = { "lua", "cpp", "c", "rust", "go", "python", "javascript", "javascriptreact", "css", "html" }
        })
        require("luasnip.loaders.from_vscode").lazy_load({
                paths = { vim.fn.stdpath("config") .. "/snippets" }
        })

        cmp.setup({
                snippet = {
                        expand = function(args)
                                luasnip.lsp_expand(args.body) -- load snippets
                        end,
                },
                window = {
                        completion = {
                                scrollbar = false,
                                border = cmp_border
                        },
                        documentation = {
                                scrollbar = false,
                                border = cmp_border
                        },
                },
                formatting = {
                        fields = { "kind", "abbr", "menu" },
                        format = function(entry, vim_item)
                                vim_item.kind = string.format("%s", cmp_icons[vim_item.kind])
                                vim_item.menu = ({
                                        nvim_lsp = "[LSP]",
                                        luasnip = "[Snippet]",
                                        buffer = "[Buffer]",
                                        path = "[Path]",
                                })[entry.source.name]
                                return vim_item
                        end,
                },
                experimental = {
                        ghost_text = false
                },
                mapping = cmp.mapping.preset.insert {

                        ["<A-e>"] = cmp.mapping {
                                i = cmp.mapping.abort(),
                                c = cmp.mapping.close(),
                        },
                        ["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                        ["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                        ['<CR>'] = cmp.mapping.confirm({
                                behavior = cmp.ConfirmBehavior.Replace,
                                select = true
                        }),

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
                        end, { "i", "s", }),

                        ["<S-Tab>"] = cmp.mapping(function(fallback)
                                if cmp.visible() then
                                        cmp.select_prev_item()
                                elseif luasnip.jumpable(-1) then
                                        luasnip.jump(-1)
                                else
                                        fallback()
                                end
                        end, { "i", "s", }),

                },
                sources = {
                        { name = "nvim_lsp", max_item_count = 5 },
                        { name = "luasnip",  max_item_count = 5 },
                        { name = "buffer",   max_item_count = 5 },
                        { name = "path",     max_item_count = 5 },
                },
        })
        cmp.event:on( -- insert `(` after select function or method item
                'confirm_done',
                cmp_autopairs.on_confirm_done()
        )
end



return M
