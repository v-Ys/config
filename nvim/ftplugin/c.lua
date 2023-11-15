vim.keymap.set({ "i", "v", "x" }, "<A-^>", "<esc>A;<esc>o",
        { noremap = true, silent = true, buffer = 0, desc = "new line" })
vim.keymap.set({ "n" }, "<A-^>", "<esc>A;<esc>",
        { noremap = true, silent = true, buffer = 0, desc = "new line" })
