return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },
	opts = {
		file_ignore_patterns = {
			"node_modules/",
			"vendor/",
			"heroicons/",
			"dist/",
			".next/",
			".git/",
			".gitlab/",
			"build/",
			"target/",
			"package-lock.json",
			"pnpm-lock.yaml",
			"yarn.lock",
		},
		previewers = {
			builtin = {
				extensions = {
					["png"]       = { "chafa", "{file}" },
					["webp"]       = { "chafa", "{file}" },
					["svg"]       = { "chafa", "{file}" },
					["jpg"]       = { "chafa", "{file}" },
				}
			}
		}
	},
	keys = {
		{ "<leader>sf", function() require("fzf-lua").files() end, desc = "Search all files" },
		{ "<leader>ss", function() require("fzf-lua").live_grep_native() end, desc = "Search string" },
		{ "<leader>sw", function() require("fzf-lua").grep_cword() end, desc = "Search string under cursor" },
		{ "<leader><leader>", function() require("fzf-lua").buffers() end, desc = "Search existing buffers" },
		{ "<leader>st", function() require("fzf-lua").grep({ search = "TODO" }) end, desc = "Search TODOs" },
		{ "<leader>sx", function() require("fzf-lua").grep({ search = "FIXME" }) end, desc = "Search FIXMEs" },
		{ "<leader>sn", function() require("fzf-lua").grep({ search = "NOTE" }) end, desc = "Search NOTEs" },
		{ "<leader>sh", function() require("fzf-lua").helptags() end, desc = "Search help" },
		{ "<leader>sp", function() require("fzf-lua").spell_suggest() end, desc = "Search spelling suggestions" },
	}
}
