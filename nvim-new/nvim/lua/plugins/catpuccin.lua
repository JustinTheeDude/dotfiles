return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "latte", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				dark = "mocha",
			},
		})
	end,
}
