return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                pickers = {
                    find_files = {
                        hidden = true,
                        file_ignore_patterns = { "^%.git/" },
                        path_display = function(_, path)
                            local parts = vim.split(path, "/")
                            if #parts > 4 then
                                return table.concat({ unpack(parts, #parts - 3) }, "/")
                            end
                            return path
                        end,
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
            vim.keymap.set('n', '<C-t>', builtin.lsp_document_symbols, {})
            vim.keymap.set('n', '<leader>fs', function()
                builtin.lsp_dynamic_workspace_symbols({
                    file_ignore_patterns = { "%.cargo/" },
                })
            end, {})
            vim.keymap.set("n", "<leader>bb", builtin.buffers, {})

            require("telescope").load_extension("ui-select")
        end,
    },
}
