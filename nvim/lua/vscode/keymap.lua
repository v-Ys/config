--  motion
vim.keymap.set({ "n", "v", "x", "o" }, "K", "5k", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "x", "o" }, "J", "5j", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "x", "o" }, "H", "^", { noremap = true, silent = true })
vim.keymap.set({ "n", "o" }, "L", "$", { noremap = true, silent = true })
vim.keymap.set({ "v", "x" }, "L", "$h", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "x", "o" }, ";;", "%", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "x", "o" }, ";z", "J", { noremap = true, silent = true })
vim.keymap.set({ "n" }, ";u", "<cmd>nohl<CR>", { noremap = true, silent = true })
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
--VSCode
vim.keymap.set({ "n" }, "<leader>fr", "<cmd>call VSCodeNotify('workbench.action.showCommands')<CR>",
        { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>fh", "<cmd>call VSCodeNotify('workbench.action.openRecent')<CR>",
        { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>fs", "<cmd>call VSCodeNotify('workbench.action.selectTheme')<CR>",
        { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>fl", "<cmd>call VSCodeNotify('workbench.action.terminal.focusFind')<CR>",
        { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>n", "<cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>",
        { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>m",
        "<cmd>call VSCodeNotify('workbench.action.tasks.runTask','Toggle All Panel')<CR>",
        { noremap = true, silent = true })
