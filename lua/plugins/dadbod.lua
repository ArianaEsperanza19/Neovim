-- This configuration integrates Dadbod with Neovim to manage and interact with databases seamlessly.
-- It requires the Dadbod plugin and proper keymaps to execute database commands.
-- Make sure to install Dadbod and set keymaps to effectively use this configuration.

-- -- Configuración de cmp (autocompletado)
-- local cmp = require("cmp")
-- cmp.setup({
-- 	sources = cmp.config.sources({
-- 		{ name = "nvim_lsp" }, -- Completado basado en LSP
-- 		{ name = "buffer" }, -- Completado basado en el buffer actual
-- 		{ name = "vim-dadbod-completion" }, -- Completado para consultas SQL
-- 	}),
-- })
--
-- -- Configuración de vim-dadbod-ui
-- vim.g.db_ui_use_nerd_fonts = 1 -- Usa iconos de Nerd Fonts
-- vim.g.db_ui_show_database_icon = 1 -- Muestra íconos de bases de datos
-- vim.g.db_ui_win_position = "left" -- Posición de la ventana
-- vim.g.db_ui_auto_execute_table_helpers = 1 -- Ejecuta automáticamente consultas básicas
--
-- -- Función para deshabilitar autocmds
-- local function disable_autocmds()
-- 	vim.cmd([[
--         augroup my_autocmds
--             autocmd!
--         augroup END
--     ]])
-- end
--
-- -- Función para habilitar autocmds
-- local function enable_autocmds()
-- 	vim.cmd([[
--         augroup my_autocmds
--             autocmd!
--         augroup END
--     ]])
-- end
--
-- -- Deshabilitar autocmds al entrar en la UI de dadbod
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "dbui",
-- 	callback = disable_autocmds,
-- })
--
-- -- Habilitar autocmds al salir de la UI de dadbod
-- vim.api.nvim_create_autocmd("BufLeave", {
-- 	pattern = "dbui",
-- 	callback = enable_autocmds,
-- })
--
-- -- Asignar nombres válidos a buffers sin nombre
-- vim.api.nvim_create_autocmd("BufAdd", {
-- 	callback = function()
-- 		if vim.fn.bufname() == "" then
-- 			vim.api.nvim_buf_set_name(0, "Untitled")
-- 		end
-- 	end,
-- })
--
-- -- Función para cerrar buffers temporales en /tmp/ y dbout
-- local function close_temporary_buffers_and_windows()
-- 	-- Iterar sobre todas las ventanas abiertas
-- 	for _, winid in ipairs(vim.api.nvim_list_wins()) do
-- 		local bufnr = vim.api.nvim_win_get_buf(winid)
-- 		if vim.api.nvim_buf_is_valid(bufnr) then
-- 			local bufname = vim.api.nvim_buf_get_name(bufnr)
-- 			local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype") or "" -- Asegurar que filetype no sea nil
--
-- 			-- Verificar si el buffer está en /tmp/ o tiene filetype = "dbout"
-- 			if bufname:match("^/tmp/") or filetype == "dbout" and filetype ~= "lua" then
-- 				-- Cerrar la ventana asociada al buffer temporal o dbout
-- 				vim.api.nvim_win_close(winid, true) -- Cierra la ventana
--
-- 				-- Verificar nuevamente si el buffer es válido antes de eliminarlo
-- 				if vim.api.nvim_buf_is_valid(bufnr) then
-- 					vim.api.nvim_buf_delete(bufnr, { force = true }) -- Cierra el buffer asociado
-- 				end
-- 			end
-- 		end
-- 	end
-- end
--
-- -- Función local para manejar el toggle
-- function Toggle_dadbod_ui()
-- 	-- Alternar la UI de vim-dadbod-ui
-- 	vim.cmd("DBUIToggle")
--
-- 	-- Verificar si la UI está abierta o cerrada
-- 	local is_dbui_open = false
-- 	for _, winid in ipairs(vim.api.nvim_list_wins()) do
-- 		local bufnr = vim.api.nvim_win_get_buf(winid)
-- 		if vim.api.nvim_buf_is_valid(bufnr) then
-- 			local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype") or ""
-- 			if filetype == "dbui" then
-- 				is_dbui_open = true
-- 				break
-- 			end
-- 		end
-- 	end
--
-- 	-- Si la UI está cerrada, cerrar los buffers temporales y dbout
-- 	if not is_dbui_open then
-- 		close_temporary_buffers_and_windows()
-- 	end
-- end
--
-- -- Toggle para abrir/cerrar la UI de dadbod y cerrar sus ventanas y buffers temporales
-- vim.api.nvim_set_keymap("n", "<leader>db", ":lua Toggle_dadbod_ui()<CR>", { noremap = true, silent = true })

