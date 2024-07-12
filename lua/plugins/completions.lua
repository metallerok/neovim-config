return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            "rafamadriz/friendly-snippets",
        }
    },
    {
        "hrsh7th/nvim-cmp",
        config = function ()
            local cmp = require('cmp')
            require("luasnip.loaders.from_vscode").lazy_load()

            -- gray
            vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#808080' })
            -- blue
            vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
            vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })
            -- light blue
            vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
            vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
            vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
            -- pink
            vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
            vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
            -- front
            vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })
            vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
            vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })

            local cmp_kinds = {
              Text = '  ',
              Method = '  ',
              Function = '  ',
              Constructor = '  ',
              Field = '  ',
              Variable = '  ',
              Class = '  ',
              Interface = '  ',
              Module = '  ',
              Property = '  ',
              Unit = '  ',
              Value = '  ',
              Enum = '  ',
              Keyword = '  ',
              Snippet = '  ',
              Color = '  ',
              File = '  ',
              Reference = '  ',
              Folder = '  ',
              EnumMember = '  ',
              Constant = '  ',
              Struct = '  ',
              Event = '  ',
              Operator = '  ',
              TypeParameter = '  ',
            }

            local compare = cmp.config.compare

            cmp.setup({
                formatting = {
                    format = function(_, vim_item)
                        vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
                        return vim_item
                    end,
                },
                sorting = {
                    comparators = {
                        compare.score,
                        compare.recently_used,
                        compare.locality,
                        compare.offset,
                        compare.order,
                        compare.exact,
                        compare.kind,
                        -- compare.sort_text,
                        -- compare.length,
                    },
                },
                snippet = {
                  -- REQUIRED - you must specify a snippet engine
                  expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                  end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = {
                  ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                  ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                  ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                  ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                  ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
                  ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
                  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
                  ['<C-Space>'] = cmp.mapping(cmp.mapping.complete()),
                  ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                  ['<C-e>'] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                  }),
                  ['<CR>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = cmp.config.sources({
                  { name = 'buffer' },
                  { name = 'nvim_lsp' },
                  { name = 'luasnip' }, -- For luasnip users.
                })
            })
        end
    }
}
