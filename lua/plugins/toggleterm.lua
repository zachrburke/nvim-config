return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            direction = "horizontal", -- or "vertical", "float"
            size = 15,
        })

        local last_command = nil

        local function run_command(cmd)
            local terms = require("toggleterm.terminal")
            local term = terms.get(1)
            if term and term:is_open() then
                -- Send Ctrl+C to kill any running process
                term:send("\x03", false)
                -- Small delay to let the process terminate, then run new command
                vim.defer_fn(function()
                    require("toggleterm").exec(cmd)
                end, 100)
            else
                require("toggleterm").exec(cmd)
            end
        end

        -- Send command to terminal (prompts if no previous command)
        vim.keymap.set('n', '<leader>r', function()
            if last_command then
                run_command(last_command)
            else
                vim.ui.input({ prompt = "Command: " }, function(cmd)
                    if cmd then
                        last_command = cmd
                        run_command(cmd)
                    end
                end)
            end
        end, { desc = 'Run last command (or prompt for new one)' })

        -- Force new command prompt
        vim.keymap.set('n', '<leader>R', function()
            vim.ui.input({ prompt = "Command: " }, function(cmd)
                if cmd then
                    last_command = cmd
                    run_command(cmd)
                end
            end)
        end, { desc = 'Run new command' })
    end
}
