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
})
