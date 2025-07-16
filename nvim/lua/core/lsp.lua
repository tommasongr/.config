-- ============================================================================
-- LSP
--
-- Created by Tommaso Negri on 16/07/2025.
-- ============================================================================

vim.lsp.enable({
	"cssls",
	"emmet_language_server",
	"html",
	"lua_ls",
	"ruby_lsp",
	-- "tailwindcss",
	"ts_ls",
})

vim.diagnostic.config({
	virtual_text = {
		current_line = true,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
			border = "rounded",
			source = true
		},
	}
})
