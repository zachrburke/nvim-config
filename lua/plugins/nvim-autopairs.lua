return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
        require('nvim-autopairs').setup({
            fast_wrap = {}, -- Enable fast wrap with Alt+e
            ignored_next_char = "[%w%.%&]" -- will ignore alphanumeric and `.` symbol
        })
    end
}
