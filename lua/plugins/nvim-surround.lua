require("nvim-surround").setup({
	-- "Configuración" personalizada (opcional)
	keymaps = {
		insert = false, -- Modo Insert: <C-g>s
		insert_line = false, -- Modo Insert (línea): <C-g>S
		-- funcionan
		normal_line = "yS", -- Modo Normal (línea): yS
		normal_cur = "]y", -- Modo Normal (línea actual): yss
		normal_cur_line = "]Y", -- Modo Normal (línea actual): ySS
		visual = "S", -- Modo Visual: S
		visual_line = "gS", -- Modo Visual (línea): gS
		delete = "]d", -- Eliminar surrounding en modo normal
		change = "]f", -- Cambiar surrounding en modo normal
	},
	surrounds = {
		-- Surroundings personalizados (opcional)
		["("] = { "( ", " )" },
		[")"] = { "(", ")" },
		["{"] = { "{ ", " }" },
		["}"] = { "{", "}" },
		["<"] = { "< ", " >" },
		[">"] = { "<", ">" },
		["["] = { "[ ", " ]" },
		["]"] = { "[", "]" },
		['"'] = { '"', '"' },
		["'"] = { "'", "'" },
		["`"] = { "`", "`" },
	},
})
