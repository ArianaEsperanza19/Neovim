-- INFO: The snacks.nvim  plugin enhances Neovim by providing seamless Git integration, allowing users to quickly access features like git blame for specific lines . It simplifies retrieving commit details, such as hashes, authors, and dates, directly within the editor, boosting productivity without leaving the workspace.
return {
	{
		"folke/snacks.nvim", -- Plugin principal de Snacks
		event = "VeryLazy", -- Cargar el plugin de manera diferida
		config = function()
			-- Configuración principal de Snacks
			require("snacks").setup({
				terminal = { enabled = false }, -- Mejoras para la terminal
				bigfile = { enabled = true }, -- Soporte para archivos grandes
				dashboard = { enabled = false }, -- Mejoras para la pantalla de inicio
				explorer = { enabled = true }, -- Mejoras para navegación de archivos
				indent = { enabled = true }, -- Visualización mejorada de indentación
				input = { enabled = true }, -- Mejoras para entrada de texto
				picker = { enabled = true }, -- Mejoras para selección de elementos
				notifier = { enabled = true }, -- Notificaciones personalizadas
				quickfile = { enabled = true }, -- Navegación rápida entre archivos
				scope = { enabled = true }, -- Resaltado de ámbito (scope)
				scroll = { enabled = true }, -- Mejoras para desplazamiento
				statuscolumn = { enabled = true }, -- Mejoras para la columna de estado
				words = { enabled = true }, -- Mejoras para edición de palabras
			})

			-- Mapeo personalizado para Git Blame Line
			vim.keymap.set("n", "<leader>gb", function()
				require("snacks.git").blame_line()
			end, { desc = "Git Blame Line" })
		end,
	},
}
