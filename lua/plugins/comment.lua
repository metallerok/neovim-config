return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            -- toggler = { line = '<C-_>', block = 'gbc' },
            -- opleader = { line = '<C-_>', block = 'gb' },
            -- mappings = { basic = true },
        })
    end
}
