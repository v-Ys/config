vim.keymap.set({ "i", "v", "x" }, "<NL>", "<esc>A;<esc>o",
        { noremap = true, silent = true, buffer = 0, desc = "new line" })
vim.keymap.set({ "n" }, "<NL>", "<esc>A;<esc>",
        { noremap = true, silent = true, buffer = 0, desc = "new line" })
