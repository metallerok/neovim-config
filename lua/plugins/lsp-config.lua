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
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "volar",
                    "html",
                    "sqlls",
                    "dockerls",
                    "tsserver",
                }
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

            lspconfig.volar.setup({
                capabilities = capabilities,
                filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
                init_options = {
                    vue = {
                        hybridMode = false,
                    },
                },
            })

            lspconfig.html.setup({
                capabilities = capabilities,
            })

            lspconfig.sqlls.setup({
                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })
            lspconfig.dockerls.setup({
                capabilities = capabilities,
            })

            local wk = require("which-key")
            wk.register({
                ["K"] = {vim.lsp.buf.hover, "Method docs"},
                ["<leader>ca"] = {vim.lsp.buf.code_action, "Code action"},
                ["<leader>gd"] = {vim.lsp.buf.definition, "Go to definition"},
                ["<leader>gD"] = {vim.lsp.buf.declaration, "Go to declaration"},
                ["<leader>gr"] = {vim.lsp.buf.reference, "Go to reference"},
                ["<leader>gi"] = {vim.lsp.buf.implementation, "Go to implementation"},
                ["<leader>rn"] = {vim.lsp.buf.rename, "Rename"},
                ["<leader>lr"] = {":LspRestart<CR>", "Restart LSP server"},
            })
        end

    }
}
