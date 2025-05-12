-- INFO: This configuration integrates CtrlSF with Neovim to perform search and replace operations.
-- It requires the CtrlSF plugin and proper keymaps to toggle the search panel and update buffers.
-- Make sure to install CtrlSF and set keymaps to effectively use this configuration.

return {
	{
		"dyng/ctrlsf.vim", -- Plugin principal de CtrlSF
		cmd = { "CtrlSF", "CtrlSFToggle" }, -- Cargar el plugin solo cuando se ejecuten estos comandos
		config = function()
			-- Configuración principal de CtrlSF
			vim.g.ctrlsf_auto_close = {
				normal = false, -- No cerrar automáticamente en modo normal
				insert = false, -- No cerrar automáticamente en modo inserción
			}
			vim.g.ctrlsf_auto_focus = {
				at = "start", -- Enfocar la ventana de CtrlSF al abrir
			}
			vim.g.ctrlsf_populate_qflist = 1 -- Poblar la lista quickfix con los resultados de la búsqueda
			vim.g.ctrlsf_context = "-C 3" -- Mostrar 3 líneas de contexto alrededor de los resultados
			vim.g.ctrlsf_default_root = "cwd" -- Buscar desde el directorio actual
			vim.g.ctrlsf_regex_pattern = 1 -- Habilitar patrones regex
			vim.g.ctrlsf_auto_preview = 1 -- Habilitar vista previa automática
			vim.g.ctrlsf_case_sensitive = "no" -- Búsquedas insensibles a mayúsculas/minúsculas
			vim.g.ctrlsf_search_mode = "async" -- Modo de búsqueda asincrónica

			vim.g.ctrlsf_mapping = {
				openb = { key = "O", suffix = "<C-w>p" }, -- Abrir archivo en buffer
				next = "n", -- Ir al siguiente resultado
				prev = "N", -- Ir al resultado anterior
			}

			-- Atajos de teclado para abrir/cerrar CtrlSF
			vim.api.nvim_set_keymap("n", "<leader>sr", ":CtrlSFToggle<CR>", { noremap = true, silent = true }) -- Toggle CtrlSF
			vim.api.nvim_set_keymap("n", "<leader>ss", ":CtrlSF<CR>", { noremap = true, silent = true }) -- Iniciar búsqueda

			-- Habilitar autoread para que los buffers se actualicen automáticamente
			vim.o.autoread = true
		end,
	},
}
