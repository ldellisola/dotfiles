local os = require("lucasd.utils.os")

local commentKey = os.isWindows() and "<C-_>" or "!__comment"

return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		toggler = {
			line = commentKey,
		},
		opleader = {
			line = commentKey,
		},
	},
	lazy = false,
}
