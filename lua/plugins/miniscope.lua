return {
    "echasnovski/mini.indentscope",
    version = "*",
    config = function ()
        require('mini.indentscope').setup({
            symbol = '│',
            delay = 0,
        })
        vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { fg='#343D46' })
    end,
}
