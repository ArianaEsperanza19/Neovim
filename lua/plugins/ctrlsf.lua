-- This configuration integrates CtrlSF with Neovim to perform search and replace operations.
-- It requires the CtrlSF plugin and proper keymaps to toggle the search panel and update buffers.
-- Make sure to install CtrlSF and set keymaps to effectively use this configuration.

-- Atajo de teclado para abrir/cerrar CtrlSF
vim.api.nvim_set_keymap("n", "<leader>sr", ":CtrlSFToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ss", ":CtrlSF<CR>", { noremap = true, silent = true })

-- Configuración de CtrlSF
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
vim.g.ctrlsf_regex_pattern = 1

-- Habilitar autoread para que los buffers se actualicen automáticamente
vim.o.autoread = true