-- Definir la URL de la base de datos como una variable global
vim.g.laravel = "mysql://root@localhost:3306/laravel"

-- Crear un comando personalizado para ejecutar un comando externo
vim.api.nvim_create_user_command("DB", function(opts)
	local command = opts.args
	vim.fn.system(command)
end, {
	nargs = "*", -- Permite pasar argumentos
})

-- Configuración de cmp (autocompletado)
local cmp = require("cmp")
cmp.setup({
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- Completado basado en LSP
		{ name = "buffer" }, -- Completado basado en el buffer actual
		{ name = "vim-dadbod-completion" }, -- Completado para consultas SQL
	}),
})

-- Configuración de vim-dadbod-ui
vim.g.db_ui_use_nerd_fonts = 1 -- Usa iconos de Nerd Fonts
vim.g.db_ui_show_database_icon = 1 -- Muestra íconos de bases de datos
vim.g.db_ui_win_position = "left" -- Posición de la ventana
vim.g.db_ui_auto_execute_table_helpers = 1 -- Ejecuta automáticamente consultas básicas

-- Función para deshabilitar autocmds
local function disable_autocmds()
	vim.cmd([[
        augroup my_autocmds
            autocmd!
        augroup END
    ]])
end

-- Función para habilitar autocmds
local function enable_autocmds()
	vim.cmd([[
        augroup my_autocmds
            autocmd!
        augroup END
    ]])
end

-- Deshabilitar autocmds al entrar en la UI de dadbod
vim.api.nvim_create_autocmd("FileType", {
	pattern = "dbui",
	callback = disable_autocmds,
})

-- Habilitar autocmds al salir de la UI de dadbod
vim.api.nvim_create_autocmd("BufLeave", {
	pattern = "dbui",
	callback = enable_autocmds,
})

-- Asignar nombres válidos a buffers sin nombre
vim.api.nvim_create_autocmd("BufAdd", {
	callback = function()
		if vim.fn.bufname() == "" then
			vim.api.nvim_buf_set_name(0, "Untitled")
		end
	end,
})

-- Función para cerrar buffers temporales en /tmp/ y dbout
local function close_temporary_buffers_and_windows()
	-- Obtener la lista de ventanas abiertas
	local windows = vim.api.nvim_list_wins()

	-- Iterar sobre todas las ventanas abiertas
	for _, winid in ipairs(windows) do
		-- Verificar si hay más de una ventana abierta antes de cerrar
		if #windows > 1 then
			local bufnr = vim.api.nvim_win_get_buf(winid)
			if vim.api.nvim_buf_is_valid(bufnr) then
				local bufname = vim.api.nvim_buf_get_name(bufnr)
				local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype") or "" -- Asegurar que filetype no sea nil

				-- Verificar si el buffer está en /tmp/ o tiene filetype = "dbout"
				if bufname:match("^/tmp/") or filetype == "dbui" or filetype == "dbout" and filetype ~= "lua" then
					print("Cerrando buffer temporal o dbui")
					print("filetype: " .. filetype)
					-- Cerrar la ventana asociada al buffer temporal o dbout
					vim.api.nvim_win_close(winid, true) -- Cierra la ventana

					-- Verificar nuevamente si el buffer es válido antes de eliminarlo
					if vim.api.nvim_buf_is_valid(bufnr) then
						vim.api.nvim_buf_delete(bufnr, { force = true }) -- Cierra el buffer asociado
					end
				end
			end
		else
			-- Si solo queda una ventana, limpiar su contenido en lugar de cerrarla
			-- vim.api.nvim_command("enew") -- Crea un nuevo buffer vacío
			break
		end
	end
end

-- Función local para manejar el toggle
function Toggle_dadbod_ui()
	-- Alternar la UI de vim-dadbod-ui
	vim.cmd("DBUIToggle")

	-- Verificar si la UI está abierta o cerrada
	local is_dbui_open = false
	for _, winid in ipairs(vim.api.nvim_list_wins()) do
		local bufnr = vim.api.nvim_win_get_buf(winid)
		if vim.api.nvim_buf_is_valid(bufnr) then
			local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype") or ""
			if filetype == "dbui" then
				is_dbui_open = true
				break
			end
		end
	end

	-- Si la UI está cerrada, cerrar los buffers temporales y dbout
	if not is_dbui_open then
		close_temporary_buffers_and_windows()
	end
end

-- Toggle para abrir/cerrar la UI de dadbod y cerrar sus ventanas y buffers temporales
vim.api.nvim_set_keymap("n", "<leader>db", ":lua Toggle_dadbod_ui()<CR>", { noremap = true, silent = true })
