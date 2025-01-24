require("nvim-surround").setup({
	-- Configuración personalizada (opcional)
	keymaps = {
		insert = "<C-x>s", -- Modo Insert: <C-g>s
		insert_line = "<C-g>S", -- Modo Insert (línea): <C-g>S
		normal = "ys", -- Modo Normal: ys
		normal_cur = "yss", -- Modo Normal (línea actual): yss
		normal_line = "yS", -- Modo Normal (línea): yS
		normal_cur_line = "ySS", -- Modo Normal (línea actual): ySS
		visual = "S", -- Modo Visual: S
		visual_line = "gS", -- Modo Visual (línea): gS
		delete = "ds", -- Eliminar surrounding: ds
		change = "cs", -- Cambiar surrounding: cs
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
