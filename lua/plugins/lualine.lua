return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "filename",
            path = 4, -- parent dir + filename
          },
        },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = {
          function()
            return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
          end,
        },
      },
    })
  end,
}
