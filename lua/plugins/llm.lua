-- return {
--     "jackMort/ChatGPT.nvim",
--     event = "VeryLazy",
--     config = function()
--       require("chatgpt").setup({
--         openai_params = {
--             max_tokens = 4096,
--             temperature = 0.2,
--             top_p = 0.95,
--             min_p = 0.05,
--             stop = nil,
--           }
--         })
--         local wk = require("which-key")
--         wk.add({
--             {"<leader>cc", "<cmd>ChatGPT<CR>", desc="ChatGPT" },
--             {"<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", desc="Edit with instruction", mode = { "n", "v" } },
--             {"<leader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", desc="Grammar Correction", mode = { "n", "v" } },
--             {"<leader>ci", "<cmd>ChatGPTRun complete_code<CR>", desc="Complete code", mode = { "n", "v" } },
--             {"<leader>cd", "<cmd>ChatGPTRun docstring<CR>", desc="Docstring", mode = { "n", "v" } },
--             {"<leader>ct", "<cmd>ChatGPTRun add_tests<CR>", desc="Add Tests", mode = { "n", "v" } },
--             {"<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", desc="Optimize Code", mode = { "n", "v" } },
--             {"<leader>cs", "<cmd>ChatGPTRun summarize<CR>", desc="Summarize", mode = { "n", "v" } },
--             {"<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", desc="Fix Bugs", mode = { "n", "v" } },
--             {"<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", desc="Explain Code", mode = { "n", "v" } },
--             {"<leader>cr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc="Roxygen Edit", mode = { "n", "v" } },
--             {"<leader>cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc="Code Readability Analysis", mode = { "n", "v" } },
--         })
--
--     end,
--     dependencies = {
--       "MunifTanjim/nui.nvim",
--       "nvim-lua/plenary.nvim",
--       "folke/trouble.nvim", -- optional
--       "nvim-telescope/telescope.nvim"
--     }
-- }
--
-- return {
--     "huggingface/llm.nvim",
--     config = function()
--         require("llm").setup({
--             url = "http://192.168.88.59:1234", -- llm-ls uses "/v1/completions"
--             model="llama3.1",
--             backend = "openai",
--             context_window = 8192,
--             tokens_to_clear = { "<|endoftext|>" },
--             fim = {
--                 enabled = true,
--                 prefix = "<fim_prefix>",
--                 middle = "<fim_middle>",
--                 suffix = "<fim_suffix>",
--             },
--             request_body = {
--                 temperature = 0.2,
--                 top_p = 0.95,
--             }
--         })
--     end
-- }
--

-- return {
--     "David-Kunz/gen.nvim",
--     config = function()
--         require("gen").setup({
--             model = "mistral", -- The default model to use.
--             quit_map = "q", -- set keymap to close the response window
--             retry_map = "<c-r>", -- set keymap to re-send the current prompt
--             accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
--             host = "192.168.88.59", -- The host running the Ollama service.
--             port = "1234", -- The port on which the Ollama service is listening.
--             display_mode = "float", -- The display mode. Can be "float" or "split" or "horizontal-split".
--             show_prompt = false, -- Shows the prompt submitted to Ollama.
--             show_model = false, -- Displays which model you are using at the beginning of your chat session.
--             no_auto_close = false, -- Never closes the window automatically.
--             file = false, -- Write the payload to a temporary file to keep the command short.
--             hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
--             init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
--             -- Function to initialize Ollama
--             command = function(options)
--                 local body = {model = options.model, stream = true}
--                 return "curl --silent --no-buffer -H 'Content-Type: application/json' -X POST http://" .. options.host .. ":" .. options.port .. "/v1/chat/completions -d $body"
--             end,
--             -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
--             -- This can also be a command string.
--             -- The executed command must return a JSON object with { response, context }
--             -- (context property is optional).
--             -- list_models = '<omitted lua function>', -- Retrieves a list of model names
--             debug = false -- Prints errors and the command which is run.
--         })
--         local wk = require("which-key")
--         wk.add({
--             {"<leader>cc", "<cmd>Gen Chat<CR>", desc="ChatGPT" },
--             {"<leader>ci", "<cmd>Gen<CR>", desc="Complete code", mode = { "n", "v" } },
--         })
--     end
-- }

--
return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
        "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
        "echasnovski/mini.pick",
        { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
    },
    config = function()
        require("codecompanion").setup({
          strategies = {
            chat = {
              adapter = "openai",
            },
            inline = {
              adapter = "openai",
            },
            agent = {
              adapter = "openai",
            },
          },
          adapters = {
            openai = function()
              return require("codecompanion.adapters").extend("openai", {
                opts = {
                    stream = true,
                },
                env = {
                  url = "http://localhost:1234",
                  api_key = " ",
                },
                headers = {
                  ["Content-Type"] = "application/json",
                  -- ["Authorization"] = "Bearer ${api_key}",
                },
                parameters = {
                    sync = true,
                },
                schema = {
                    model = {
                        default = "Llama 3.2 3B Instruct"
                    },
                    temperature = {
                        default = 0.2
                    },
                }
              })
            end,
          },
        })
    end
}
