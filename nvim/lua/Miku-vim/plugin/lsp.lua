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

-- PLUG:LSP
local lsp_config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local on_attach = function(client, bufnr)
                if client.name == "tsserver" then
                        client.server_capabilities.document_formatting = false
                end
                lsp_keymaps(bufnr)
        end
        -- capabilities cmp
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

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
end

-- PLUG: mason
local mason_config = {
        max_concurrent_installers = 10,
        ui = {
                icons = {
                        package_installed = "",
                        package_pending = "",
                        package_uninstalled = "",
                },
                border = "single",
        },

}

-- PLUG: null-ls
local nullls_config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        -- local completion = null_ls.builtins.completion
        null_ls.setup({
                debug = false,
                sources = {
                        formatting.black,
                        -- completion.spell,
                },
        })
end

return {
        {
                "williamboman/mason.nvim",
                opts = mason_config,
                event = "VeryLazy",
        },
        {
                "neovim/nvim-lspconfig",
                dependencies = "hrsh7th/cmp-nvim-lsp",
                config = lsp_config,
                event = { "BufReadPre", "BufNewFile" }
        },
        {
                "jose-elias-alvarez/null-ls.nvim",
                config = nullls_config,
                event = "VeryLazy",
        },
}
