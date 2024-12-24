return {
	{
		"tpope/vim-fugitive",
		config = function()
			local map = vim.api.nvim_set_keymap

			-- Просмотр статуса репозитория
			map("n", "<leader>gs", ":Gstatus<CR>", { noremap = true, silent = true })

			-- Переключение веток
			map("n", "<leader>gb", ":Gbranch<CR>", { noremap = true, silent = true })

			-- Коммит
			map("n", "<leader>gc", ":Gcommit<CR>", { noremap = true, silent = true })

			-- Просмотр изменений
			map("n", "<leader>gd", ":Gdiff<CR>", { noremap = true, silent = true })

			-- Просмотр истории коммитов
			map("n", "<leader>gl", ":Glog<CR>", { noremap = true, silent = true })

			-- Возврат к последнему коммиту
			map("n", "<leader>gq", ":Greset --hard<CR>", { noremap = true, silent = true })
		end,
	},
}
