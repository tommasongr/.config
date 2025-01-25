return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		--- @diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup {
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",

				"html",
				"css",
				"javascript",
				"embedded_template",

				"ruby",
				"swift",

				"xml",
				"json",
				"yaml",
				"csv",

				"bash",
				"gitignore",
				"gitattributes",
				"editorconfig",
				"dockerfile",
				"jsdoc"
			},
			sync_install = false,
			auto_install = false,
			highlight = {
				enable = true,
				-- Disable slow treesitter highlight for large files
				disable = function(_, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
			},
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				select = {
					enable = false
				}
			}
		}

		--- @diagnostic disable-next-line: missing-fields
		require("nvim-ts-autotag").setup {
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
	end
}
