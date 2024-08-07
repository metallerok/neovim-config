vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set nu")
vim.cmd("set relativenumber")
vim.cmd("set listchars=space:·")
vim.cmd("set list")
vim.cmd("set nowrap")
vim.cmd("set nohlsearch")
vim.cmd("set scrolloff=10")
vim.o.termguicolors = false

vim.keymap.set('v', 'y', '"+y', {})
vim.keymap.set('i', '<c-s>', '<Esc>:w<CR>', {})
vim.keymap.set('n', '<c-s>', ':w<CR>', {})
vim.keymap.set('v', '<c-s>', '<Esc>:w<CR>', {})
vim.keymap.set('n', '<c-d>', '<c-d>zz', {})
vim.keymap.set('n', '<c-u>', '<c-u>zz', {})
vim.keymap.set('n', 'n', 'nzzzv', {})
vim.keymap.set('n', 'N', 'Nzzzv', {})

-- vim.keymap.set('x', '<leader>P', "\"_dP", {}) -- not understand
vim.opt.termguicolors = true
vim.g.mapleader = " "

vim.api.nvim_set_hl(0, 'Whitespace', { fg='#343D46', bold=false })

function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#6699CC', bold=false })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=false })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#EC5f67', bold=false })
end

LineNumberColors()
