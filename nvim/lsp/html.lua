return {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = {
		"html",
		"templ",
		"eruby",
		"embedded_template",
	},
	root_markers = {
		"package.json",
		".git"
	},
	init_options = {
		provideFormatter = true,
		embeddedLanguages = { css = true, javascript = true },
		configurationSection = { "html", "css", "javascript" },
	}
}
