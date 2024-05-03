--for Terminal
local M = {}

--NOTE: run
local runCode = {
        markdown = function()
                vim.cmd("silent! !open %")
        end,

        typst = function()
                vim.cmd("silent! !open -a Skim.app %:p:r.pdf")
        end,
}

M.run = function()
        --get current buffer filetype
        local ftp = vim.bo.filetype
        --RUN
        if runCode[ftp] ~= nil then
                runCode[ftp]()
        end
end

--NOTE:
M.rename = function()
        local opts = {
                relative = 'cursor',
                row = 0,
                col = 0,
                width = 20,
                height = 1,
                style = 'minimal',
                border = 'single'
        }
        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_open_win(buf, true, opts)
        vim.api.nvim_input('a')
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
        vim.keymap.set({ 'i', 'n' }, '<esc>',
                '<cmd>stopinsert | close<CR>',
                { silent = true, buffer = true })
        vim.keymap.set("i", "<CR>", function()
                local new_name = vim.trim(vim.fn.getline('.'))
                vim.api.nvim_win_close(0, true)
                vim.cmd('stopinsert')
                vim.fn.cursor(vim.fn.line('.'), vim.fn.col('.') + 1)
                vim.lsp.buf.rename(new_name)
        end, { buffer = true })
end

--NOTE:
M.BufferPwd = function()
        print(vim.fn.expand('%:p'))
end

--NOTE:
M.cdBufferPwd = function()
        local dir = vim.fn.expand('%:p:h')
        vim.api.nvim_set_current_dir(dir)
        print("change dir to " .. dir)
end

--NOTE:
M.highlightCword = function()
        --":let @/ = expand('<cword>') | set hlsearch<cr>"
        vim.fn.setreg('/', vim.fn.expand('<cword>'))
        vim.opt.hlsearch = true
end


return M
