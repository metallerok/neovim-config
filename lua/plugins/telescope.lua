return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup({
              defaults = {
                layout_config = {
                  horizontal = {
                    preview_cutoff = 0,
                  },
                },
                -- configure to use ripgrep
                vimgrep_arguments = {
                  "rg",
                  "--follow",        -- Follow symbolic links
                  "--hidden",        -- Search for hidden files
                  "--no-heading",    -- Don't group matches by each file
                  "--with-filename", -- Print the file path with the matched lines
                  "--line-number",   -- Show line numbers
                  "--column",        -- Show column numbers
                  "--smart-case",    -- Smart case search

                  -- Exclude some patterns from search
                  "--glob=!**/.git/*",
                  "--glob=!**/.venv/bin/*",
                  "--glob=!**/__pycache__/*",
                  "--glob=!**/.idea/*",
                  "--glob=!**/.tox/*",
                  "--glob=!**/*_docs_*.html",
                  "--glob=!**/.vscode/*",
                  "--glob=!**/build/*",
                  "--glob=!**/dist/*",
                  "--glob=!**/yarn.lock",
                  "--glob=!**/package-lock.json",
                },
              },
              pickers = {
                find_files = {
                  hidden = true,
                  -- needed to exclude some files & dirs from general search
                  -- when not included or specified in .gitignore
                  find_command = {
                    "rg",
                    "--files",
                    "--hidden",
                    "--no-ignore-vcs",
                    "--glob=!**/.git/*",
                    "--glob=!**/.venv/bin/*",
                    "--glob=!**/.tox/*",
                    "--glob=!**/__pycache__/*",
                    "--glob=!**/.idea/*",
                    "--glob=!**/.vscode/*",
                    "--glob=!**/build/*",
                    "--glob=!**/dist/*",
                    "--glob=!**/yarn.lock",
                    "--glob=!**/package-lock.json",
                    "--glob=!**/*_docs_*.html",
                  },
                },
              },
            })

            local builtin = require("telescope.builtin")
            local wk = require("which-key")
            wk.add({
                {"<C-P>", builtin.find_files, desc="Find file" },
                {"<C-g>", builtin.live_grep, desc="Live grep" },
                {"<leader>o", builtin.buffers, desc="Opened buffers" },
                {"<leader>m", builtin.marks, desc="Marks" },
                {"<leader>rr", builtin.lsp_references, desc="LSP References" },
                {"<leader>i", builtin.lsp_implementations, desc="LSP implementations" },
                {"<leader>s", builtin.lsp_document_symbols, desc="LSP document symbols" },
            })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
}
