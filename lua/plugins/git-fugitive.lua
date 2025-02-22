-- Git Fugitive: una herramienta de Git integrada en Neovim que proporciona una interfaz de usuario para gestionar repositorios Git.
-- Permite realizar operaciones de Git como commit, push, pull, merge, etc. directamente desde el editor.
-- También proporciona una serie de comandos y funciones para trabajar con Git, como:
--   - :Gstatus: muestra el estado del repositorio Git.
--   - :Glog: muestra el historial de commits del repositorio.
--   - :Gdiff: muestra las diferencias entre versiones del repositorio.
--   - :Gcommit: realiza un commit del repositorio.
--   - :Gpush: sube los cambios al repositorio remoto.
--   - :Gpull: descarga los cambios del repositorio remoto.
--   - :Gmerge: realiza una fusión de ramas del repositorio.
-- Git Fugitive se integra perfectamente con Neovim, permitiendo trabajar con Git de manera eficiente y sin tener que salir del editor.
-- NOTA: ANTES DE USAR, CHEQUEAR LA RAMA ACTUAL O EL COMMIT PODRIA QUEDAR DESACOPLADO
vim.api.nvim_create_autocmd("User", {
	pattern = "FugitiveCommand",
	callback = function()
		vim.cmd("vertical botright 50vsplit")
	end,
})
vim.api.nvim_create_autocmd("BufReadCmd", {
	pattern = "fugitive://*",
	callback = function()
		vim.api.nvim_buf_set_option(0, "bufhidden", "hide")
	end,
})

vim.api.nvim_set_keymap("n", "<leader>wg", ":Gvdiffsplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gd", ":Gllog<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "fugitive",
	callback = function()
		vim.api.nvim_buf_set_option(0, "syntax", "gitstatus")
		vim.api.nvim_buf_set_option(0, "formatoptions", "c")
		vim.api.nvim_buf_set_option(0, "formatlistpat", "^\\s*\\d\\+\\s*\\(.*\\)$")
	end,
})
