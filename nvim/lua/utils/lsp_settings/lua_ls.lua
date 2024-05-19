return {
        settings = {
                Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = {
                                globals = { "vim" },
                                disable = { "missing-fields", "undefined-field" },
                        },
                        workspace = {
                                library = {
                                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                        [vim.fn.stdpath("config") .. "/lua"] = true,
                                },
                        },
                },
        },
}
