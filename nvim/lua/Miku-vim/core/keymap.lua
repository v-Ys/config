--NOTE: keymap
-- insert_mode       = "i",
-- normal_mode       = "n",
-- term_mode         = "t",
-- visual_mode       = "v",
-- visual_block_mode = "x",
-- command_mode      = "c",
-- operator_mode     = "o",
-- select_mode       = "s"

local set = vim.keymap.set
local cmd = vim.api.nvim_create_user_command
-- Better motion
set({ "n", "v", "x", "o" }, "K", "5k", { noremap = true, silent = true })
set({ "n", "v", "x", "o" }, "J", "5j", { noremap = true, silent = true })
set({ "n", "v", "x", "o" }, "H", "^", { noremap = true, silent = true })
set({ "n", "o" }, "L", "$", { noremap = true, silent = true })
set({ "v", "x" }, "L", "$h", { noremap = true, silent = true })
set({ "n", "v", "x", "o" }, ";;", "%", { noremap = true, silent = true })
set({ "n", "v", "x", "o" }, ";z", "J", { noremap = true, silent = true })
set({ "n" }, ";u", "<cmd>nohl<CR>", { noremap = true, silent = true })
set({ "n", "v", "x", "o" }, "*", ":let @/ = expand('<cword>') | set hlsearch<cr>", { noremap = true, silent = true })
--buffers
set({ 'n', 'i', 'v', 'x', }, "<A-]>", "<cmd>bn<cr>", { noremap = true, silent = true })
set({ 'n', 'i', 'v', 'x', }, "<A-[>", "<cmd>bp<cr>", { noremap = true, silent = true })
set({ 'n', 'i', 'v', 'x', }, "<C-]>", "<cmd>bd<cr>", { noremap = true, silent = true })
--save file
set({ 'n', 'i', 'v', 'x', 't' }, '<A-s>', '<cmd>w<CR>', { noremap = true, silent = true })
-- Resize with arrows
set({ "n", "v", "x", }, "<A-Up>", "<cmd>resize +2<CR>", { noremap = true, silent = true })
set({ "n", "v", "x", }, "<A-Down>", "<cmd>resize -2<CR>", { noremap = true, silent = true })
set({ "n", "v", "x", }, "<A-Left>", "<cmd>vertical resize -2<CR>", { noremap = true, silent = true })
set({ "n", "v", "x", }, "<A-Right>", "<cmd>vertical resize +2<CR>", { noremap = true, silent = true })
-- Move current line / block
set({ "n" }, "<A-->", "<cmd>m .+1<CR>==", { noremap = true, silent = true })
set({ "n", }, "<A-=>", "<cmd>m .-2<CR>==", { noremap = true, silent = true })
set({ "v", }, "<A-->", "<cmd>m '>+1<cr>gv=gv", { noremap = true, silent = true })
set({ "v", }, "<A-=>", "<cmd>m '<-2<cr>gv=gv", { noremap = true, silent = true })
set({ "n" }, "<", "<<", { noremap = true, silent = true })
set({ "n" }, ">", ">>", { noremap = true, silent = true })
set({ "v", "x", }, "<", "<gv", { noremap = true, silent = true })
set({ "v", "x", }, ">", ">gv", { noremap = true, silent = true })
--Plugin
set({ "n", "v", "x" }, "<leader>n", require('nvim-tree.api').tree.open, { noremap = true, silent = true })
set({ "n" }, "<Leader>fm", require('telescope.builtin').marks, { noremap = true, silent = true })
set({ "n" }, "<leader>j", require('telescope.builtin').buffers, { noremap = true, silent = true })
set({ "n" }, "<leader>fr", require('telescope.builtin').builtin, { noremap = true, silent = true })
set({ "n" }, "<leader>fh", require('telescope.builtin').oldfiles, { noremap = true, silent = true })
set({ "n" }, "<leader>fl", require('telescope.builtin').live_grep, { noremap = true, silent = true })
set({ "n" }, "<leader>ff", require('telescope.builtin').find_files, { noremap = true, silent = true })
set({ "n" }, "<Leader>fs", require('telescope.builtin').colorscheme, { noremap = true, silent = true })
set({ "n" }, "<leader>fp", require('Miku-vim.utils.telescope_tools').zoxide, { noremap = true, silent = true })
set({ "n" }, "<leader>fw", require('telescope.builtin').current_buffer_fuzzy_find,
        { noremap = true, silent = true })
-- Terminal
set({ "t", }, "<C-\\>", "<C-\\><C-N>", { noremap = true, silent = true })
-- run code
set({ "n" }, "<leader>m", require('Miku-vim.utils.modules').run,
        { noremap = true, silent = true })

--NOTE: user command
cmd("FormatJSON", "%!python -m json.tool", {})
cmd("Git", "lua require('Miku-vim.utils.modules').lazygit()<CR>", {})
cmd("BufferPwd", "lua require('Miku-vim.utils.modules').BufferPwd()<CR>", {})







-- Terminal window navigation
-- { { "t", }, "<C-h>",  "<C-\\><C-N><C-w>h", opts },
-- { { "t", }, "<C-j>",  "<C-\\><C-N><C-w>j", opts },
-- { { "t", }, "<C-k>",  "<C-\\><C-N><C-w>k", opts },
-- { { "t", }, "<C-l>",  "<C-\\><C-N><C-w>l", opts },
