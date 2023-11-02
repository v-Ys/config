local M = {}
local lsp_config = function()
        local lspconfig = require("lspconfig")
        local servers = {
                "clangd",
                "rust_analyzer",
                "lua_ls",
                "pyright",
                "gopls",
                "racket_langserver",

                -- "marksman",
                -- "hls",
                -- "volar",
                -- "tsserver",
                -- "html",
        }

        -- keymaps
        local function lsp_keymaps(bufnr)
                --  vim.lsp.buf.references()
                --  vim.lsp.buf.rename()
                --  vim.lsp.buf.definition()
                --  vim.lsp.buf.code_action()
                --  vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })
                --  vim.diagnostic.setloclist()

                vim.keymap.set("n", "gt", function() vim.lsp.buf.signature_help() end,
                        { noremap = true, silent = true, buffer = bufnr, desc = "signature help" })
                vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end,
                        { noremap = true, silent = true, buffer = bufnr })
                vim.keymap.set("n", "gd",
                        function() require('telescope.builtin').lsp_definitions() end,
                        { noremap = true, silent = true, buffer = bufnr })
                vim.keymap.set("n", "gl", function() vim.lsp.buf.hover() end,
                        { noremap = true, silent = true, buffer = bufnr })
                vim.keymap.set("n", "go",
                        function() require('telescope.builtin').lsp_implementations() end,
                        { noremap = true, silent = true, buffer = bufnr })
                vim.keymap.set("n", "gn",
                        function() require('Miku-vim.utils.modules').rename() end,
                        { noremap = true, silent = true, buffer = bufnr })
                vim.keymap.set("n", "gr",
                        function() require('telescope.builtin').lsp_references() end,
                        { noremap = true, silent = true, buffer = bufnr })
                vim.keymap.set("n", "ga", function() vim.diagnostic.open_float() end,
                        { noremap = true, silent = true, buffer = bufnr })
                vim.keymap.set("n", ";p",
                        function() vim.diagnostic.goto_prev({ border = "single" }) end,
                        { noremap = true, silent = true, buffer = bufnr })
                vim.keymap.set("n", ";n",
                        function() vim.diagnostic.goto_next({ border = "single" }) end,
                        { noremap = true, silent = true, buffer = bufnr })

                vim.api.nvim_create_user_command('Format', 'lua vim.lsp.buf.format{async=true}', {})
        end
        -- on attach
        local on_attach = function(client, bufnr)
                if client.name == "tsserver" then
                        client.server_capabilities.document_formatting = false
                end
                lsp_keymaps(bufnr)
        end
        -- capabilities
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true
        }
        capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

        -- NOTE:  lsp ocnfig
        for _, server in pairs(servers) do
                local opts = {
                        on_attach = on_attach,
                        capabilities = capabilities,
                }

                local has_custom_opts, server_custom_opts = pcall(require,
                        "Miku-vim.utils.lsp_settings." .. server)
                if has_custom_opts then
                        opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
                end
                lspconfig[server].setup(opts)
        end

        -- NOTE:  diagnostic ocnfig
        local signs = {
                { name = "DiagnosticSignError", text = "󰌕" },
                { name = "DiagnosticSignWarn", text = "" },
                { name = "DiagnosticSignHint", text = "" },
                { name = "DiagnosticSignInfo", text = "✎" },
                -- -   󰌕      ✎      ▎ ▏ │          
        }
        for _, sign in ipairs(signs) do
                vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
        end

        vim.diagnostic.config({

                -- disable virtual text
                virtual_text = false,
                -- show signs
                signs = {
                        active = signs,
                },
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                float = {
                        focusable = false,
                        style = "minimal",
                        border = "single",
                        source = "always",
                        header = "",
                        prefix = "",
                },
        })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                border = "single",
        })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
                border = "single",
        })
end




-- PLUG: mason
M[#M + 1] = {

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
        event = "VeryLazy",
}

-- PLUG: null-ls for formatters and linters
M[#M + 1] = {
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
        event = "VeryLazy",
}

-- PLUG: for fold  !!! Please load plugin afer lsp
M[#M + 1] = {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        config = true,
        event = "VeryLazy",
}

-- PLUG:LSP
M[#M + 1] = {
        "neovim/nvim-lspconfig",
        dependencies = {
                "hrsh7th/cmp-nvim-lsp",
        },
        config = lsp_config,
        event = { "BufReadPre", "BufNewFile" }
}
return M
