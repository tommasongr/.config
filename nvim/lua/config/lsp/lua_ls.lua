vim.lsp.config.lua_ls = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
	settings = {
		Lua = {
			runtime = {
				-- Specify LuaJIT for Neovim
				version = "LuaJIT",
				-- Include Neovim runtime files
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Recognize `vim` as a global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			hint = {
				enable = true,
				arrayIndex = "Enable",
				await = true,
				paramName = "All",
				paramType = true,
				semicolon = "Disable",
				setType = true,
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
