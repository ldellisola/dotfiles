local os = require("lucasd.utils.os")
local o = vim.opt

-- line numbers
o.relativenumber = true
o.number = true

-- tabs and indent
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true

-- search
o.ignorecase = true
o.smartcase = true

-- cursor line
o.cursorline = true

-- appaerence
o.termguicolors = true
o.background = "dark"
o.signcolumn = "yes"

-- backspace
o.backspace = "indent,eol,start"

-- clipboard
o.clipboard:append("unnamedplus")

-- split windows
o.splitright = true
o.splitbelow = true
o.iskeyword:append("-")

-- default shell
if os.isWindows() then
	o.shell = "powershell"
	o.shellcmdflag =
		"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
	o.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
	o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
	o.shellquote = ""
	o.shellxquote = ""
end
