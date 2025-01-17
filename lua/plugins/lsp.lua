return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				settings = { Lua = { diagnostics = { globals = { "vim", "require" } } } },
			})
			lspconfig.bashls.setup({})
			lspconfig.pyright.setup({
				settings = {
					pyright = {
						-- Using Ruff's import organizer
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							-- Ignore all files for analysis to exclusively use Ruff for linting
							ignore = { "*" },
						},
					},
				},
			})
			lspconfig.gopls.setup({})
			lspconfig.jdtls.setup({
				cmd = {
					vim.fn.stdpath("data") .. "/mason/packages/jdtls/bin/jdtls", -- Путь к серверу
				},
				root_dir = function(fname)
					return require("lspconfig.util").root_pattern("pom.xml", ".git")(fname)
				end,
				settings = {
					java = {
						home = "/usr/lib/jvm/java-17-openjdk", -- Укажите путь к вашей Java
					},
				},
			})
			lspconfig.html.setup({})
			lspconfig.cssls.setup({})
			lspconfig.jsonls.setup({})
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- ctrl+o - вернуться назад vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- смотрим сигнатуру vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename Symbol" })
					vim.keymap.set({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<Leader>lf", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})
		end,
	},
}
