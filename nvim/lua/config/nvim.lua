-- Configure Netrw
-- vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 3
-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_winsize = 25

-- Set leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Terminal
vim.g.have_nerd_font = true
vim.opt.termguicolors = true

-- Indentation
vim.opt.expandtab = false
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.softtabstop = 3
vim.opt.autoindent = true
vim.api.nvim_create_autocmd("Filetype", {
	desc = "Don't convert tabs to spaces",
	group = vim.api.nvim_create_augroup("kickstart-spaces-tabs", { clear = true }),
	callback = function()
		vim.opt.expandtab = false
	end,
})

-- Backspace
vim.opt.backspace = "indent,eol,start"

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn off by default
vim.opt.signcolumn = "no"

-- Decrease update time and mapped sequence wait time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See :help 'list'
--  and :help 'listchars'
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Do not wrap lines
vim.opt.wrap = false

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Do not include new line character in selection
vim.opt.selection = "exclusive"

-- [[ Basic Autocommands ]]
--  See :help lua-guide-autocommands

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Configure builtin terminal
vim.api.nvim_create_autocmd("TermOpen", {
	desc = "Configure builtin terminal",
	group = vim.api.nvim_create_augroup("configure-builtin-terminal", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

vim.api.nvim_create_user_command("BufOnly", '%bdelete|edit #|normal `"',
	{ desc = "Close all other buffers other than current one" })

-- Set always ignored paths
vim.opt.wildignore = { "node_modules/**" }
