local opt = vim.opt -- for conciseness

-- line numbers
opt.number = true
opt.relativenumber = true

-- error bells
opt.errorbells = false

-- tabs & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- options
opt.cmdheight = 1
opt.updatetime = 50

opt.iskeyword:append("-")
