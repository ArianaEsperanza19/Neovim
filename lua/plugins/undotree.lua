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
