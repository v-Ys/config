--NOTE:

if vim.g.vscode then
        require 'vscode'
else
        require 'Miku-vim'
        -- local function open_nvim_tree(data)
        --         -- buffer is a real file on the disk
        --         local real_file = vim.fn.filereadable(data.file) == 1
        --
        --         -- buffer is a [No Name]
        --         local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
        --
        --         if not real_file and not no_name then
        --                 return
        --         end
        --
        --         -- open the tree, find the file but don't focus it
        --         require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
        -- end
        -- open_nvim_tree();
end
