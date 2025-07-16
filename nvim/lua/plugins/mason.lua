return {
	"mason-org/mason.nvim",
	cmd = "Mason",
	lazy = false,
	build = ":MasonUpdate",
	config = function()
		require("mason").setup()
	end,
}
