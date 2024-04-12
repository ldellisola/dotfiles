return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		toggler = {
			line = "!_comment",
			-- line = "<C-/>",
		},
		opleader = {
			line = "!_comment",
			-- line = "<C-/>",
		},
	},
	lazy = false,
}
