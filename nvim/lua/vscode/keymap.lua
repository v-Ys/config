local set = vim.keymap.set
--  motion
set({ "n", "v", "x", "o" }, "K", "5k", { noremap = true, silent = true })
set({ "n", "v", "x", "o" }, "J", "5j", { noremap = true, silent = true })
set({ "n", "v", "x", "o" }, "H", "^", { noremap = true, silent = true })
set({ "n", "o" }, "L", "$", { noremap = true, silent = true })
set({ "v", "x" }, "L", "$h", { noremap = true, silent = true })
set({ "n", "v", "x", "o" }, ";;", "%", { noremap = true, silent = true })
set({ "n", "v", "x", "o" }, ";z", "J", { noremap = true, silent = true })
set({ "n" }, ";u", "<cmd>nohl<CR>", { noremap = true, silent = true })
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
--VSCode
set({ "n" }, "<leader>fr", "<cmd>call VSCodeNotify('workbench.action.showCommands')<CR>",
        { noremap = true, silent = true })
set({ "n" }, "<leader>fh", "<cmd>call VSCodeNotify('workbench.action.openRecent')<CR>",
        { noremap = true, silent = true })
set({ "n" }, "<leader>fs", "<cmd>call VSCodeNotify('workbench.action.selectTheme')<CR>",
        { noremap = true, silent = true })
set({ "n" }, "<leader>fl", "<cmd>call VSCodeNotify('workbench.action.terminal.focusFind')<CR>",
        { noremap = true, silent = true })
set({ "n" }, "<leader>n", "<cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>",
        { noremap = true, silent = true })
set({ "n" }, "<leader>m",
        "<cmd>call VSCodeNotify('workbench.action.tasks.runTask','Toggle All Panel')<CR>",
        { noremap = true, silent = true })
