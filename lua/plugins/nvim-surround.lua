-- INFO: The "nvim-surround" plugin enhances Neovim by providing easy ways to add, change, or delete
-- surrounding characters (e.g., quotes, brackets, tags) around text. It requires no external
-- dependencies and works seamlessly with built-in keybindings or custom mappings. For example,
-- you can quickly wrap a word in parentheses or change double quotes to single quotes with minimal effort.
return {
	{
		"kylechui/nvim-surround", -- Plugin principal de nvim-surround
		keys = { "]n", "]y", "]Y", "]v", "]V", "]d", "]a" },
		event = "VeryLazy", -- Cargar el plugin de manera diferida
		config = function()
			-- Configuración principal de nvim-surround
			require("nvim-surround").setup({
				-- Keymaps personalizados
				keymaps = {
					insert = false, -- Modo Insert: <C-g>s (desactivado)
					insert_line = false, -- Modo Insert (línea): <C-g>S (desactivado)
					normal_line = "]n", -- Modo normal -> ]n + lineas + direccion
					normal_cur = "]y", -- Modo Normal (línea actual): yss
					normal_cur_line = "]Y", -- Modo Normal (línea actual): ySS
					visual = "]v", -- Modo Visual: S
					visual_line = "]V", -- Modo Visual (línea): gS
					delete = "]d", -- Eliminar surrounding en modo normal
					change = "]a", -- Cambiar surrounding en modo normal
				},
				surrounds = {
					-- Surroundings personalizados
					["("] = { "( ", " )" }, -- Paréntesis con espacio
					[")"] = { "(", ")" }, -- Paréntesis sin espacio
					["{"] = { "{ ", " }" }, -- Llaves con espacio
					["}"] = { "{", "}" }, -- Llaves sin espacio
					["<"] = { "< ", " >" }, -- Ángulos con espacio
					[">"] = { "<", ">" }, -- Ángulos sin espacio
					["["] = { "[ ", " ]" }, -- Corchetes con espacio
					["]"] = { "[", "]" }, -- Corchetes sin espacio
					['"'] = { '"', '"' }, -- Comillas dobles
					["'"] = { "'", "'" }, -- Comillas simples
					["`"] = { "`", "`" }, -- Acentos graves
					["$"] = {
						add = function()
							return { "```", "```" }
						end,
						delete = { "^(```)().-(```)()$" },
					},
					["?"] = {
						add = function()
							return { "¿", "?" }
						end,
						delete = function()
							return require("nvim-surround.config").get_selections({
								char = "?",
								pattern = "^(¿)().-(?)()$",
							})
						end,
						change = function()
							return { "¿", "?" }
						end,
					},
					["!"] = {
						add = function()
							return { "¡", "!" }
						end,
					},
				},
			})
		end,
	},
}
