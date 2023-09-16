vim.g.mapleader = " "

local k = vim.keymap

-- general keymaps
k.set("n", "<leader>nh", ":nohl<CR>")
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
-- plugins

-- vim-maximizer
k.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim tree

k.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
k.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
k.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
k.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
k.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
k.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
k.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
k.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
k.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
k.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
k.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
