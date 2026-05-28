return {
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require('nvim-ts-autotag').setup({
                aliases = {
                    ["razor"] = "html",
                }
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local ensure_installed = {
                "lua", "vim", "vimdoc", "query",
                "javascript", "typescript", "tsx",
                "html", "css", "json", "yaml",
                "bash", "markdown", "markdown_inline",
                "rust", "go", "python", "c", "cpp",
            }
            require("nvim-treesitter").install(ensure_installed)

            vim.api.nvim_create_autocmd('FileType', {
                pattern = { '<filetype>' },
                callback = function()
                    vim.treesitter.start()
                    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    vim.wo[0][0].foldmethod = 'expr'
                end,
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = {
                    lookahead = true,
                },
            })

            local select = require("nvim-treesitter-textobjects.select")
            vim.keymap.set({ "x", "o" }, "af", function()
                select.select_textobject("@function.outer", "textobjects")
            end, { desc = "Select outer function" })
            vim.keymap.set({ "x", "o" }, "if", function()
                select.select_textobject("@function.inner", "textobjects")
            end, { desc = "Select inner function" })
        end,
    },
    {
        'aaronik/treewalker.nvim',
    }
}
