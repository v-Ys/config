local M = {}

local cmp_nvim_lsp = require("cmp_nvim_lsp")
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
}
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)


M.setup = function()
        local signs = {
                { name = "DiagnosticSignError", text = "" },
                { name = "DiagnosticSignWarn",  text = "" },
                { name = "DiagnosticSignHint",  text = "" },
                { name = "DiagnosticSignInfo",  text = "ﲤ" },
                ---         ✎ ﲤ     ▎ ▏ │       礼   
        }

        for _, sign in ipairs(signs) do
                vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
        end

        local config = {
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
        }

        vim.diagnostic.config(config)

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                border = "rounded",
        })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
                border = "rounded",
        })
end



local function lsp_keymaps(bufnr)
        local opts = { noremap = true, silent = true }
        -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gp", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>', opts)
        -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

        vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "go", "<cmd>lua require('telescope.builtin').lsp_implementations<CR>",
                opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gn", "<cmd>lua require('Miku-vim.utils.modules').rename()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "ga", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
                opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
                opts)
        vim.api.nvim_create_user_command('Format', 'lua vim.lsp.buf.format{async=true}', {})
end

M.on_attach = function(client, bufnr)
        if client.name == "tsserver" then
                client.server_capabilities.document_formatting = false
        end
        lsp_keymaps(bufnr)
        -- require "lsp_signature".on_attach({
        --         hint_prefix = "🐼 ",
        --         floating_window = false,
        -- }, bufnr)
end


return M
