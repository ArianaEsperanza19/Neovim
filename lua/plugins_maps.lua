-- Mapeo de teclas para Ctrl-\ para abrir o cerrar la terminal
vim.api.nvim_set_keymap("n", "<C-\\>", ":lua ToggleTerminal()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-\\>", "<C-\\><C-n>:lua ToggleTerminal()<CR>", { noremap = true, silent = true })

-- Ocultar errores
require("diagnostics")
vim.api.nvim_set_keymap(
	"n",
	"<leader>td",
	'<cmd>lua require("diagnostics").toggle_diagnostics()<CR>',
	{ noremap = true, silent = true }
)
-- Asigna la combinación de teclas ma al comando de Telescope para mostrar las marcas
vim.keymap.set("n", "ma", "<cmd>Telescope vim_bookmarks<CR>", { desc = "Telescope bookmarks" })
-- Sugerencias de ortografia
vim.keymap.set("n", "z=", "<cmd>Telescope spell_suggest<CR>")

-- Mapear <leader>u para abrir/cerrar undotree
vim.api.nvim_set_keymap("n", "<leader>u", ":UndotreeToggle<CR>", { noremap = true, silent = true })

-- Asignar el atajo <leader>wr para ejecutar WinResizerStartResize
vim.api.nvim_set_keymap("n", "<leader>wr", ":WinResizerStartResize<CR>", { noremap = true, silent = true })

-- Toggle para abrir/cerrar la UI de dadbod y cerrar sus ventanas y buffers temporales
vim.api.nvim_set_keymap("n", "<leader>db", ":DBUIToggle<CR>", { noremap = true, silent = true })

-- Mapeo para abrir y cerrar Gvdiffsplit
vim.api.nvim_set_keymap("n", "<leader>gw", ":Gvdiffsplit<CR>", { noremap = true, silent = true })
-- Abrir y cerrar la ventana de Gllog
vim.api.nvim_set_keymap("n", "<leader>gd", ":Gllog<CR>", { noremap = true, silent = true })
-- Atajos de Minty
vim.keymap.set("n", "<leader>xs", "<cmd>Shades<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>xu", "<cmd>Huefy<CR>", { noremap = true, silent = true })
