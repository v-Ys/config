-- https://github.com/neovim/nvim-lspconfig/issues/500#issuecomment-876700701

local python_path
if vim.env.VIRTUAL_ENV then
        python_path = vim.env.VIRTUAL_ENV .. '/' .. 'bin' .. '/' .. 'python'
else
        python_path = vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

return {
        on_init = function(client)
                client.config.settings.python.pythonPath = python_path
        end,
        settings = {
                python = {
                        analysis = {
                                typeCheckingMode = "off",
                        },
                },
        },
}
