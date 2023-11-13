vim.keymap.set({ "i", "n", "v", "x" }, "<A-^>", "<esc>A;<esc>o",
        { noremap = true, silent = true, buffer = 0, desc = "new line" })
