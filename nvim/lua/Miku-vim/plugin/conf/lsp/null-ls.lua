local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
        return
end


local formatting = null_ls.builtins.formatting
-- local completion = null_ls.builtins.completion

null_ls.setup({
    debug = false,
    sources = {
        formatting.autopep8, -- for python
        -- completion.spell,
    },
})
