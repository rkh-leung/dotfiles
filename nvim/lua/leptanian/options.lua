local set = vim.opt

set.number = true
set.guicursor = ""

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

set.hidden = true
set.errorbells = true

set.smartindent = true

set.wrap = false

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.nvim/undodir"
set.undofile = true

set.hlsearch = false
set.incsearch = true

set.termguicolors = true

set.showmode = false
set.cursorline = false
set.colorcolumn = "80"
set.signcolumn = "yes"
set.showcmd = true
set.cmdheight = 1

set.updatetime = 50

vim.g.mapleader = " "
