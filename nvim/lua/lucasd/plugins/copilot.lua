return {
	"github/copilot.vim",
	config = function()
		-- local copilot = require("copilot")
		-- copilot.setup()
		vim.g.copilot_filetypes = { markdown = true }
	end,
}
