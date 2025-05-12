-- INFO: The "undotree" plugin for Neovim provides a visual representation of the undo history,
-- allowing you to navigate and manage changes in your files more effectively. It requires
-- Neovim's persistent undo feature (`undofile`) to be enabled for optimal functionality.
-- With undotree, you can explore different branches of changes, revert to previous states,
-- and better understand the history of your edits in a structured, tree-like format.
-- Cargar undotree
vim.g.undotree_SetFocusWhenToggle = 1 -- Enfocar la ventana de undotree al abrirla
vim.g.undotree_WindowLayout = 2 -- Diseño de la ventana (2 = vertical)

-- Mapear <leader>u para abrir/cerrar undotree
vim.api.nvim_set_keymap("n", "<leader>u", ":UndotreeToggle<CR>", { noremap = true, silent = true })

-- Habilitar undo file para persistencia del historial de deshacer
vim.o.undofile = true

-- Especificar el directorio donde se guardarán los archivos de deshacer
vim.o.undodir = vim.fn.expand("~/.nvim/undo") -- Cambia esto si prefieres otro directorio

-- Crear el directorio si no existe
if not vim.loop.fs_stat(vim.o.undodir) then
	vim.fn.mkdir(vim.o.undodir, "p")
end
