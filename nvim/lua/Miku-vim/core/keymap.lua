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
local opts = { noremap = true, silent = true }
-- Better motion
set({ "n" }, ";k", "<cmd>nohl<CR>", opts)
set({ "n", "o" }, "L", "$", opts)
set({ "v", "x" }, "L", "$h", opts)
set({ "n", "v", "x", "o" }, "K", "5k", opts)
set({ "n", "v", "x", "o" }, "J", "5j", opts)
set({ "n", "v", "x", "o" }, "H", "^", opts)
set({ "n", "v", "x", "o" }, ";;", "%", opts)
set({ "n", "v", "x", "o" }, ";z", "J", opts)
set({ "n", "v", "x", "o" }, ";j", ":let @/ = expand('<cword>') | set hlsearch<cr>", opts)
--buffers
set({ 'n', 'i', 'v', 'x', }, "<A-]>", "<cmd>bn<cr>", opts)
set({ 'n', 'i', 'v', 'x', }, "<A-[>", "<cmd>bp<cr>", opts)
set({ 'n', 'i', 'v', 'x', }, "<C-]>", "<cmd>bd<cr>", opts)
--save file
-- set({ 'n', 'i', 'v', 'x', 't' }, '<A-s>', '<cmd>w<CR>', opts)
-- Resize with arrows
set({ "n", "v", "x", }, "<A-Up>", "<cmd>resize +2<CR>", opts)
set({ "n", "v", "x", }, "<A-Down>", "<cmd>resize -2<CR>", opts)
set({ "n", "v", "x", }, "<A-Left>", "<cmd>vertical resize -2<CR>", opts)
set({ "n", "v", "x", }, "<A-Right>", "<cmd>vertical resize +2<CR>", opts)
-- Move  line / code block
set({ "n" }, "<A-->", "<cmd>m .+1<CR>==", opts)
set({ "n", }, "<A-=>", "<cmd>m .-2<CR>==", opts)
set({ "v", }, "<A-->", "<cmd>m '>+1<cr>gv=gv", opts)
set({ "v", }, "<A-=>", "<cmd>m '<-2<cr>gv=gv", opts)
set({ "n" }, "<", "<<", opts)
set({ "n" }, ">", ">>", opts)
set({ "v", "x", }, "<", "<gv", opts)
set({ "v", "x", }, ">", ">gv", opts)
--Plugin
set({ "n", "v", "x" }, "<leader>n", require('nvim-tree.api').tree.open, opts)
set({ "n" }, "<Leader>fm", require('telescope.builtin').marks, opts)
set({ "n" }, "<leader>j", require('telescope.builtin').buffers, opts)
set({ "n" }, "<leader>fr", require('telescope.builtin').builtin, opts)
set({ "n" }, "<leader>fh", require('telescope.builtin').oldfiles, opts)
set({ "n" }, "<leader>fl", require('telescope.builtin').live_grep, opts)
set({ "n" }, "<leader>ff", require('telescope.builtin').find_files, opts)
set({ "n" }, "<Leader>fs", require('telescope.builtin').colorscheme, opts)
set({ "n" }, "<leader>fp", require('Miku-vim.utils.telescope_tools').zoxide, opts)
set({ "n" }, "<leader>fw", require('telescope.builtin').current_buffer_fuzzy_find, opts)
set({ "n", "v", "x", }, "f", require("flash").jump, opts)
set({ "n", }, "tj", function() require("trouble").next({ skip_groups = true, jump = true }); end, opts)
set({ "n", }, "tk", function() require("trouble").next({ skip_groups = true, jump = true }); end, opts)
-- Terminal
set({ "t", }, "<C-\\>", "<C-\\><C-N>", opts)
-- run code
set({ "n" }, "<leader>m", require('Miku-vim.utils.modules').run, opts)

--NOTE: user command
cmd("FormatJSON", "%!python -m json.tool", {})
cmd("Git", "lua require('Miku-vim.utils.modules').lazygit()<CR>", {})
cmd("BufferPwd", "lua require('Miku-vim.utils.modules').BufferPwd()<CR>", {})



-- Terminal window navigation
-- { { "t", }, "<C-h>",  "<C-\\><C-N><C-w>h", opts },
-- { { "t", }, "<C-j>",  "<C-\\><C-N><C-w>j", opts },
-- { { "t", }, "<C-k>",  "<C-\\><C-N><C-w>k", opts },
-- { { "t", }, "<C-l>",  "<C-\\><C-N><C-w>l", opts },
