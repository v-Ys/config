local function process_diff(data)
        -- Adapted from https://github.com/wbthomason/nvim-vcs.lua
        local added, removed, modified = 0, 0, 0
        for _, line in ipairs(data) do
                if string.find(line, [[^@@ ]]) then
                        local tokens = vim.fn.matchlist(line, [[^@@ -\v(\d+),?(\d*) \+(\d+),?(\d*)]])
                        local line_stats = {
                                mod_count = tokens[3] == nil and 0 or tokens[3] == '' and 1 or
                                    tonumber(tokens[3]),
                                new_count = tokens[5] == nil and 0 or tokens[5] == '' and 1 or
                                    tonumber(tokens[5]),
                        }

                        if line_stats.mod_count == 0 and line_stats.new_count > 0 then
                                added = added + line_stats.new_count
                        elseif line_stats.mod_count > 0 and line_stats.new_count == 0 then
                                removed = removed + line_stats.mod_count
                        else
                                local min = math.min(line_stats.mod_count, line_stats.new_count)
                                modified = modified + min
                                added = added + line_stats.new_count - min
                                removed = removed + line_stats.mod_count - min
                        end
                end
        end
        return { added = added, modified = modified, removed = removed }
end



local function get_git_diff_stats(file_path)
        if not file_path or #file_path == 0 then
                return { added = 0, modified = 0, removed = 0 }
        end

        local diff_output_cache = {}
        local cmd = string.format(
                [[git -C %s --no-pager diff --no-color --no-ext-diff -U0 -- %s]],
                vim.fn.fnamemodify(file_path, ":h"),
                vim.fn.fnamemodify(file_path, ":t")
        )

        local handle = io.popen(cmd)
        if not handle then
                return { added = 0, modified = 0, removed = 0 }
        end

        for line in handle:lines() do
                table.insert(diff_output_cache, line)
        end
        handle:close()


        return process_diff(diff_output_cache)
end



