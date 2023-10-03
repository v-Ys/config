--vim.cmd([[
--augroup _format
--   autocmd!
--   autocmd BufWritePre *.c,*.py,*.cpp,*.rs,*.lua lua vim.lsp.buf.format{sync=true}
--augroup end
--]])

local lang = "*.h," ..
    "*.c," ..
    "*.cpp," ..
    "*.rs," ..
    "*.go," ..
    "*.py," ..
    "*.lua,"

local Format = vim.api.nvim_create_augroup("_format", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = lang,
        command = "lua vim.lsp.buf.format{sync=true}",
        group = Format,
})
