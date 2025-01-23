return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require "nvim-treesitter.configs"
		local autotag = require "nvim-ts-autotag"

		--- @diagnostic disable-next-line: missing-fields
		treesitter.setup {
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		}

		autotag.setup {
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = true,
				filetypes = {
					"html",
					"xml",
					"eruby",
					"embedded_template",
				},
			},
		}
	end,
}
