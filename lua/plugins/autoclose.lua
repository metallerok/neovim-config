return {
    "m4xshen/autoclose.nvim",
    config = function()
        require("autoclose").setup({
            disabled_filetypes = { "text", "markdown" },
        })
    end
}
