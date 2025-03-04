-- needs to be set before lazy vim is loaded
--

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- tabs behavior
vim.opt.expandtab = true -- replace tab input by spaces
vim.opt.smartindent = true -- syntax aware indentations for newline inserts
vim.opt.tabstop = 2 -- number of spaces per tab
vim.opt.shiftwidth = 2 -- number of spaces per indentation level

-- allows neovim to access system clipboard on linux
vim.opt.clipboard = 'unnamedplus'

-- vertical rulers at column 80 and 100
vim.opt.colorcolumn = '80,100'

-- display line numbers
vim.opt.number = true
vim.opt.relativenumber = true
