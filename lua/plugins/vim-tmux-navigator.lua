return {
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "christoomey/vim-tmux-runner",
        config = function() 
            vim.keymap.set('n', '<leader>r', function()
                vim.cmd('VtrKillRunner')
                vim.defer_fn(function()
                    vim.cmd('VtrSendCommandToRunner!')
                end, 100)
            end, { desc = 'Kill and restart tmux runner command' })
        end
    }
}
