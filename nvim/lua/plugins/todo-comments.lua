return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "TodoTelescope" },
  opts = { signs = false },
  config = true,
	-- stylua: ignore
	keys = {
		{ "]t", function() require("todo-comments").jump_next() end, desc = "Next TODO" },
		{ "[t", function() require("todo-comments").jump_prev() end, desc = "Previous TODO" },
	},
}
