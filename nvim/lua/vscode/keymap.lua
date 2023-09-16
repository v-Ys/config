local opts = {
        insert_mode = { noremap = true, silent = true },
        normal_mode = { noremap = true, silent = true },
        visual_mode = { noremap = true, silent = true },
        visual_block_mode = { noremap = true, silent = true },
}

local mode_adapters = {
        insert_mode = "i",
        normal_mode = "n",
        visual_mode = "v",
        visual_block_mode = "x",
}


local keymaps = {
        insert_mode = {
        },
        normal_mode = {
                --vscode
                ["<leader>fr"] = "<cmd>call VSCodeNotify('workbench.action.showCommands')<CR>",
                ["<leader>fh"] = "<cmd>call VSCodeNotify('workbench.action.openRecent')<CR>",
                ["<leader>fs"] = "<cmd>call VSCodeNotify('workbench.action.selectTheme')<CR>",
                ["<leader>fl"] = "<cmd>call VSCodeNotify('workbench.action.terminal.focusFind')<CR>",
                ["<leader>n"]  = "<cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>",
                ["<leader>m"]  = "<cmd>call VSCodeNotify('workbench.action.tasks.runTask','Toggle All Panel')<CR>",
                --neovim

                -- Move current line / block
                -- ["<c-=>"] = ":m .+1<CR>==",
                -- ["<c-->"] = ":m .-2<CR>==",

                -- -- Better move
                ["K"]          = "4k",
                ["J"]          = "4j",
                ["H"]          = "^",
                ["L"]          = "$",
                ["<"]          = "<<",
                [">"]          = ">>",
                [";j"]         = "J",
                --buffers
                --cancel the highlight
                [";q"]         = ":nohl<CR>",
                --leap
                ["f"]          = "<Plug>(leap-forward-to)",
                ["gf"]         = "<Plug>(leap-backward-to)",

        },
        visual_mode = {
                ["<"] = "<gv",
                [">"] = ">gv",

                ["K"] = "3k",
                ["J"] = "3j",
                ["H"] = "^",
                ["L"] = "$",
        },
        visual_block_mode = {
                -- ["<A-s>"] = ":m '>+1<CR>gv-gv",
                -- ["<A-w>"] = ":m '<-2<CR>gv-gv",
                ["k"] = "3k",
                ["J"] = "3j",
                ["H"] = "^",
                ["L"] = "$",
        },
}

for mode, map in pairs(keymaps) do
        for key, cmd in pairs(map) do
                vim.api.nvim_set_keymap(mode_adapters[mode], key, cmd, opts[mode])
        end
end
