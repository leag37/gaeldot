vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Searching
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Line numbers and line settings
opt.number = true -- show the absolute line number of the selected line
opt.relativenumber = true -- show the relative line numbers compared to the current line
opt.wrap = false -- line wrapping
opt.cursorline = true -- highlight the current line

-- Tabs and spaces
opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- Color schemes and UI
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign columns so that text doesn't shift

-- Backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line, or insert mode start positions

-- Clipboard
opt.clipboard:append("unnamedplus") -- also use the system clipboard when when copy-pasting so we can transfer things to/from neovim

-- Window splitting
opt.splitright = true -- split vertical windows towards the right
opt.splitbelow = true -- split horizontal windows towards the bottom

-- File format options
opt.ffs = "unix,dos"
