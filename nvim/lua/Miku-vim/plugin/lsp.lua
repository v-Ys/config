local M = {}

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
        config = function()
                local lspconfig = require("lspconfig")
                local servers = {
                        "clangd",
                        "rust_analyzer",
                        "lua_ls",
                        "pyright",
                        "gopls",

                        -- "marksman",
                        -- "hls",
                        -- "volar",
                        -- "tsserver",
                        -- "html",
                }

                -- keymaps
                local function lsp_keymaps(bufnr)
                        local opts = { noremap = true, silent = true }
                        -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
                        -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
                        -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
                        -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
                        -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>', opts)
                        -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

                        vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
                        vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
                        vim.api.nvim_buf_set_keymap(bufnr, "n", "gd",
                                "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>",
                                opts)
                        vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
                        vim.api.nvim_buf_set_keymap(bufnr, "n", "go",
                                "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>",
                                opts)
                        vim.api.nvim_buf_set_keymap(bufnr, "n", "gn",
                                "<cmd>lua require('Miku-vim.utils.modules').rename()<CR>", opts)
                        vim.api.nvim_buf_set_keymap(bufnr, "n", "gh",
                                "<cmd>lua require('telescope.builtin').lsp_references()<CR>",
                                opts)
                        vim.api.nvim_buf_set_keymap(bufnr, "n", "ga", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
                        vim.api.nvim_buf_set_keymap(bufnr, "n", "[d",
                                '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
                                opts)
                        vim.api.nvim_buf_set_keymap(bufnr, "n", "]d",
                                '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
                                opts)
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
                                border = "rounded",
                                source = "always",
                                header = "",
                                prefix = "",
                        },
                })

                vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                        border = "rounded",
                })
                vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
                        border = "rounded",
                })
        end,
}
return M
