return {
    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require('crates').setup()
        end,
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^9',
        lazy = false,
        init = function()
            vim.g.rustaceanvim = {
                server = {
                    settings = {
                        ['rust-analyzer'] = {
                            workspace = {
                                symbol = {
                                    search = {
                                        scope = 'workspace',
                                    },
                                },
                            },
                        },
                    },
                },
            }
        end,
    },
}
