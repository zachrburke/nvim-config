return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            vim.lsp.set_log_level("OFF")
            -- Global on_attach to handle LSP client setup
            local on_attach = function(client, bufnr)
                -- Disable semantic tokens for clients that don't properly support them
                if client.server_capabilities.semanticTokensProvider then
                    -- Only enable if properly supported
                    client.server_capabilities.semanticTokensProvider = nil
                end
            end

            -- Set default config for all LSP servers
            require("lspconfig.util").default_config = vim.tbl_extend(
                "force",
                require("lspconfig.util").default_config,
                {
                    on_attach = on_attach,
                }
            )

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gt", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>nn", vim.lsp.buf.rename, {})
            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {})
            vim.keymap.set({"n", "v"}, "<leader>f", vim.lsp.buf.format, {})
            vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, {})
            vim.keymap.set('n', '<leader>qe', function() vim.diagnostic.setqflist({severity = vim.diagnostic.severity.ERROR}) end, {})
            vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, {})

            vim.lsp.config("rust_analyzer", {
                settings = {
                    ["rust-analyzer"] = {
                        workspace = {
                            symbol = {
                                search = {
                                    scope = "workspace",
                                },
                            },
                        },
                    },
                },
            })
        end,
    },
    {
        "seblyng/roslyn.nvim",
        ft = { "cs", "razor" },
        config = function()
            vim.lsp.config("roslyn", {
                capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), {
                    textDocument = {
                        onTypeFormatting = { dynamicRegistration = false },
                    },
                }),
                on_attach = function(client, bufnr)
                    -- Enable format on type for specific characters
                    if client.supports_method("textDocument/onTypeFormatting") then
                        vim.api.nvim_create_autocmd("InsertCharPre", {
                            buffer = bufnr,
                            callback = function()
                                local char = vim.v.char
                                if char == ";" or char == "}" then
                                    vim.schedule(function()
                                        vim.lsp.buf.format({ async = true, bufnr = bufnr })
                                    end)
                                end
                            end,
                        })
                    end
                end,
                settings = {
                    ["csharp|inlay_hints"] = {
                        csharp_enable_inlay_hints_for_implicit_object_creation = true,
                        csharp_enable_inlay_hints_for_implicit_variable_types = true,

                        csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                        csharp_enable_inlay_hints_for_types = true,
                        dotnet_enable_inlay_hints_for_indexer_parameters = true,
                        dotnet_enable_inlay_hints_for_literal_parameters = true,
                        dotnet_enable_inlay_hints_for_object_creation_parameters = true,
                        dotnet_enable_inlay_hints_for_other_parameters = true,
                        dotnet_enable_inlay_hints_for_parameters = true,
                        dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
                        dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
                        dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
                    },
                    ["csharp|code_lens"] = {
                        dotnet_enable_references_code_lens = true,
                    },
                },
            })
            vim.lsp.enable("roslyn")
        end,
        init = function()
            -- We add the Razor file types before the plugin loads.
            vim.filetype.add({
                extension = {
                    razor = "razor",
                    cshtml = "razor",
                },
            })
        end,
    }
}
