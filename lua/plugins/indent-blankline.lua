return {
    "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
    config = function ()
        -- require("ibl").setup({
        --     indent = {
        --         char = "",
        --         smart_indent_cap = true,
        --         highlight = { "CursorColumn", "Whitespace" },
        --     },
        --     scope = {
        --         char = "│",
        --         show_start = false,
        --         show_end = false,
        --     },
        -- })
        -- local hooks = require "ibl.hooks"
        -- hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
        -- hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
        -- hooks.register(
        --     hooks.type.HIGHLIGHT_SETUP,
        --     function()
        --         vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        --         vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        --         vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        --         vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        --         vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        --         vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        --         vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
        --     end
        -- )
        -- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        -- require("ibl").setup({
        --     indent = {
        --         char = "▏"
        --     },
        --     scope = {
        --         enabled = false,
        --         show_start = false,
        --     },
        --     whitespace = { highlight = { "Whitespace", "NonText" } },
        -- })
    end,
}
