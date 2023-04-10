--NOTE:
local opts = {
        insert_mode = { noremap = true, silent = true },
        normal_mode = { noremap = true, silent = true },
        visual_mode = { noremap = true, silent = true },
        visual_block_mode = { noremap = true, silent = true },
        command_mode = { expr = true, noremap = true },
        term_mode = { silent = true },
}

local mode_adapters = {
        insert_mode = "i",
        normal_mode = "n",
        term_mode = "t",
        visual_mode = "v",
        visual_block_mode = "x",
        command_mode = "c",
}


--NOTE: user keymaps
local keymaps = {
        insert_mode = {

                ["<A-s>"] = "<cmd>w<CR>",
        },
        normal_mode = {
                ["<leader>m"]  = "<cmd>lua require('Miku-vim.utils.modules').run()<cr>",
                -- Resize with arrows
                ["<A-Up>"]     = ":resize +2<CR>",
                ["<A-Down>"]   = ":resize -2<CR>",
                ["<A-Left>"]   = ":vertical resize -2<CR>",
                ["<A-Right>"]  = ":vertical resize +2<CR>",
                -- Move current line / block
                -- ["<c-=>"] = ":m .+1<CR>==",
                -- ["<c-->"] = ":m .-2<CR>==",

                -- -- Better move
                ["K"]          = "3k",
                ["J"]          = "3j",
                ["H"]          = "^",
                ["L"]          = "$",
                ["gb"]         = "%",
                ["<"]          = "<<",
                [">"]          = ">>",
                ["<leader>u"]  = "J",
                --buffers
                ["<A-]>"]      = ":BufferLineCycleNext<CR>",
                ["<A-[>"]      = ":BufferLineCyclePre<CR>",
                ["<c-]>"]      = ":bd<CR>",
                --cancel the highlight
                ["<leader>q"]  = ":nohl<CR>",
                --save and format
                ["<A-s>"]      = "<cmd>w<CR>",
                --dashboad
                ["<Leader>ss"] = ":<C-u>SessionSave<CR>",
                ["<Leader>sl"] = ":<C-u>SessionLoad<CR>",
                --Telescope
                ["<leader>fh"] = "<cmd>lua require('telescope.builtin').oldfiles()<CR>",
                ["<leader>ff"] = "<cmd>lua require('telescope.builtin').find_files()<CR>",
                ["<leader>fw"] = "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
                ["<leader>fl"] = "<cmd>lua require('telescope.builtin').live_grep()<CR>",
                ["<leader>fb"] = "<cmd>lua require('telescope.builtin').buffers()<CR>",
                ["<Leader>fm"] = "<cmd>lua require('telescope.builtin').marks()<CR>",
                ["<Leader>fs"] = "<cmd>lua require('telescope.builtin').colorscheme()<CR>",
                ["<Leader>fp"] = "<cmd>lua require'telescope'.extensions.project.project{}<CR>",
                ["<Leader>fr"] = "<cmd>lua require('telescope.builtin').commands()<CR>",
                ["<Leader>fM"] = "<cmd>TodoTelescope<CR>",
                --leap
                ["f"]          = "<Plug>(leap-forward-to)",
                ["gf"]         = "<Plug>(leap-backward-to)",
                --n vim tree
                ["<leader>n"]  = "<cmd>NeoTreeFloatToggle<CR>",
        },
        term_mode = {
                -- Terminal window navigation
                -- ["<C-h>"] = "<C-\\><C-N><C-w>h",
                -- ["<C-j>"] = "<C-\\><C-N><C-w>j",
                -- ["<C-k>"] = "<C-\\><C-N><C-w>k",
                -- ["<C-l>"] = "<C-\\><C-N><C-w>l",
                ["<C-]>"] = "<C-\\><C-N>",
        },
        visual_mode = {
                ["<A-s>"] = "<cmd>w<CR>",
                -- Better indenting
                ["<"] = "<gv",
                [">"] = ">gv",
                ["K"] = "3k",
                ["J"] = "3j",
                ["H"] = "^",
                ["L"] = "$",
        },
        visual_block_mode = {
                -- Move current line / block with Alt-j/k ala vscode.
                ["<A-s>"] = ":m '>+1<CR>gv-gv",
                ["<A-w>"] = ":m '<-2<CR>gv-gv",
                ["k"] = "3k",
                ["J"] = "3j",
                ["H"] = "^",
                ["L"] = "$",
        },
        command_mode = {
                -- [";;"] = "lua require('Miku-vim.utils.modules').btop()",
        },
}

--NOTE: user command
local command = {
        ["FormatJSON"] = "%!python -m json.tool",
}

--NOTE: load
for user_command, fun in pairs(command) do
        vim.api.nvim_create_user_command(user_command, fun, {})
end

--load keymaps
for mode, map in pairs(keymaps) do
        for key, cmd in pairs(map) do
                vim.api.nvim_set_keymap(mode_adapters[mode], key, cmd, opts[mode])
        end
end

-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "
