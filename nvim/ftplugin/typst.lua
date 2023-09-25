vim.api.nvim_create_user_command("TypstInit",
        "silent !cp ~/Documents/Notes/templates/note.typ ./template.typ && cp ~/Pictures/Cover/q.png ./a.png", {})
