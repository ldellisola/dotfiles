return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		local c = require("catppuccin")
		c.setup({
			flavour = "mocha",
		})
		vim.cmd([[ colorscheme catppuccin ]])
	end,
	priority = 1000,
}
