return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	build = ":MasonUpdate",
	dependencies = {
		{ "WhoIsSethDaniel/mason-tool-installer.nvim", config = function() end },
	},
	config = function()
		require("mason").setup()
		require("mason-tool-installer").setup {
			ensure_installed = {
				"prettier",
				"eslint_d",
				"rubocop",
				"stylua",
			},
		}
	end,
}
