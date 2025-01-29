return {
	"saghen/blink.cmp",
	event = "VeryLazy",
	dependencies = {
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
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
		},
		snippets = {
			preset = "luasnip",
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
			active = function(filter)
				if filter and filter.direction then
					return require("luasnip").jumpable(filter.direction)
				else
					return require("luasnip").in_snippet()
				end
			end,
			jump = function(direction)
				require("luasnip").jump(direction)
			end,
		},
	},
	config = function(_, opts)
		require("luasnip.loaders.from_vscode").lazy_load { paths = "./snippets/languages" }
		require("luasnip.loaders.from_vscode").lazy_load { paths = "./snippets/frameworks" }
		require("blink.cmp").setup(opts)
	end,
}
