return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require "null-ls"

		null_ls.setup {
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.rubocop,
				null_ls.builtins.formatting.rubocop,
				null_ls.builtins.formatting.prettier.with {
					filetypes = {
						"css",
						"html",
						"json",
						"jsonc",
						"yaml",
						"markdown",
						"markdown.mdx",
					},
				},
			},
		}

		vim.keymap.set({ "n", "v" }, "<leader>f", vim.lsp.buf.format, { desc = "Format file or range" })
	end,
}
