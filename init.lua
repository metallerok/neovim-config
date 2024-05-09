vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set nu")
vim.cmd("set listchars=space:·")
vim.cmd("set list")
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

local plugins = {
    {'mhartington/oceanic-next', name="oceanic-next", priority = 1000},
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {'f-person/git-blame.nvim', name="git-blame"},
    {'tanvirtin/vgit.nvim', requires = {'nvim-lua/plenary.nvim'},
}
}
local opts = {}

require("lazy").setup(plugins, opts)
require('vgit').setup()

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>df', builtin.live_grep, {})

local configs = require("nvim-treesitter.configs")
configs.setup({
    ensure_installed = { "python", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },  
})

vim.cmd.colorscheme "OceanicNext"
