vim.api.nvim_create_user_command("TypstInit",
        "silent !cp ~/Documents/Notes/templates/note.typ ./template.typ && mkdir figures && cp ~/Pictures/Cover/q.png figures/a.png",
        {})
