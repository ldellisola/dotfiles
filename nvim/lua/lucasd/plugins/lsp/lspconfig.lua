local os = require("lucasd.utils.os")

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		local on_attach = function(client, bufnr)
			-- keybind options
			local opts = { noremap = true, silent = true, buffer = bufnr }

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gf", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- got to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- see definition and make edits in window

			opts.desc = "Go to implementation"
			keymap.set("n", "gI", vim.lsp.buf.implementation, opts) -- go to implementation

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

			opts.desc = "Show LSP code actions"
			keymap.set("n", "<A-CR>", vim.lsp.buf.code_action, opts) -- see available code actions
			-- keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions

			opts.desc = "Rename"
			keymap.set("n", "<C-r>", vim.lsp.buf.rename, opts) -- smart rename
			-- keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename

			opts.desc = "Show LSP diagnostics for line"
			keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts) -- show  diagnostics for line

			opts.desc = "Show LSP diagnostics for file"
			keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show diagnostics for cursor

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", function()
				vim.diagnostic.jump({ count = -1, float = true })
			end, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", function()
				vim.diagnostic.jump({ count = 1, float = true })
			end, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- see outline on right hand side
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()
		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		-- local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
		-- for type, icon in pairs(signs) do
		-- 	local hl = "DiagnosticSign" .. type
		-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		-- end
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
				texthl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
					[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
					[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
					[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
				},
				-- Optional: numhl or linehl tables if you want number or line highlighting
				numhl = {},
				linehl = {},
			},
		})

		vim.lsp.enable("nushell")

		vim.lsp.config("*", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("powershell_es", {
			bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services/",
			shell = "powershell.exe",
		})

		vim.lsp.config("emmet_ls", {
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte", "vue" },
		})

		vim.lsp.config("lua_ls", {
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		vim.lsp.config("ts_ls", {
			filetypes = { "typescript", "javascript", "vue", "typescriptreact", "typescript.tsx" },
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = os.getGlobalNodeModulesPath() .. "@vue/typescript-plugin/",
						languages = { "vue" },
					},
				},
			},
		})

		vim.lsp.config("eslint", {
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
			settings = {
				useFlatConfig = false,
				experimental = {
					useFlatConfig = false,
				},
			},
		})

		vim.lsp.config("yamlls", {
			filetypes = { "yaml" },
			settings = {
				yaml = {
					schemaStore = {
						enable = true,
					},
					schemas = {
						kubernetes = "*.yaml",
						["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
						-- ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
						["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
						-- ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
						["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
					},
				},
			},
		})
	end,
}
