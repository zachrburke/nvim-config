return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function() 
	  vim.cmd[[colorscheme tokyonight-storm]]
	  -- Brighten line numbers
	  vim.api.nvim_set_hl(0, "LineNr", { fg = "#7aa2f7" })
	  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f7768e", bold = true })
  end
 }
