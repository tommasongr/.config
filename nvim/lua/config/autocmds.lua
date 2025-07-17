-- ============================================================================
-- Auto commands
--
-- Created by Tommaso Negri on 16/07/2025.
-- ============================================================================

local augroup = vim.api.nvim_create_augroup("UserConfig", {})

vim.api.nvim_create_autocmd("Filetype", {
	desc = "Don't convert tabs to spaces",
	group = vim.api.nvim_create_augroup("kickstart-spaces-tabs", { clear = true }),
	callback = function()
		vim.opt.expandtab = false
	end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
	group = augroup,
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	callback = function()
		local dir = vim.fn.expand("<afile>:p:h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})

-- Disable line numbers in terminal
vim.api.nvim_create_autocmd("TermOpen", {
	group = augroup,
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
	end,
})

-- Add LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = augroup,
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buffer, desc = desc })
		end

		map("gD", vim.lsp.buf.declaration, "Go to declaration")
		map("gd", vim.lsp.buf.definition, "Go to definition")

		map("gra", vim.lsp.buf.code_action, "Code actions")
		map("gri", vim.lsp.buf.implementation, "Go to implementation")
		map("grn", vim.lsp.buf.rename, "Smart rename")
		map("grr", vim.lsp.buf.references, "Show references")
		map("grf", vim.diagnostic.open_float, "Open diagnostic float")
	end
})

vim.api.nvim_create_user_command("BufOnly", '%bdelete|edit #|normal `"',
	{ desc = "Close all other buffers other than current one" })
