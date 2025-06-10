vim.lsp.config.ruby_lsp = {
	cmd = { "ruby-lsp" },
	filetypes = { "ruby", "eruby" },
	root_markers = { "Gemfile", ".git" },
	init_options = {
		formatter = "auto",
	},
	capabilities = {
		offsetEncoding = { "utf-16" }
	}
}
