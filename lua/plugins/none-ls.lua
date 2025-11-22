return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- HTML formatting (requires prettier installed)
                null_ls.builtins.formatting.prettier.with({
                    filetypes = { "html", "css", "javascript", "typescript", "json", "markdown" },
                }),
            },
        })

        -- Keymap to format current buffer
        vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = "Format buffer" })
    end,
}
