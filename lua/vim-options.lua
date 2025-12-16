vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Insert mode cursor movement
-- vim.keymap.set('i', '<c-h>', '<Left>')
-- vim.keymap.set('i', '<c-j>', '<Down>')
-- vim.keymap.set('i', '<c-k>', '<Up>')
-- vim.keymap.set('i', '<c-l>', '<Right>')

vim.keymap.set('n', '<leader>gn', ':bprevious<CR>')
vim.keymap.set('n', '<leader>gb', ':bnext<CR>')

-- Clear search highlighting
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.opt.clipboard = "unnamedplus"

vim.opt.autoread = true
vim.opt.swapfile = false
vim.opt.winborder = 'rounded'
