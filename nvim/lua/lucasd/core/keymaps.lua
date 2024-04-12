vim.g.mapleader = " "

local k = vim.keymap

-- general keymaps
k.set("n", "<leader>q/", ":nohl<CR>")
k.set("n", "x", '"_x')

k.set("n", "<leader>+", "<C-a>") -- increment
k.set("n", "<leader>-", "<C-x>") -- decrement

k.set("n", "<leader>sv", "<C-w>v") -- split window vertically
k.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
k.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
k.set("n", "<leader>sx", ":close<CR>") -- close current split window

k.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
k.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
k.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
k.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

k.set("n", "<C-d>", "yyp") -- duplicate line
k.set("n", "<C-z>", "u") -- undo

k.set("n", "<leader>c", ":CopilotChatToggle<CR>") -- toggle copilot chat
