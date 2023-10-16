local opts = { noremap = true, silent = true }
local mykeymaps = {
        -- -- Better motion
        { { "n", "v", "x", }, "K",          "5k",                                                                opts },
        { { "n", "v", "x", }, "J",          "5j",                                                                opts },
        { { "n", "v", "x", }, "H",          "^",                                                                 opts },
        { { "n", "v", "x", }, "L",          "$",                                                                 opts },
        { { "n" },            ";z",         "J",                                                                 opts },
        { { "n" },            ";;",         "%",                                                                 opts },
        { { "n" },            ";u",         "<cmd>nohl<CR>",                                                     opts },

        -- Move current line / block
        { { "n", },           "<A-->",      "<cmd>m .+1<CR>==",                                                  opts },
        { { "n", },           "<A-=>",      "<cmd>m .-2<CR>==",                                                  opts },
        { { "v", },           "<A-->",      ":m '>+1<cr>gv=gv",                                                  opts },
        { { "v", },           "<A-=>",      ":m '<-2<cr>gv=gv",                                                  opts },
        { { "n" },            "<",          "<<",                                                                opts },
        { { "n" },            ">",          ">>",                                                                opts },
        { { "v", "x", },      "<",          "<gv",                                                               opts },
        { { "v", "x", },      ">",          ">gv",                                                               opts },

        --vscode cmd
        { { "n" },            "<leader>fr", "<cmd>call VSCodeNotify('workbench.action.showCommands')<CR>",       opts },
        { { "n" },            "<leader>fh", "<cmd>call VSCodeNotify('workbench.action.openRecent')<CR>",         opts },
        { { "n" },            "<leader>fs", "<cmd>call VSCodeNotify('workbench.action.selectTheme')<CR>",        opts },
        { { "n" },            "<leader>fl", "<cmd>call VSCodeNotify('workbench.action.terminal.focusFind')<CR>", opts },
        { { "n" }, "<leader>n", "<cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>",
                opts },
        { { "n" }, "<leader>m",
                "<cmd>call VSCodeNotify('workbench.action.tasks.runTask','Toggle All Panel')<CR>",
                opts },




}


for _, v in pairs(mykeymaps) do
        vim.keymap.set(v[1], v[2], v[3], v[4])
end
