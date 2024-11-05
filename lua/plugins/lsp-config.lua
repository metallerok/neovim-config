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
                    -- "lua_ls",
                    "pyright",
                    -- "jedi_language_server",
                    "pylsp",
                    "html",
                    "sqlls",
                    "dockerls",
                    "ts_ls",
                    "volar",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

            local venv_path = os.getenv('VIRTUAL_ENV')
            local py_path = nil
            -- decide which python executable to use for mypy
            if venv_path ~= nil then
                py_path = venv_path .. "/bin/python3"
            else
                py_path = ".venv/bin/python"
            end

            -- lspconfig.lua_ls.setup({
            --     capabilities = capabilities,
            -- })
            lspconfig.pyright.setup({
                capabilities = capabilities,
                -- on_attach = function (client)
                --     client.workspace.didChangeWatchedFiles.dynamicRegistration = true
                -- end,
                settings = {
                    pyright = {
                        -- reportAssignmentType = "warning",
                        -- typeCheckingMode = "standard",
                        -- reportArgumentType = "warning",
                        -- reportAssertTypeFailure = "warning",
                        -- reportInvalidTypeForm = "warning",
                        -- reportAttributeAccessIssue = "warning",
                        -- reportInvalidTypeArguments = "warning",
                        -- reportReturnType = "warning",
                        -- reportUnusedImport = "error",
                        venvPath = venv_path
                    }
                }
            })
            -- lspconfig.jedi_language_server.setup({
            --     capabilities = capabilities,
            -- })
            --

            lspconfig.pylsp.setup({
                capabilities = capabilities,
                on_attach = function (client)
                  client.server_capabilities.renameProvider = false
                end,
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
                                enabled = false,
                                overrides = { "--python-executable", py_path, true },
                                report_progress = true,
                                live_mode = false
                            },
                            -- auto-completion options
                            jedi_completion = {
                                enabled = false,
                                fuzzy = true,
                            },
                            jedi_definition = {
                                enabled = false,
                            },
                            rope_autoimport = {
                                enabled = false,
                                memory = true,
                                completions = {
                                    enabled = true
                                },
                                code_actions = {
                                    enabled = true
                                }
                            },
                            rope_completion = {
                                enabled = false,
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
                    typescript = {
                        tsdk = "/home/administrator/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib/"
                    },
                },
            })

            lspconfig.html.setup({
                capabilities = capabilities,
            })

            lspconfig.sqlls.setup({
                capabilities = capabilities,
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.dockerls.setup({
                capabilities = capabilities,
            })

            local wk = require("which-key")
            wk.add({
                {"K", vim.lsp.buf.hover, desc="Method docs" },
                {"<leader>ca", vim.lsp.buf.code_action, desc="Code action" },
                {"<leader>gd", vim.lsp.buf.definition, desc="Go to definition" },
                {"<leader>gD", vim.lsp.buf.declaration, desc="Go to declaration" },
                {"<leader>gv", vim.lsp.buf.reference, desc="Go to reference" },
                {"<leader>gi", vim.lsp.buf.implementation, desc="Go to implementation" },
                {"<leader>rn", vim.lsp.buf.rename, desc="Rename" },
                {"<leader>lr", ":LspRestart<CR>", desc="Restart LSP server" },
            })
        end

    }
}
