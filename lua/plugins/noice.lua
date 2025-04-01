-- INFO:
-- Noice.nvim is a powerful plugin for Neovim that enhances the user interface by customizing how messages, commands, and other notifications are displayed. It provides a cleaner and more modern look to the editor by replacing traditional messages with stylish popups, split windows, or virtual text. With Noice, you can manage long command lines, view notifications in a dedicated window, and improve the overall readability of your workflow. It also integrates seamlessly with other plugins like nvim-notify for advanced notifications, making your Neovim experience more efficient and visually appealing.

return {
	{
		"folke/noice.nvim", -- Plugin principal de Noice
		event = "VeryLazy", -- Cargar el plugin de manera diferida
		dependencies = {
			"MunifTanjim/nui.nvim", -- Dependencia requerida para interfaces gráficas
			"rcarriga/nvim-notify", -- Dependencia para notificaciones mejoradas
		},
		config = function()
			-- Configuración principal de Noice
			require("noice").setup({
				-- Configuración para LSP
				lsp = {
					-- Sobrescribe la renderización de Markdown para usar Treesitter
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- Requiere hrsh7th/nvim-cmp
					},
				},

				-- Presets para facilitar la configuración
				presets = {
					bottom_search = true, -- Usa una línea de comando clásica en la parte inferior para búsquedas
					command_palette = true, -- Combina cmdline y popupmenu
					long_message_to_split = true, -- Envía mensajes largos a un split
					inc_rename = false, -- Habilita un cuadro de diálogo para inc-rename.nvim
					lsp_doc_border = false, -- Agrega un borde a los documentos flotantes y ayuda de firma
				},

				-- Rutas personalizadas para manejar mensajes específicos
				routes = {
					{
						filter = {
							event = "msg_show", -- Filtra mensajes mostrados en pantalla
							kind = "spell", -- Mensajes relacionados con correcciones ortográficas (ajusta según Poliglot)
						},
						view = "popup", -- Usa un popup interactivo
						opts = {
							size = {
								width = 80, -- Ancho del popup
								height = 20, -- Altura del popup
							},
							scrollable = true, -- Habilita el desplazamiento dentro del popup
							enter = true, -- Enfoca automáticamente el popup
						},
					},
					{
						filter = {
							event = "msg_show", -- Filtra mensajes mostrados en pantalla
							min_height = 10, -- Mensajes que superan 10 líneas
						},
						view = "split", -- Usa un split para mensajes largos
						opts = {
							size = 40, -- Altura máxima del split
							enter = true, -- Enfoca automáticamente el split
						},
					},
				},

				-- Configuración de vistas
				views = {
					split = {
						size = 40, -- Altura máxima del split
						enter = true, -- Enfoca automáticamente el split
					},
					cmdline = {
						enabled = true, -- Habilita la línea de comandos
						view = "cmdline_popup", -- Usa un popup para la línea de comandos
						opts = {
							relative = "editor", -- Posiciona la línea de comandos relativa al editor
							position = {
								row = "95%", -- Coloca la línea de comandos cerca del fondo
							},
							size = {
								width = "90%", -- Ancho máximo de la línea de comandos
							},
							win_options = {
								winblend = 0, -- Sin transparencia
							},
						},
					},
					popup = {
						max_height = 15, -- Altura máxima para popups generales
					},
					popupmenu = {
						enabled = true, -- Mejora el menú emergente
					},
					messages = {
						view = "notify", -- Usa la vista de notificaciones para los mensajes
						max_height = 50, -- Altura máxima para mensajes visibles en pantalla
						position = "bottom", -- Posición de los mensajes
						size = "auto", -- Tamaño automático basado en el contenido
					},
					notify = {
						enabled = true, -- Habilita las notificaciones mejoradas
						position = { row = 1, col = "95%" },
					},
				},
			})

			-- Mapeos personalizados para Noice
			vim.api.nvim_set_keymap("n", "<F5>", ":NoiceDisable<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>te", ":NoiceTelescope<CR>", { noremap = true, silent = true })
		end,
	},
}
