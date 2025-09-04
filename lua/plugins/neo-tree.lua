return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			default_component_configs = {
				git_status = {
					symbols = {
						-- Change these symbols to whatever you prefer
						added     = "✚", -- or "A", "+", etc.
						modified  = "M", -- or "~", "●", etc.
						deleted   = "✖", -- or "D", "-", etc.
						renamed   = "󰁕", -- or "R", "→", etc.
						untracked = "?", -- or "U", "★", etc.
						ignored   = "◌", -- or "I", "○", etc.
						unstaged  = "󰄱", -- or "U", "~", etc.
						staged    = "󰱒", -- or "S", "✓", etc.
						conflict  = "󰅙", -- or "C", "!", etc.
					}
				}
			}
		})
		vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}

