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

-- treewalker movement
vim.keymap.set({ 'n', 'v' }, '<leader>tk', '<cmd>Treewalker Up<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>tj', '<cmd>Treewalker Down<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>th', '<cmd>Treewalker Left<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>tl', '<cmd>Treewalker Right<cr>', { silent = true })

-- Clear search highlighting
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.opt.clipboard = "unnamedplus"

vim.opt.autoread = true
vim.opt.swapfile = false

-- Set terminal title to folder name
vim.opt.title = true
vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')}"
vim.opt.winborder = 'rounded'
