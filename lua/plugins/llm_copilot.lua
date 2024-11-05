return {
    "huggingface/llm.nvim",
    config = function()
        require("llm").setup({
            enable_suggestions_on_startup = false,
            url = "http://192.168.88.59:11434", -- llm-ls uses "/v1/completions"
            model="starcoder2-3b",
            backend = "openai",
            context_window = 4096,
            tokens_to_clear = { "<|endoftext|>" },
            -- tokens_to_clear = { "<|EOT|>" },
            fim = {
                enabled = true,
                prefix = "<fim_prefix>",
                middle = "<fim_middle>",
                suffix = "<fim_suffix>",
                -- prefix = "<PRE>",
                -- middle = "<MID>",
                -- suffix = "<SUF>",
            },
            request_body = {
                temperature = 0.2,
                top_p = 0.95,
                max_new_tokens = 60,
                max_tokens = 60,
            },
            debounce_ms = 300,
            accept_keymap = "<C-]>",
            dismiss_keymap = "<C-q>",
            lsp = {
              bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/lmm_nvim/bin",
            },
            enable_suggestions_on_files = "*", -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
            disable_url_path_completion = false, -- cf Backend
        })
    end
}
