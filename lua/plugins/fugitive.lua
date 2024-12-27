return {
	{
		"tpope/vim-fugitive",
		config = function()
			local map = vim.api.nvim_set_keymap

			-- Открывает статус репозитория
			map("n", "<leader>gs", ":Git status<CR>", { noremap = true, silent = true })

			-- Открывает окно для коммита
			map("n", "<leader>gc", ":Git commit<CR>", { noremap = true, silent = true })

			-- Пуш изменений
			map("n", "<leader>gp", ":Git push<CR>", { noremap = true, silent = true })

			-- Показывает журнал изменений
			map("n", "<leader>gl", ":Git log<CR>", { noremap = true, silent = true })

			-- Показывает информацию о текущем коммите
			map("n", "<leader>gb", ":Git blame<CR>", { noremap = true, silent = true })
		end,
	},
}
