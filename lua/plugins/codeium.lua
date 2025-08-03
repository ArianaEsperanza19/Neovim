-- INFO: Codeium is an AI-powered autocompletion plugin for Neovim that enhances coding efficiency by providing intelligent and contextual code suggestions. It helps developers write code faster and more accurately by understanding the context and suggesting completions based on common patterns and best practices.

return {
	{
		"Exafunction/codeium.vim", -- Plugin principal de Codeium
		event = "InsertEnter", -- Cargar el plugin cuando entres en modo insert
		config = function()
			-- Función para aceptar sugerencia de Codeium o pasar la acción de Tab
			_G.check_codeium_and_tab = function()
				local col = vim.fn.col(".") - 1
				if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
					return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
				else
					return vim.fn["codeium#Accept"]()
				end
			end

			-- Helper function to translate key
			_G.t = function(str)
				return vim.api.nvim_replace_termcodes(str, true, true, true)
			end

			-- Usar <Tab> normalmente si no hay sugerencia de Codeium activa
			vim.api.nvim_set_keymap(
				"i",
				"<Tab>",
				[[v:lua.check_codeium_and_tab()]],
				{ noremap = true, silent = true, expr = true }
			)

			-- Asignar <F3> para aceptar las sugerencias de Codeium
			vim.api.nvim_set_keymap(
				"i",
				"<F1><F1>",
				[[codeium#Accept()]],
				{ noremap = true, silent = true, expr = true }
			)

			-- Abrir y cerrar el chat de Codeium con F4
			vim.api.nvim_set_keymap("n", "<F4>", ":CodeiumChat<CR>", { noremap = true, silent = true })
		end,
	},
}
