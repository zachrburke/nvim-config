return {
    {
        "NTBBloodbath/color-converter.nvim",
        opts = {},
    },
    { "nvzone/volt", lazy = true },
    {
        "nvzone/minty",
        cmd = { "Shades", "Huefy" },
    },
    {
        "uga-rosa/ccc.nvim",
        config = function()
            require("ccc").setup({
                -- Your configuration here
            })
        end
    }
}
