return {
    "echasnovski/mini.indentscope",
    version = "*",
    config = function ()
        require('mini.indentscope').setup({
            symbol = '│',
            delay = 0,
        })
    end,
}
