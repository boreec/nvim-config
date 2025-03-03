-- needs to be set before lazy vim is loaded
--

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- allows neovim to access system clipboard on linux
vim.opt.clipboard = "unnamedplus"

-- vertical rulers at column 80 and 100
vim.opt.colorcolumn = "80,100"

-- display line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- display trailing whitespaces
vim.opt.list = true
vim.opt.listchars:append({trail = "·"})
