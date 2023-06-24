--for Terminal
local MIKU = {}
local Terminal = require("toggleterm.terminal").Terminal
local btop = Terminal:new({ cmd = "btop", hidden = true })
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })


-- for run
local RUN = {
        c = function()
                vim.cmd("TermExec cmd=\"cd %:p:h && clang %:t -o %:t:r && ./%:t:r && rm %:t:r\"")
        end,

        -- cpp = function()
        --         vim.cmd("TermExec cmd=\"cd %:p:h && clang++ %:t -o %:t:r && ./%:t:r && rm %:t:r\"")
        -- end,

        --cpp 20
        cpp = function()
                vim.cmd(
                        "TermExec cmd=\"cd %:p:h && clang++ -std=c++20 -fmodules %:t -o %:t:r && ./%:t:r && rm %:t:r\"")
        end,

        lua = function()
                vim.cmd("TermExec cmd=\"cd %:p:h && lua %:t\"")
        end,

        python = function()
                vim.cmd("TermExec cmd=\"cd %:p:h && python3 %:t\"")
        end,

        rust = function()
                vim.cmd("TermExec cmd=\"cd %:p:h && cargo run\"")
        end
}


--NOTE: btop
MIKU.btop = function()
        btop:toggle()
end

--NOTE: lazygit
MIKU.lazygit = function()
        lazygit:toggle()
end

--NOTE: run
MIKU.run = function()
        --get current buffer filetype
        local ftp = vim.bo.filetype
        --RUN
        if RUN[ftp] ~= nil then
                RUN[ftp]()
        end
end

--NOTE: lsp rename
MIKU._lsprename = function(win)
        local new_name = vim.trim(vim.fn.getline('.'))
        vim.api.nvim_win_close(win, true)
        vim.cmd('stopinsert')
        vim.lsp.buf.rename(new_name)
end

MIKU.rename = function()
        local opts = {
                relative = 'cursor',
                row = 0,
                col = 0,
                width = 20,
                height = 1,
                style = 'minimal',
                border = 'rounded'
        }
        local buf = vim.api.nvim_create_buf(false, true)
        local win = vim.api.nvim_open_win(buf, true, opts)
        vim.cmd('startinsert')
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
        vim.api.nvim_buf_set_keymap(buf, 'i', '<esc>',
                '<cmd>stopinsert | close<CR>',
                { silent = true })
        --TODO:callback
        vim.api.nvim_buf_set_keymap(buf, 'i', '<CR>',
                string.format('<cmd>lua _MIKU._lsprename(%d)<CR>', win),
                { silent = true })
end

function MIKU.Edit(fn, line_number)
        local edit_cmd = string.format(":e %s", fn)
        if line_number ~= nil then
                edit_cmd = string.format(":e +%d %s", line_number, fn)
        end
        vim.cmd(edit_cmd)
end

--

