-- init.lua
require("noice").setup({
	-- Configuración básica
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
	},
	-- Estilos de mensaje
	messages = {
		view = "mini",
		enable = true,
		view_search = false,
		override = {
			["vim.lsp.util.convert_input_to_markdown"] = true,
		},
	},
	-- Configuración de teclas
	keys = {
		{ "j", "k", "next", "prev" },
	},
	-- Agregar opciones de ajuste de altura de la línea de comando
	cmdheight = 2, -- Establece la altura de la línea de comando en 2 líneas
	cmdwinheight = 10, -- Establece la altura de la ventana de comando en 10 líneas
})
