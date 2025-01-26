return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			transparent_background = true,
			integrations = { blink_cmp = true },
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme "catppuccin"
		end,
	},
	{
		"danymat/neogen",
		cmd = "Neogen",
		opts = { snippet_engine = "luasnip" },
		keys = {
			{ "<leader>cd", "<cmd>Neogen<CR>", desc = "Generate documentation" },
		},
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentfile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>l", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
		},
	},
	{
		"szw/vim-maximizer",
		cmd = "MaximizerToggle",
		keys = {
			{ "<C-w>f", "<cmd>MaximizerToggle<CR>", desc = "Toggle fullscreen" },
		},
	},
}
