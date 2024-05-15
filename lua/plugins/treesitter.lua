return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config =function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "markdown",
                    "python",
                    "vue",
                    "javascript",
                    "typescript",
                    "css",
                    "html",
                    "scss",
                },
                auto_intall = true,
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
}
