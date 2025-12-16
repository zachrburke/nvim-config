return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- HTML formatting (requires prettier installed)
                null_ls.builtins.formatting.prettier.with({
                    filetypes = { "html", "css", "javascript", "typescript", "json", "markdown" },
                    -- Explicitly set the command to avoid path issues
                    command = "prettier",
                }),
            },
            -- Only attach to supported filetypes
            on_attach = function(client, bufnr)
                -- Optional: you can add format on save here if desired
            end,
        })

        -- Keymap to format current buffer
        vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = "Format buffer" })
    end,
}
