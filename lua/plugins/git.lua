return {
    {
        "lewis6991/gitsigns.nvim"
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = function ()
            vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<cr>')
            require("diffview").setup({
              keymaps = {
                  file_panel = {
                        {"n", "<leader>q", ":DiffviewClose<cr>", { desc = "Close the freakin' diffview"}},
                  },
              },
          })
        end
    }
}
