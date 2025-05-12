-- INFO: leap.nvim is a Neovim plugin that allows for fast and efficient navigation by jumping to visible targets in the buffer.

return {
	{
		"ggandor/leap.nvim", -- Plugin principal de Leap
		config = function()
			-- Configurar Leap
			local leap = require("leap")

			-- Definir clases de equivalencia para corchetes y comillas, además del grupo predeterminado de espacios en blanco
			leap.opts.equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" }

			-- Usar las teclas de recorrido para repetir el movimiento anterior sin invocar explícitamente Leap
			require("leap.user").set_repeat_keys("<enter>", "<backspace>")

			-- Definir un filtro de vista previa (omitir el centro de palabras alfanuméricas)
			leap.opts.preview_filter = function(ch0, ch1, ch2)
				return not (ch1:match("%s") or ch0:match("%w") and ch1:match("%w") and ch2:match("%w"))
			end

			-- Atajos para buscar con Leap
			vim.api.nvim_set_keymap("n", "<C-j>", "<Plug>(leap-forward-to)", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<C-k>", "<Plug>(leap-backward-to)", { noremap = true, silent = true })
		end,
	},
}
