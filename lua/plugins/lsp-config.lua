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
                    -- "jedi_language_server",
                    "pylsp",
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
            -- lspconfig.pyright.setup({
            --     capabilities = capabilities,
            -- })
            -- lspconfig.jedi_language_server.setup({
            --     capabilities = capabilities,
            -- })
            --
            local venv_path = os.getenv('VIRTUAL_ENV')
            local py_path = nil
            -- decide which python executable to use for mypy
            if venv_path ~= nil then
                py_path = venv_path .. "/bin/python3"
            else
                py_path = ".venv/bin/python"
            end

            lspconfig.pylsp.setup({
                capabilities = capabilities,
                settings = {
                    pylsp = {
                        plugins = {
                            black = { enabled = false },
                            autopep8 = { enabled = false },
                            yapf = { enabled = false },
                            flake8 = {
                                enabled = true,
                                maxLineLength = 120
                            },
                            pylint = { enabled = false, executable = "pylint" },
                            ruff = { enabled = false },
                            pyflakes = { enabled = false },
                            pycodestyle = { enabled = false },
                              -- type checker
                            pylsp_mypy = {
                                enabled = true,
                                overrides = { "--python-executable", py_path, true },
                                report_progress = true,
                                live_mode = false
                            },
                            -- auto-completion options
                            jedi_completion = {
                                enabled = false,
                                fuzzy = true,
                            },
                            pylsp_rope = {
                                enabled = true,
                            },
                            rope_autoimport = {
                                enabled = true,
                                memory = true,
                                completions = {
                                    enabled = true
                                },
                                code_actions = {
                                    enabled = true
                                }
                            },
                            rope_completion = {
                                enabled = true,
                                eager = true
                            },
                             -- import sorting
                            isort = { enabled = true },
                        }
                    }
                }
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
                ["<leader>gR"] = {vim.lsp.buf.reference, "Go to reference"},
                ["<leader>gi"] = {vim.lsp.buf.implementation, "Go to implementation"},
                ["<leader>rn"] = {vim.lsp.buf.rename, "Rename"},
                ["<leader>lr"] = {":LspRestart<CR>", "Restart LSP server"},
            })
        end

    }
}
