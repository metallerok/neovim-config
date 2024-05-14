return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        local harpoon = require("harpoon").setup()
        local conf = require("telescope.config").values


       local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for i, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            local make_finder = function()
                local paths = {}
                for _, item in ipairs(harpoon_files.items) do
                  table.insert(paths, item.value)
                end

                return require('telescope.finders').new_table { results = paths }
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
                attach_mappings = function(prompt_buffer_number, map)
                    map("n", "<c-d>", function()
                      local state = require("telescope.actions.state")
                      local selected_entry = state.get_selected_entry()
                      local current_picker = state.get_current_picker(prompt_buffer_number)

                      -- This is the line you need to remove the entry
                      harpoon:list():remove(selected_entry)
                      current_picker:refresh(make_finder())
                    end)

                    return true
                end,
            }):find()
        end

        local wk = require("which-key")
        wk.register({
            ["<C-e>"] = {function() toggle_telescope(harpoon:list()) end, "Open harpoon window"},
            ["<leader>h"] = {
                name = "+harpoon",
                a = {function() harpoon:list():add() end, "Harpoon add file"},
                ["1"] = {function() harpoon:list():replace_at(1) end, "Harpoon add to 1 position"},
                ["2"] = {function() harpoon:list():replace_at(2) end, "Harpoon add to 2 position"},
                ["3"] = {function() harpoon:list():replace_at(3) end, "Harpoon add to 3 position"},
                ["4"] = {function() harpoon:list():replace_at(4) end, "Harpoon add to 4 position"},
                ["5"] = {function() harpoon:list():replace_at(5) end, "Harpoon add to 5 position"},
                ["6"] = {function() harpoon:list():replace_at(6) end, "Harpoon add to 6 position"},
                ["7"] = {function() harpoon:list():replace_at(7) end, "Harpoon add to 7 position"},
                ["8"] = {function() harpoon:list():replace_at(8) end, "Harpoon add to 8 position"},
                ["9"] = {function() harpoon:list():replace_at(9) end, "Harpoon add to 9 position"},
                ["0"] = {function() harpoon:list():replace_at(0) end, "Harpoon add to 0 position"},
            },
            ["<leader>1"] = {function() harpoon:list():select(1) end, "Harpoon select file from 1 position"},
            ["<leader>2"] = {function() harpoon:list():select(2) end, "Harpoon select file from 2 position"},
            ["<leader>3"] = {function() harpoon:list():select(3) end, "Harpoon select file from 3 position"},
            ["<leader>4"] = {function() harpoon:list():select(4) end, "Harpoon select file from 4 position"},
            ["<leader>5"] = {function() harpoon:list():select(5) end, "Harpoon select file from 5 position"},
            ["<leader>6"] = {function() harpoon:list():select(6) end, "Harpoon select file from 6 position"},
            ["<leader>7"] = {function() harpoon:list():select(7) end, "Harpoon select file from 7 position"},
            ["<leader>8"] = {function() harpoon:list():select(8) end, "Harpoon select file from 8 position"},
            ["<leader>9"] = {function() harpoon:list():select(9) end, "Harpoon select file from 9 position"},
            ["<leader>0"] = {function() harpoon:list():select(0) end, "Harpoon select file from 0 position"},
            ["<leader>n"] = {function() harpoon:list():next() end, "Harpoon next"},
            ["<leader>p"] = {function() harpoon:list():prev() end, "Harpoon prev"},
        })
    end
}
