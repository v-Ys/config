--NOTE: keymap
-- insert_mode       = "i",
-- normal_mode       = "n",
-- term_mode         = "t",
-- visual_mode       = "v",
-- visual_block_mode = "x",
-- command_modei     = "c",

local opts = { noremap = true, silent = true }
local mykeymaps = {
        -- -- Better motion
        { { "n", "v", "x", },          "K",         "5k",                      opts },
        { { "n", "v", "x", },          "J",         "5j",                      opts },
        { { "n", "v", "x", },          "H",         "^",                       opts },
        { { "n", "v", "x", },          "L",         "$",                       opts },
        { { "n" },                     "T",         "J",                       opts },
        { { "n" },                     ";;",        "%",                       opts },
        { { "n" },                     ";u",        "<cmd>nohl<CR>",           opts },
        --buffers
        { { 'n', 'i', 'v', 'x', },     "<A-]>",     "<cmd>bn<cr>",             opts },
        { { 'n', 'i', 'v', 'x', },     "<A-[>",     "<cmd>bp<cr>",             opts },
        { { 'n', 'i', 'v', 'x', },     "<C-]>",     "<cmd>bd<cr>",             opts },
        --save file
        { { 'n', 'i', 'v', 'x', 't' }, '<A-s>',     '<cmd>w<CR>',              opts },
        -- Resize with arrows
        { { "n", "v", "x", },          "<A-Up>",    ":resize +2<CR>",          opts },
        { { "n", "v", "x", },          "<A-Down>",  ":resize -2<CR>",          opts },
        { { "n", "v", "x", },          "<A-Left>",  ":vertical resize -2<CR>", opts },
        { { "n", "v", "x", },          "<A-Right>", ":vertical resize +2<CR>", opts },
        -- Move current line / block
        { { "n", },                    "<A-->",     "<cmd>m .+1<CR>==",        opts },
        { { "n", },                    "<A-=>",     "<cmd>m .-2<CR>==",        opts },
        { { "v", },                    "<A-->",     ":m '>+1<cr>gv=gv",        opts },
        { { "v", },                    "<A-=>",     ":m '<-2<cr>gv=gv",        opts },
        { { "n" },                     "<",         "<<",                      opts },
        { { "n" },                     ">",         ">>",                      opts },
        { { "v", "x", },               "<",         "<gv",                     opts },
        { { "v", "x", },               ">",         ">gv",                     opts },

        -- Terminal
        { { "t", },                    "<C-\\>",    "<C-\\><C-N>",             opts },

        --code runner
        {
                { "n" }, "<leader>m",
                function()
                        require('Miku-vim.utils.modules').run()
                end,
                opts
        },


        -- Terminal window navigation
        -- { { "t", }, "<C-h>",  "<C-\\><C-N><C-w>h", opts },
        -- { { "t", }, "<C-j>",  "<C-\\><C-N><C-w>j", opts },
        -- { { "t", }, "<C-k>",  "<C-\\><C-N><C-w>k", opts },
        -- { { "t", }, "<C-l>",  "<C-\\><C-N><C-w>l", opts },


}


for _, v in pairs(mykeymaps) do
        vim.keymap.set(v[1], v[2], v[3], v[4])
end




--NOTE: user command
local command = {
        ["FormatJSON"] = "%!python -m json.tool",
        ["Git"] = "lua require('Miku-vim.utils.modules').lazygit()",
}

for user_command, fun in pairs(command) do
        vim.api.nvim_create_user_command(user_command, fun, {})
end
