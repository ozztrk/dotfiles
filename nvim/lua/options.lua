-- nvim/lua/options.lua

-- assing leader key to space
-- you can then think of <leader> in keybindings as space
vim.g.mapleader = ' '
vim.g.mallocalleader = ' '

vim.o.clipboard = 'unnamedplus'

vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = 'yes'

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.updatetime = 300 -- controls the amount of time (in milliseconds) that Vim waits after the last key press before triggering certain automatic events

vim.o.termguicolors = true

vim.o.mouse = 'a'
