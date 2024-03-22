local util = require('lspconfig/util')
local path = util.path

-- https://github.com/neovim/nvim-lspconfig/issues/500#issuecomment-876700701
local function get_python_path()
        if vim.env.VIRTUAL_ENV then
                return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
        end
        return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

return {
        on_init = function(client)
                client.config.settings.python.pythonPath = get_python_path()
        end,
        settings = {
                python = {
                        analysis = {
                                typeCheckingMode = "off",
                        },
                },
        },
}
