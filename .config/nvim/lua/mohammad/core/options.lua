vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tab & indentation
opt.tabstop = 2 -- 2 space for tab (prettier default)
opt.shiftwidth = 2 -- 2 space for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current linewhene starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case in searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschems that can be light or dark will be mode dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode srart position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard ad default register

-- split window
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.foldmethod = "indent"
opt.foldlevelstart = 99