return function()
        local conditions = require("heirline.conditions")
        local utils = require("heirline.utils")

        vim.api.nvim_create_autocmd("BufEnter", {
                callback = function()
                        local buffer_path = vim.fn.expand('%:p:h')
                        local git_status = vim.fn.system('git -C "' ..
                                buffer_path .. '" rev-parse --is-inside-work-tree 2>/dev/null')
                        git_status = git_status:match("^%s*(.-)%s*$")

                        local is_git_repo = git_status == "true"
                        vim.b.is_git_repo = is_git_repo
                end,
                desc = "Set vim.b.if_git_repo based on Git repository status",
        })

        local Space = { provider = "  " }
        local Align = { provider = "%=" }
        local FileIcon = {
                init = function(self)
                        local filename = self.filename
                        -- local extension = vim.fn.fnamemodify(filename, ":e")
                        local extension = vim.bo.filetype
                        self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename,
                                extension, { default = true })
                end,
                provider = function(self)
                        return self.icon and (self.icon .. " ")
                end,
                hl = function(self)
                        return { fg = self.icon_color }
                end
        }



        local FileName = {
                provider = function(self)
                        -- trim the pattern relative to the current directory
                        local filename = vim.fn.fnamemodify(self.filename, ":.")
                        if filename == "" then return "[No Name]" end
                        filename = vim.fn.fnamemodify(filename, ":~")

                        -- if the filename would occupy more than 1/4th of the available space,
                        -- trim the file path to its initials
                        if not conditions.width_percent_below(#filename, 0.5) then
                                filename = vim.fn.pathshorten(filename)
                        end
                        return filename
                end,
                hl = function(self)
                        return self.style_filename
                end
        }

        local FileFlags = {
                {
                        condition = function()
                                return vim.bo.modified
                        end,
                        provider = "[+]",
                },
                {
                        condition = function()
                                return not vim.bo.modifiable or vim.bo.readonly
                        end,
                        provider = "[]",
                },
        }

        local FileNameBlock = {
                -- let's first set up some attributes needed by this component and it's children
                init = function(self)
                        self.filename = vim.api.nvim_buf_get_name(0)
                end,

                FileIcon,
                FileName,
                FileFlags,
                { provider = '%<' }, -- this means that the statusline is cut here when there's not enough space
        }

        local WorkDir = {

                provider = function()
                        local icon = (vim.fn.haslocaldir(0) == 1 and "󰌶 " or "")
                        local cwd = vim.fn.getcwd(0)
                        cwd = vim.fn.fnamemodify(cwd, ":~")
                        if not conditions.width_percent_below(#cwd, 0.25) then
                                cwd = vim.fn.pathshorten(cwd)
                        end
                        local trail = cwd:sub(-1) == '/' and '' or "/"
                        return icon .. cwd .. trail
                end,
                hl = function(self)
                        return self.style_workdir
                end
        }



        local BufType = {
                provider = function()
                        return vim.bo.filetype
                end,
                hl = function(self)
                        return self.style_buftype
                end
        }

        local Ruler = {
                provider = "%2P",
        }

        local Diagnostics = {

                condition = conditions.has_diagnostics,

                static = {

                        error_icon = "",
                        warn_icon  = "",
                        info_icon  = "",
                        hint_icon  = "",
                },

                init = function(self)
                        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
                        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
                        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
                        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

                        self.style_diagnostic_error = { fg = utils.get_highlight("DiagnosticError").fg }
                        self.style_diagnostic_warn = { fg = utils.get_highlight("DiagnosticWarn").fg }
                        self.style_diagnostic_info = { utils.get_highlight("DiagnosticInfo").fg }
                        self.style_diagnostic_hint = { fg = utils.get_highlight("DiagnosticHint").fg }
                end,


                update = { "DiagnosticChanged", "BufEnter" },

                {
                        provider = function(self)
                                return self.errors > 0 and (self.error_icon .. " " .. self.errors .. " ")
                        end,
                        hl = function(self)
                                return self.style_diagnostic_error
                        end
                },
                {
                        provider = function(self)
                                return self.warnings > 0 and (self.warn_icon .. " " .. self.warnings .. " ")
                        end,
                        hl = function(self)
                                return self.style_diagnostic_warn
                        end
                },
                {
                        provider = function(self)
                                return self.info > 0 and (self.info_icon .. " " .. self.info .. " ")
                        end,
                        hl = function(self)
                                return self.style_diagnostic_info
                        end
                },
                {
                        provider = function(self)
                                return self.hints > 0 and (self.hint_icon .. " " .. self.hints)
                        end,
                        hl = function(self)
                                return self.style_diagnostic_hint
                        end
                },
        }


        local Git = {
                condition = function()
                        return vim.b.is_git_repo
                end,
                update = { "BufEnter", "BufWritePost" },

                init = function(self)
                        local current_file = vim.fn.expand('%:p')
                        local file_dir = vim.fn.fnamemodify(current_file, ":h")
                        local command = 'git -C "' .. file_dir .. '" rev-parse --abbrev-ref HEAD'

                        local branch_name = vim.fn.systemlist(command)[1]
                        -- 如果是 detached HEAD 状态，则 rev-parse 会返回 "HEAD" ，此时获取提交哈希
                        if branch_name == "HEAD" then
                                command = 'git -C "' .. file_dir .. '" rev-parse --short HEAD'
                                branch_name = vim.fn.systemlist(command)[1]
                        end

                        self.branch = branch_name
                        self.diff_dict = get_git_diff_stats(current_file)
                        self.has_changes = self.diff_dict.added ~= 0 or self.diff_dict.removed ~= 0 or
                            self.diff_dict.modified ~= 0

                        self.style_branch = { fg = utils.get_highlight("Keyword").fg, bold = true }
                        self.style_added = { fg = utils.get_highlight("diffAdded").fg, bold = true }
                        self.style_removed = { fg = utils.get_highlight("diffRemoved").fg, bold = true }
                        self.style_modified = { fg = utils.get_highlight("diffChanged").fg, bold = true }
                end,

                {
                        provider = function(self)
                                return " " .. self.branch
                        end,
                        hl = function(self)
                                return self.style_branch
                        end
                },
                {
                        condition = function(self)
                                return self.has_changes
                        end,
                        provider = "[ ",
                        hl = { bold = true }
                },


                {
                        provider = function(self)
                                local count = self.diff_dict.added or 0
                                return count > 0 and ("+" .. count .. " ")
                        end,
                        hl = function(self)
                                return self.style_added
                        end
                },
                {
                        provider = function(self)
                                local count = self.diff_dict.removed or 0
                                return count > 0 and ("-" .. count .. " ")
                        end,
                        hl = function(self)
                                return self.style_removed
                        end
                },
                {
                        provider = function(self)
                                local count = self.diff_dict.modified or 0
                                return count > 0 and ("~" .. count .. " ")
                        end,
                        hl = function(self)
                                return self.style_modified
                        end
                },
                {
                        condition = function(self)
                                return self.has_changes
                        end,
                        provider = "]",
                        hl = { bold = true }
                },
        }

        local DAPMessages = {
                condition = function()
                        local session = require("dap").session()
                        return session ~= nil
                end,
                provider = function()
                        return " " .. require("dap").status()
                end,
                hl = "Debug"
        }


        local DefaultStatusline = {
                init = function(self)
                        self.style_filename = { fg = utils.get_highlight("Function").fg, bold = true, force = true }
                        self.style_workdir = { fg = utils.get_highlight("Function").fg, bold = true, force = true }
                end,
                Space,
                FileNameBlock,
                Space,
                Diagnostics,

                Align,

                DAPMessages,
                Space,

                Git,
                Space,
                WorkDir,
                Space,
                Ruler,
                Space,

        }
        local InactiveStatusline = {
                condition = conditions.is_not_active,
                init = function(self)
                        self.style_filename = { fg = utils.get_highlight("Function").fg, bold = true, force = true }
                end,
                Space,
                FileNameBlock,
                Align,
        }

        local SpecialStatusline = {
                condition = function()
                        return conditions.buffer_matches({
                                buftype = { "nofile", "prompt", "help", "quickfix" },
                                filetype = { "^git.*", "fugitive" },
                        })
                end,
                init = function(self)
                        self.style_buftype = { fg = utils.get_highlight("Function").fg, bold = true, force = true }
                end,

                Space,
                BufType,
                Align,
        }
        return {
                colors = {
                        git_add = utils.get_highlight("Define").fg,
                },
                statusline = {
                        hl = "Normal",
                        fallthrough = false,

                        SpecialStatusline,
                        InactiveStatusline,
                        DefaultStatusline,
                }
        }
end
