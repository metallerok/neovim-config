return {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        openai_params = {
            max_tokens = 4096,
            temperature = 0.2,
            top_p = 0.95,
            min_p = 0.05,
          }
        })
        local wk = require("which-key")
        wk.add({
            {"<leader>cc", "<cmd>ChatGPT<CR>", desc="ChatGPT" },
            {"<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", desc="Edit with instruction", mode = { "n", "v" } },
            {"<leader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", desc="Grammar Correction", mode = { "n", "v" } },
            {"<leader>ci", "<cmd>ChatGPTRun complete_code<CR>", desc="Complete code", mode = { "n", "v" } },
            {"<leader>cd", "<cmd>ChatGPTRun docstring<CR>", desc="Docstring", mode = { "n", "v" } },
            {"<leader>ct", "<cmd>ChatGPTRun add_tests<CR>", desc="Add Tests", mode = { "n", "v" } },
            {"<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", desc="Optimize Code", mode = { "n", "v" } },
            {"<leader>cs", "<cmd>ChatGPTRun summarize<CR>", desc="Summarize", mode = { "n", "v" } },
            {"<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", desc="Fix Bugs", mode = { "n", "v" } },
            {"<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", desc="Explain Code", mode = { "n", "v" } },
            {"<leader>cr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc="Roxygen Edit", mode = { "n", "v" } },
            {"<leader>cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc="Code Readability Analysis", mode = { "n", "v" } },
        })

    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim", -- optional
      "nvim-telescope/telescope.nvim"
    }
}
