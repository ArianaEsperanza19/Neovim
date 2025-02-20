-- Configuración básica de vim-dadbod
vim.g.dbbod_url = "mysql://root@localhost:3306/laravel" -- URL de conexión a la base de datos
-- Atajo personalizado para ejecutar consultas
vim.api.nvim_set_keymap("n", "<leader>sq", ":DB mysql://root@localhost:3306/laravel<CR>", { noremap = true })

-- Opcional: Abrir resultados en una nueva pestaña
vim.g.dbbod_open_results_in_tab = 1

-- Opcional: Configurar autocompletado
require("cmp").setup.buffer({
	sources = {
		{ name = "vim-dadbod-completion" },
	},
})
