return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })

            local wk = require("which-key")
            wk.register({
                ["K"] = {vim.lsp.buf.hover, "Method docs"},
                ["<leader>ca"] = {vim.lsp.buf.code_action, "Code action"},
                ["<F12>"] = {vim.lsp.buf.definition, "Go to definition"},
                ["<leader>lr"] = {":LspRestart<CR>", "Restart LSP server"},
            })
        end

    }
}
