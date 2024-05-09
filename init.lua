vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set nu")
vim.cmd("set listchars=space:·")
vim.cmd("set list")
vim.cmd("set nohlsearch")
vim.opt.termguicolors = true
vim.g.mapleader = " "


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require('vgit').setup()

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>df', builtin.live_grep, {})
vim.keymap.set('n', '<leader>e', '<cmd>:Neotree toggle<CR>', {})

local configs = require("nvim-treesitter.configs")
configs.setup({
    ensure_installed = { "python", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },  
})

vim.cmd.colorscheme "OceanicNext"
