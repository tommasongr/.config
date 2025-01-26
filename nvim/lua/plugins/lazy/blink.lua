return {
	"saghen/blink.cmp",
	event = "VeryLazy",
	dependencies = {
		"L3MON4D3/LuaSnip", version = "v2.*"
	},
	version = "*",
	opts = {
		keymap = { preset = "default" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				lsp = {
					name = "lsp",
					module = "blink.cmp.sources.lsp",
					enabled = true,
					score_offset = 40,
				},
				snippets = {
					name = "snippets",
					module = "blink.cmp.sources.snippets",
					enabled = true,
					score_offset = 30,
					min_keyword_length = 2
				},
				path = {
					name = "path",
					module = "blink.cmp.sources.path",
					enabled = true,
					score_offset = 20,
					fallbacks = { "snippets", "buffer" },
				},
				buffer = {
					name = "buffer",
					module = "blink.cmp.sources.buffer",
					enabled = true,
					score_offset = 10,
					max_items = 3,
					min_keyword_length = 4,
				},
			},
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
			end
		}
	},
	config = function(_, opts)
		require("luasnip.loaders.from_vscode").lazy_load { paths = "./snippets/languages" }
		require("luasnip.loaders.from_vscode").lazy_load { paths = "./snippets/frameworks" }
		require("blink.cmp").setup(opts)
	end,
}
