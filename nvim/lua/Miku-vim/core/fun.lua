local M = {}
--for btop
local Terminal = require("toggleterm.terminal").Terminal
local btop = Terminal:new({ cmd = "btop", hidden = true })
dasfjklfj
fjaskfj

local x = {
        dfsakjfk,
}
-- for run
local RUN = {
        c = function()
                vim.cmd("TermExec cmd=\"cd %:p:h && gcc %:t -o %:t:r && ./%:t:r && rm %:t:r\"")
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

M.btop = function()
        btop:toggle()
end

M.run = function()
        --get current buffer filetype
        local ftp = vim.bo.filetype
        --RUN
        RUN[ftp]()
end

M.FormatJSON = function()
        vim.cmd("%!python -m json.tool")
end






--NOTE: icon
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












return M
