require("nvim-surround").setup({
	-- "Configuración" personalizada (opcional)
	keymaps = {
		insert = false, -- Modo Insert: <C-g>s
		insert_line = false, -- Modo Insert (línea): <C-g>S
		normal = "[f", -- Modo Normal: ys
		normal_cur = "yss", -- Modo Normal (línea actual): yss
		normal_line = "yS", -- Modo Normal (línea): yS
		normal_cur_line = "ySS", -- Modo Normal (línea actual): ySS
		-- funcionan
		visual = "S", -- Modo Visual: S
		visual_line = "gS", -- Modo Visual (línea): gS
		delete = "]d", -- Eliminar surrounding
		change = "]f", -- Cambiar surrounding
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
