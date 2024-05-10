vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set nu")
vim.cmd("set listchars=space:·")
vim.cmd("set list")
vim.cmd("set nohlsearch")
vim.keymap.set('v', 'y', '"+y', {})
vim.keymap.set('i', '<c-s>', '<Esc>:w<CR>', {})
vim.keymap.set('n', '<c-s>', ':w<CR>', {})
vim.keymap.set('v', '<c-s>', '<Esc>:w<CR>', {})
vim.opt.termguicolors = true
vim.g.mapleader = " "
