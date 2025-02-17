local function goto_definition()
        local word = vim.fn.expand("<cword>")
        local cmd = "global -ax " .. word
        local output = vim.fn.systemlist(cmd)

        if vim.v.shell_error ~= 0 or #output == 0 then
                print("Definition not found for: " .. word)
                return
        end

        local result = output[1]
        local parts = {}
        for v in result:gmatch("%S+") do
                table.insert(parts, v)
        end

        local file = parts[3]
        local line = parts[2]
        print(file .. "" .. line)

        if file and line then
                vim.cmd("edit " .. file)
                vim.cmd(":" .. line)
        else
                print("Invalid result: " .. result)
        end
end

local function goto_references()
        local word = vim.fn.expand("<cword>") -- 获取光标下的单词
        local cmd = "global -axr " .. word
        local output = vim.fn.systemlist(cmd)

        if vim.v.shell_error ~= 0 or #output == 0 then
                print("References not found for: " .. word)
                return
        end

        --TODO:
        -- send to telescope/quickfix
end
