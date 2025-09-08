-- INFO: Comment es un plugin que permite convertir en comentario mediante un atajo todo el texto.
return {
	{
		"numToStr/Comment.nvim", -- Plugin principal de Comment.nvim
		keys = { "\\g" },
		config = function()
			-- Importar el módulo Comment
			local comment = require("Comment")

			-- Configurar Comment.nvim
			comment.setup({
				toggler = {
					line = "\\g", -- Atajo para comentar/descomentar líneas
				},
				opleader = {
					line = "\\g", -- Atajo para comentar/descomentar líneas
				},
			})
		end,
	},
}
