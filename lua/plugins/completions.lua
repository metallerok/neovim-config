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
            cmp.setup({
                snippet = {
                  -- REQUIRED - you must specify a snippet engine
                  expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                  end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
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
                  { name = 'nvim_lsp' },
                  { name = 'luasnip' }, -- For luasnip users.
                }, {
                  { name = 'buffer' },
                })
            })
        end
    }
}
