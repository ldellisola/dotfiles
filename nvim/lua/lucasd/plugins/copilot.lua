return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	vent = "InsertEnter",
	opts = {
		suggestion = { enabled = false },
		panel = { enabled = false },
		filetypes = { markdown = true },
	},
}
