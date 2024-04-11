return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "canary",
	dependencies = {
		{ "zbirenbaum/copilot.lua" },
		{ "nvim-lua/plenary.nvim" },
	},
	opts = {
		context = "buffers",
		window = {
			layout = "float",
			relative = "cursor",
			width = 1,
			height = 0.4,
			row = 1,
		},
	},
}
