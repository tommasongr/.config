return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable "make" == 1
			end,
		},
		"nvim-telescope/telescope-ui-select.nvim",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require "telescope"
		local actions = require "telescope.actions"
		local builtin = require "telescope.builtin"

		telescope.setup {
			defaults = {
				file_ignore_patterns = { "node_modules", "heroicons", "vendor" },
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			extensions = {
				["ui-select"] = { require("telescope.themes").get_dropdown() },
			},
		}

		-- Enable telescope extensions, if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- See `:help telescope.builtin`
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search all files" })
		vim.keymap.set("n", "<leader>sF", function() builtin.git_files { show_untracked = true } end, { desc = "Search git files" })
		vim.keymap.set("n", "<leader>ss", builtin.live_grep, { desc = "Search string" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search string under cursor" })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Search existing buffers" })
		vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Search TODOs" })
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search help" })
	end,
}
