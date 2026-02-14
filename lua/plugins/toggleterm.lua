return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            direction = "horizontal", -- or "vertical", "float"
            size = 15,
        })

        local last_command = nil

        -- Send command to terminal (prompts if no previous command)
        vim.keymap.set('n', '<leader>r', function()
            if last_command then
                require("toggleterm").exec(last_command)
            else
                vim.ui.input({ prompt = "Command: " }, function(cmd)
                    if cmd then
                        last_command = cmd
                        require("toggleterm").exec(cmd)
                    end
                end)
            end
        end, { desc = 'Run last command (or prompt for new one)' })

        -- Force new command prompt
        vim.keymap.set('n', '<leader>R', function()
            vim.ui.input({ prompt = "Command: " }, function(cmd)
                if cmd then
                    last_command = cmd
                    require("toggleterm").exec(cmd)
                end
            end)
        end, { desc = 'Run new command' })
    end
}
