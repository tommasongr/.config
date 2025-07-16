return {
	"saghen/blink.cmp",
	event = "VeryLazy",
	version = "*",
	opts = {
		keymap = { preset = "default" },
		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "mono",
		},
		completion = {
			menu = {
				draw = {
					treesitter = { "lsp" },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				snippets = {
					name = "Snippets",
					module = "blink.cmp.sources.snippets",
					opts = {
						search_paths = {
							vim.fn.stdpath "config" .. "/snippets",
							vim.fn.stdpath "config" .. "/snippets" .. "/frameworks",
							vim.fn.stdpath "config" .. "/snippets" .. "/languages",
						},
					},
				},
			},
		},
	},
}
