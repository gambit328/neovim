return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					go = { "goimports" }, -- Go
					python = { "black" }, -- Python
					javascript = { "prettier" }, -- JavaScript
					typescript = { "prettier" }, -- TypeScript
					css = { "prettier" }, -- CSS
					html = { "prettier" }, -- HTML
					bash = { "shfmt" }, -- Bash
					json = { "prettier" }, -- JSON
					java = { "google-java-format" }, -- Java
				},
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
}
