--NOTE: keymap
-- insert_mode       = "i",
-- normal_mode       = "n",
-- term_mode         = "t",
-- visual_mode       = "v",
-- visual_block_mode = "x",
-- command_mode      = "c",
-- operator_mode     = "o",
-- select_mode       = "s"

-- -- Better motion
vim.keymap.set({ "n", "v", "x", "o" }, "K", "5k", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "x", "o" }, "J", "5j", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "x", "o" }, "H", "^", { noremap = true, silent = true })
vim.keymap.set({ "n", "o" }, "L", "$", { noremap = true, silent = true })
vim.keymap.set({ "v", "x" }, "L", "$h", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "x", "o" }, ";;", "%", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "x", "o" }, ";z", "J", { noremap = true, silent = true })
vim.keymap.set({ "n" }, ";u", "<cmd>nohl<CR>", { noremap = true, silent = true })
--buffers
vim.keymap.set({ 'n', 'i', 'v', 'x', }, "<A-]>", "<cmd>bn<cr>", { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'v', 'x', }, "<A-[>", "<cmd>bp<cr>", { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'v', 'x', }, "<C-]>", "<cmd>bd<cr>", { noremap = true, silent = true })
--save file
vim.keymap.set({ 'n', 'i', 'v', 'x', 't' }, '<A-s>', '<cmd>w<CR>', { noremap = true, silent = true })
-- Resize with arrows
vim.keymap.set({ "n", "v", "x", }, "<A-Up>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "x", }, "<A-Down>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "x", }, "<A-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "x", }, "<A-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })
-- Move current line / block
vim.keymap.set({ "n" }, "<A-->", "<cmd>m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set({ "n", }, "<A-=>", "<cmd>m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set({ "v", }, "<A-->", ":m '>+1<cr>gv=gv", { noremap = true, silent = true })
vim.keymap.set({ "v", }, "<A-=>", ":m '<-2<cr>gv=gv", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<", "<<", { noremap = true, silent = true })
vim.keymap.set({ "n" }, ">", ">>", { noremap = true, silent = true })
vim.keymap.set({ "v", "x", }, "<", "<gv", { noremap = true, silent = true })
vim.keymap.set({ "v", "x", }, ">", ">gv", { noremap = true, silent = true })
-- Terminal
vim.keymap.set({ "t", }, "<C-\\>", "<C-\\><C-N>", { noremap = true, silent = true })
-- run code
vim.keymap.set({ "n" }, "<leader>m", function() require('Miku-vim.utils.modules').run() end,
        { noremap = true, silent = true })
--Plugin
vim.keymap.set({ "n", "v", "x" }, "<leader>n", function() require('oil').open() end, { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>fh", function() require('telescope.builtin').oldfiles() end,
        { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>ff", function() require('telescope.builtin').find_files() end,
        { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>fw", function() require('telescope.builtin').current_buffer_fuzzy_find() end,
        { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>fl", function() require('telescope.builtin').live_grep() end,
        { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<Leader>fs", function() require('telescope.builtin').colorscheme() end,
        { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<Leader>fm", function() require('telescope.builtin').marks() end,
        { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>j", function() require('telescope.builtin').buffers() end,
        { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>fr", function() require('telescope.builtin').builtin() end,
        { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>fp", function() require('Miku-vim.utils.telescope_tools').zoxide() end,
        { noremap = true, silent = true })

-- Terminal window navigation
-- { { "t", }, "<C-h>",  "<C-\\><C-N><C-w>h", opts },
-- { { "t", }, "<C-j>",  "<C-\\><C-N><C-w>j", opts },
-- { { "t", }, "<C-k>",  "<C-\\><C-N><C-w>k", opts },
-- { { "t", }, "<C-l>",  "<C-\\><C-N><C-w>l", opts },

--NOTE: user command
vim.api.nvim_create_user_command("FormatJSON", "%!python -m json.tool", {})
vim.api.nvim_create_user_command("Git", "lua require('Miku-vim.utils.modules').lazygit()", {})
vim.api.nvim_create_user_command("BufferPwd", "lua require('Miku-vim.utils.modules').BufferPwd()", {})