--   kind = {
--     Array = "",
--     Boolean = "",
--     Class = "",
--     Color = "",
--     Constant = "",
--     Constructor = "",
--     Enum = "",
--     EnumMember = "",
--     Event = "",
--     Field = "",
--     File = "",
--     Folder = "",
--     Function = "",
--     Interface = "",
--     Key = "",
--     Keyword = "",
--     Method = "",
--     Module = "",
--     Namespace = "",
--     Null = "ﳠ",
--     Number = "",
--     Object = "",
--     Operator = "",
--     Package = "",
--     Property = "",
--     Reference = "",
--     Snippet = "",
--     String = "",
--     Struct = "",
--     Text = "",
--     TypeParameter = "",
--     Unit = "",
--     Value = "",
--     Variable = "",
--   },
--   git = {
--     LineAdded = "",
--     LineModified = "",
--     LineRemoved = "",
--     FileDeleted = "",
--     FileIgnored = "◌",
--     FileRenamed = "",
--     FileStaged = "S",
--     FileUnmerged = "",
--     FileUnstaged = "",
--     FileUntracked = "U",
--     Diff = "",
--     Repo = "",
--     Octoface = "",
--     Branch = "",
--   },
--   ui = {
--     ArrowCircleDown = "",
--     ArrowCircleLeft = "",
--     ArrowCircleRight = "",
--     ArrowCircleUp = "",
--     BoldArrowDown = "",
--     BoldArrowLeft = "",
--     BoldArrowRight = "",
--     BoldArrowUp = "",
--     BoldClose = "",
--     BoldDividerLeft = "",
--     BoldDividerRight = "",
--     BoldLineLeft = "▎",
--     BookMark = "",
--     BoxChecked = "",
--     Bug = "",
--     Stacks = "",
--     Scopes = "",
--     Watches = "",
--     DebugConsole = "",
--     Calendar = "",
--     Check = "",
--     ChevronRight = ">",
--     ChevronShortDown = "",
--     ChevronShortLeft = "",
--     ChevronShortRight = "",
--     ChevronShortUp = "",
--     Circle = "",
--     Close = "",
--     CloudDownload = "",
--     Code = "",
--     Comment = "",
--     Dashboard = "",
--     DividerLeft = "",
--     DividerRight = "",
--     DoubleChevronRight = "»",
--     Ellipsis = "",
--     EmptyFolder = "",
--     EmptyFolderOpen = "",
--     File = "",
--     FileSymlink = "",
--     Files = "",
--     FindFile = "",
--     FindText = "",
--     Fire = "",
--     Folder = "",
--     FolderOpen = "",
--     FolderSymlink = "",
--     Forward = "",
--     Gear = "",
--     History = "",
--     Lightbulb = "",
--     LineLeft = "▏",
--     LineMiddle = "│",
--     List = "",
--     Lock = "",
--     NewFile = "",
--     Note = "",
--     Package = "",
--     Pencil = "",
--     Plus = "",
--     Project = "",
--     Search = "",
--     SignIn = "",
--     SignOut = "",
--     Tab = "",
--     Table = "",
--     Target = "󰀘",
--     Telescope = "",
--     Text = "",
--     Tree = "",
--     Triangle = "契",
--     TriangleShortArrowDown = "",
--     TriangleShortArrowLeft = "",
--     TriangleShortArrowRight = "",
--     TriangleShortArrowUp = "",
--   },
--   diagnostics = {
--     BoldError = "",
--     Error = "",
--     BoldWarning = "",
--     Warning = "",
--     BoldInformation = "",
--     Information = "",
--     BoldQuestion = "",
--     Question = "",
--     BoldHint = "",
--     Hint = "",
--     Debug = "",
--     Trace = "✎",
--   },
--   misc = {
--     Robot = "ﮧ",
--     Squirrel = "",
--     Tag = "",
--     Watch = "",
--     Smiley = "",
--     Package = "",
--     CircuitBoard = "",
--   },
-- }


--NOTE: lsp rename





-- Nui-Rename
-- local Input = require("nui.input")
-- local input = Input({
--         relative = "cursor",
--         position = {
--                 row = 1,
--                 col = 0,
--         },
--         size = 20,
--         border = {
--                 style = "rounded",
--                 text = {
--                         top = "[New name]",
--                         top_align = "center",
--                 },
--         },
--         win_options = {
--                 winhighlight = "Normal:Normal,FloatBorder:Normal",
--         },
-- }, {
--         prompt = "> ",
--         default_value = "",
--         on_close = function()
--                 print("Cancel!")
--         end,
--         on_submit = function(value)
--                 vim.lsp.buf.rename(value)
--                 print("Renamed to: " .. value)
--         end,
-- })
--
-- M.rename = function()
--         input:mount()
--         input:map("i", "<esc>", function()
--                 vim.cmd("stopinsert")
--                 input:unmount()
--         end, { noremap = true })
-- end
--
--


_G._MIKU = MIKU
