-- Cargar undotree
vim.g.undotree_SetFocusWhenToggle = 1 -- Enfocar la ventana de undotree al abrirla
vim.g.undotree_WindowLayout = 2 -- Diseño de la ventana (2 = vertical)

-- Mapear <leader>u para abrir/cerrar undotree
vim.api.nvim_set_keymap("n", "<leader>u", ":UndotreeToggle<CR>", { noremap = true, silent = true })
