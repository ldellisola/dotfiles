local setup, comment = pcall(require, "Comment")
if not setup then
	return
end

comment.setup({
	toggler = {
		line = "<C-_>",
	},
	opleader = {
		line = "<C-_>",
	},
})
