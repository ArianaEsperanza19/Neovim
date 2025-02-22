require("keymaps")
vim.g.ctrlsf_history = 1

-- Función para alternar entre abrir y cerrar el panel de CtrlSF
_G.toggle_ctrlsf = function()
	if vim.g.ctrlsf_winnr ~= nil and vim.g.ctrlsf_winnr > 0 then
		-- Si el panel está abierto, ciérralo y restablece el valor de la variable
		vim.cmd("CtrlSFClose")
		vim.g.ctrlsf_winnr = 0
	else
		-- Si el panel está cerrado, ábrelo y actualiza el valor de la variable
		vim.cmd("CtrlSFOpen")
		-- Esperar un momento para que el panel se abra completamente
		vim.defer_fn(function()
			vim.g.ctrlsf_winnr = vim.fn.bufwinid(vim.fn.bufname("CtrlSF"))
		end, 100)
	end
end

-- Función para realizar una sustitución con CtrlSF y actualizar el buffer activo
_G.replace_and_refresh = function()
	-- Realiza la sustitución
	vim.cmd("CtrlSFReplace")

	-- Fuerza la actualización del buffer activo
	vim.defer_fn(function()
		vim.cmd("checktime")
	end, 100)
end

-- Asignar el atajo <leader>sr para alternar el panel
vim.api.nvim_set_keymap("n", "<leader>sr", ":lua toggle_ctrlsf()<CR>", { noremap = true, silent = true })

-- Asignar el atajo <leader>rs para realizar la sustitución y actualizar el buffer
vim.api.nvim_set_keymap("n", "<leader>rs", ":lua replace_and_refresh()<CR>", { noremap = true, silent = true })
