vim.keymap.set({ "i", "v", "x" }, "<NL>", "<esc>A;<esc>o",
        { noremap = true, silent = true, buffer = 0, desc = "new line" })
vim.keymap.set({ "n" }, "<nl>", "<esc>a;<esc>",
        { noremap = true, silent = true, buffer = 0, desc = "new line" })
