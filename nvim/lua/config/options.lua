-- ============================================================================
-- Configuration
--
-- Created by Tommaso Negri on 16/07/2025.
-- ============================================================================

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Indentation
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.softtabstop = 3
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Visuals
vim.g.have_nerd_font = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "no"
-- vim.opt.colorcolumn = "100"
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.cmdheight = 1
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.showmode = false
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 300
vim.opt.list = true
vim.opt.listchars = {
	tab = "» ",
	trail = "·",
	nbsp = "␣"
}

-- Files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 0
vim.opt.autoread = true
vim.opt.autowrite = false
vim.filetype.add({
	extension = {
		jbuilder = "ruby",
	},
})

-- Behaviors
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.backspace = "indent,eol,start"
vim.opt.autochdir = false
vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.selection = "exclusive"
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.opt.modifiable = true
vim.opt.encoding = "UTF-8"
vim.opt.inccommand = "split"

-- Performance
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Cursor
vim.opt.guicursor = table.concat({
	"n-v-c:block",                                          -- Normal, Visual, Command: block
	"i-ci-ve:ver25",                                        -- Insert modes: block
	"r-cr:hor20",                                           -- Replace modes: horizontal bar 20%
	"o:hor50",                                              -- Operator-pending: horizontal bar 50%
	"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor", -- All modes: blinking + highlights
	"sm:block-blinkwait175-blinkoff150-blinkon175",         -- Showmatch: fast blinking block
}, ",")

-- Folding
vim.opt.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Command-line
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({
	"*.o",
	"*.obj",
	"*.pyc",
	"*.class",
	"*.jar",
	"node_modules/**"
})

-- Diff
vim.opt.diffopt:append("linematch:60")

-- Diagnostics
vim.diagnostic.config({ virtual_text = { current_line = true } })
