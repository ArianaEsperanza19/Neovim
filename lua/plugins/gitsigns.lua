-- Git Fugitive y GitSigns: una combinación poderosa para trabajar con Git en Neovim.
-- Git Fugitive: proporciona una interfaz de usuario para gestionar repositorios Git, permitiendo realizar operaciones de Git como commit, push, pull, merge, etc.
-- GitSigns: proporciona una serie de características para visualizar y gestionar los cambios en el repositorio Git, como:
--   - Señales de cambios: muestra señales visuales en el editor para indicar los cambios realizados en el archivo.
--   - Diferencias: muestra las diferencias entre versiones del archivo.
--   - Estado del archivo: muestra el estado del archivo en el repositorio Git (modificado, agregado, eliminado, etc.).
--   - Navegación: permite navegar entre los cambios realizados en el archivo.
-- La combinación de Git Fugitive y GitSigns proporciona una experiencia de usuario completa para trabajar con Git en Neovim, permitiendo gestionar y visualizar los cambios en el repositorio de manera eficiente.

require("gitsigns").setup({
	-- ... (resto de la configuración)

	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, lhs, rhs, desc)
			vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { silent = true, desc = desc })
		end

		-- Navegar a través de los hunks
		map(
			"n",
			"]c",
			"<cmd>lua vim.schedule(function() if not vim.wo.diff then package.loaded.gitsigns.next_hunk() end end)<CR>",
			"Ir al siguiente hunk"
		)

		map(
			"n",
			"[c",
			"<cmd>lua vim.schedule(function() if not vim.wo.diff then package.loaded.gitsigns.prev_hunk() end end)<CR>",
			"Ir al hunk anterior"
		)
		-- Resetear hunk
		map("n", "]u", ":Gitsigns reset_hunk<CR>", "Resetear hunk")

		-- Ver el preview del hunk
		map("n", "<leader><F4>", ":Gitsigns preview_hunk<CR>", "Ver preview del hunk")
		-- Habilitar/Desabilitar ver el blame del hunk actual
		map("n", "<F4>", ":Gitsigns toggle_current_line_blame<CR>", "Ver blame del hunk")
	end,
})
