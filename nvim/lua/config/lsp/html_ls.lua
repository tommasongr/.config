vim.lsp.config.html_ls = {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html", "templ", "eruby", "embedded_template" },
	root_markers = { "package.json", ".git" },
	settings = {},
	init_options = {
		provideFormatter = true,
		embeddedLanguages = { css = true, javascript = true },
		configurationSection = { "html", "css", "javascript" },
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
