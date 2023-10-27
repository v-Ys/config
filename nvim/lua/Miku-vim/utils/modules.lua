--for Terminal
local MIKU = {}
local Terminal = require("toggleterm.terminal").Terminal
local btop = Terminal:new({ cmd = "btop", hidden = true })
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })


-- for run
local runCode = {
        c = function()
                vim.cmd("TermExec cmd=\"cd %:p:h && clang %:t -o %:t:r && ./%:t:r && rm %:t:r\"")
        end,

        -- cpp = function()
        --         vim.cmd("TermExec cmd=\"cd %:p:h && clang++ %:t -o %:t:r && ./%:t:r && rm %:t:r\"")
        -- end,

        --cpp 20
        cpp = function()
                vim.cmd(
                        "TermExec cmd=\"cd %:p:h && clang++ -std=c++20 -fmodules %:t -o %:t:r && ./%:t:r && rm %:t:r\"")
        end,

        go = function()
                vim.cmd(
                        "TermExec cmd=\"cd %:p:h && go run %:t\"")
        end,
        python = function()
                vim.cmd("TermExec cmd=\"cd %:p:h && python3 %:t\"")
        end,

        rust = function()
                vim.cmd("TermExec cmd=\"cd %:p:h && cargo run\"")
        end,

        markdown = function()
                vim.cmd("silent! !open %")
        end,

        typst = function()
                vim.cmd("silent! !open -a Skim.app %:p:r.pdf")
        end,
        scheme = function()
                vim.cmd("TermExec cmd=\"cd %:p:h && racket %:t\"")
        end
}


--NOTE: btop
MIKU.btop = function()
        btop:toggle()
end

--NOTE: lazygit
MIKU.lazygit = function()
        lazygit:toggle()
end

--NOTE: run
MIKU.run = function()
        --get current buffer filetype
        local ftp = vim.bo.filetype
        --RUN
        if runCode[ftp] ~= nil then
                runCode[ftp]()
        end
end

--NOTE: lsp rename
MIKU.rename = function()
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
        local win = vim.api.nvim_open_win(buf, true, opts)
        vim.cmd('startinsert')
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
        vim.keymap.set({ 'i', 'n' }, '<esc>',
                '<cmd>stopinsert | close<CR>',
                { silent = true, buffer = true })
        vim.keymap.set("i", "<CR>", function()
                local new_name = vim.trim(vim.fn.getline('.'))
                vim.api.nvim_win_close(0, true)
                vim.cmd('stopinsert')
                vim.lsp.buf.rename(new_name)
        end, { buffer = true })
end


return MIKU
