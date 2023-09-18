return {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
                local actions = require "fzf-lua.actions"
                require 'fzf-lua'.setup {
                        winopts      = {
                                border  = 'single',
                                preview = {
                                        scrollchars = { '', '' }, -- scrollbar chars ({ <full>, <empty> }
                                }
                        },
                        keymap       = {
                                builtin = {
                                        ["ctrl-;"] = "preview-page-down",
                                        ["ctrl-'"] = "preview-page-up",
                                },
                        },
                        files        = {

                                winopts = {

                                        height  = 0.60,
                                        width   = 0.45,
                                        row     = 0.23, -- 0=top, 1=bottom
                                        col     = 0.5,  -- 0=left, 1=right
                                        preview = {
                                                layout   = 'vertical',
                                                vertical = 'up:50%',
                                        }
                                },
                        },

                        oldfiles     = {
                                winopts   = {
                                        height = 0.33, -- window height
                                        width  = 0.45, -- window width
                                        row    = 0.43, -- window row position (0=top, 1=bottom)
                                        col    = 0.5,  -- window col position (0=left, 1=right)

                                },
                                previewer = false,
                        },

                        colorschemes = {
                                live_preview = false,
                                winopts      = {
                                        height = 0.33, -- window height
                                        width  = 0.45, -- window width
                                        row    = 0.43, -- window row position (0=top, 1=bottom)
                                        col    = 0.5,  -- window col position (0=left, 1=right)

                                },
                        },
                        buffers      = {
                                previewer = false,
                                actions = {
                                        ["ctrl-d"] = { fn = actions.buf_del, reload = true },
                                        ["ctrl-x"] = { fn = actions.buf_switch, reload = true },
                                },
                                winopts = {
                                        height = 0.33, -- window height
                                        width  = 0.45, -- window width
                                        row    = 0.43, -- window row position (0=top, 1=bottom)
                                        col    = 0.5,  -- window col position (0=left, 1=right)

                                },
                        },
                        tabs         = {
                                previewer = false,
                                actions = {
                                        ["ctrl-d"] = { fn = actions.buf_del, reload = true },
                                        ["ctrl-x"] = { fn = actions.buf_switch, reload = true },
                                },
                                winopts = {
                                        height = 0.33, -- window height
                                        width  = 0.45, -- window width
                                        row    = 0.43, -- window row position (0=top, 1=bottom)
                                        col    = 0.5,  -- window col position (0=left, 1=right)

                                },
                        },
                }
                require('fzf-lua').register_ui_select({
                        winopts = { height = 0.33, width = 0.45, row = 0.43, col = 0.5 } })
        end

}
