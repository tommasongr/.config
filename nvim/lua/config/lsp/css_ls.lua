vim.lsp.config.css_ls = {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	root_markers = { "package.json", ".git" },
	init_options = { provideFormatter = true },
	single_file_support = true,
	settings = {
		cssVariables = {
			lookupFiles = { "**/*.less", "**/*.scss", "**/*.sass", "**/*.css" },
		},
		css = { validate = true },
		scss = { validate = true },
		less = { validate = true },
	},
	capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), {
		textDocument = {
			completion = {
				completionItem = {
					-- this causes an error using native lsp
					snippetSupport = true, -- set to false if you don't use blink
				},
			},
		},
	}),
}
