-- In your plugins.lua or similar setup for lazy.nvim
return {
	"stevearc/dressing.nvim",
	event = "VeryLazy", -- Load it early if you want it to affect all prompts
	config = function()
		require("dressing").setup({
			-- Opcional: configura las opciones de dressing aquí
			input = {
				-- Habilita la ocultación de la entrada para los tipos de entrada sensibles
				password = { -- Puedes personalizar esto para que se aplique a prompts específicos
					mask = true, -- Mostrar '*' o similar
					cursor = "blink", -- El cursor sigue siendo visible
				},
			},
			-- Puedes añadir más configuraciones aquí
		})
	end,
}
