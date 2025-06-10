require("config.lsp.lua_ls")
require("config.lsp.css_ls")
require("config.lsp.html_ls")
require("config.lsp.tailwindcss_ls")
require("config.lsp.tsserver_ls")
require("config.lsp.emmet_ls")
require("config.lsp.ruby_lsp")

vim.lsp.enable({
	"lua_ls",
	"css_ls",
	"html_ls",
	"tailwindcss_ls",
	"tsserver_ls",
	"emmet_ls",
	"ruby_lsp"
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(event)
		local options = { buffer = event.buffer, silent = true }

		options.desc = "Go to declaration"
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, options)

		options.desc = "Show LSP references"
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", options)

		options.desc = "Show LSP definitions"
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", options)

		options.desc = "See available code actions"
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, options)

		options.desc = "Smart rename"
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, options)

		options.desc = "Show documentation"
		vim.keymap.set("n", "K", vim.lsp.buf.hover, options)
	end,
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client and client:supports_method("textDocument/completion") then
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--     end
--   end,
-- })
