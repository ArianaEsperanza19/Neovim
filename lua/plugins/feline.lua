-- Feline is a highly configurable and customizable statusline plugin for Neovim. It allows you to create a statusline that perfectly fits your needs and preferences, displaying useful information at a glance. Feline enhances your productivity by providing an informative and visually appealing statusline that can be tailored to show exactly what you want.

local feline = require("feline")

-- Obtener los colores del esquema de colores actual
local colors = {
	bg = vim.fn.synIDattr(vim.fn.hlID("StatusLine"), "bg"),
	fg = vim.fn.synIDattr(vim.fn.hlID("StatusLine"), "fg"),
	yellow = vim.fn.synIDattr(vim.fn.hlID("WarningMsg"), "fg"),
	cyan = vim.fn.synIDattr(vim.fn.hlID("Type"), "fg"),
	darkblue = vim.fn.synIDattr(vim.fn.hlID("Identifier"), "fg"),
	green = vim.fn.synIDattr(vim.fn.hlID("String"), "fg"),
	orange = vim.fn.synIDattr(vim.fn.hlID("Constant"), "fg"),
	violet = vim.fn.synIDattr(vim.fn.hlID("Function"), "fg"),
	magenta = vim.fn.synIDattr(vim.fn.hlID("Statement"), "fg"),
	blue = vim.fn.synIDattr(vim.fn.hlID("Keyword"), "fg"),
	red = vim.fn.synIDattr(vim.fn.hlID("ErrorMsg"), "fg"),
}

-- Función para obtener el modo actual
local function get_mode()
	local mode_names = {
		n = "NORMAL",
		no = "OP-PENDING",
		nov = "OP-PENDING",
		noV = "OP-PENDING",
		["no\22"] = "OP-PENDING",
		niI = "NORMAL",
		niR = "NORMAL",
		niV = "NORMAL",
		nt = "NORMAL",
		v = "VISUAL",
		vs = "VISUAL",
		V = "V-LINE",
		["\22"] = "V-BLOCK",
		["\22s"] = "V-BLOCK",
		s = "SELECT",
		S = "S-LINE",
		["\19"] = "S-BLOCK",
		i = "INSERT",
		ic = "INSERT",
		ix = "INSERT",
		R = "REPLACE",
		Rc = "REPLACE",
		Rx = "REPLACE",
		Rv = "V-REPLACE",
		Rvc = "V-REPLACE",
		Rvx = "V-REPLACE",
		c = "COMMAND",
		cv = "EX",
		r = "REPLACE",
		rm = "MORE",
		["r?"] = "CONFIRM",
		["!"] = "SHELL",
		t = "TERMINAL",
	}
	return mode_names[vim.fn.mode()] or "UNKNOWN"
end

-- Colores para cada modo
local mode_colors = {
	NORMAL = colors.green,
	INSERT = colors.blue,
	VISUAL = colors.magenta,
	OP = colors.orange,
	["V-LINE"] = colors.violet,
	["V-BLOCK"] = colors.violet,
	SELECT = colors.red,
	REPLACE = colors.red,
	COMMAND = colors.yellow,
	TERMINAL = colors.cyan,
	["V-REPLACE"] = colors.red,
	SHELL = colors.darkblue,
	UNKNOWN = colors.red,
}

local function spell_lang()
	return vim.o.spelllang
end

local components = {
	active = { {}, {}, {} },
	inactive = { {}, {}, {} },
}

-- Modo actual
table.insert(components.active[1], {
	provider = function()
		return get_mode()
	end,
	hl = function()
		return {
			fg = mode_colors[get_mode()] or colors.red,
			bg = colors.bg,
			style = "bold",
		}
	end,
	right_sep = "",
	left_sep = " ",
})

-- Tipo de archivo
table.insert(components.active[1], {
	provider = "file_type",
	hl = {
		fg = colors.cyan,
		style = "bold",
	},
	right_sep = " ",
	left_sep = " ",
})

-- Cotejamiento
table.insert(components.active[1], {
	provider = "file_encoding",
	hl = {
		fg = colors.red,
		style = "bold",
	},
	right_sep = " ",
})

-- Directorio completo del archivo
table.insert(components.active[1], {
	provider = function()
		return vim.fn.expand("%:p:h")
	end,
	hl = {
		fg = colors.cyan,
		style = "bold",
	},
	right_sep = " ",
})

-- Errores de compilación u ortografía
table.insert(components.active[1], {
	provider = "diagnostic_errors",
	hl = {
		fg = colors.red,
		style = "bold",
	},
	right_sep = " ",
})

-- Advertencias
table.insert(components.active[1], {
	provider = "diagnostic_warnings",
	hl = {
		fg = colors.yellow,
		style = "bold",
	},
	right_sep = " ",
})

-- Nombre de la rama actual
table.insert(components.active[3], {
	provider = function()
		local branch = vim.fn.FugitiveHead()
		if branch ~= "" then
			return " " .. branch
		else
			return vim.fn.expand("%:t:r")
		end
	end,
	hl = {
		fg = colors.red,
		style = "bold",
	},
	right_sep = " ",
})

-- Número de palabras
table.insert(components.active[3], {
	provider = function()
		local wc = vim.fn.wordcount()
		return tostring(wc.words) .. " words"
	end,
	hl = {
		fg = colors.cyan,
		style = "bold",
	},
	right_sep = " ",
})

-- Porcentaje del documento recorrido
table.insert(components.active[3], {
	provider = function()
		local current_line = vim.fn.line(".")
		local total_lines = vim.fn.line("$")
		local percentage = math.floor((current_line / total_lines) * 100)
		return tostring(percentage) .. "%%"
	end,
	hl = {
		fg = colors.red,
		style = "bold",
	},
	right_sep = " ",
})

-- Línea del cursor
table.insert(components.active[3], {
	provider = "position",
	hl = {
		fg = colors.cyan,
		style = "bold",
	},
	right_sep = " ",
})

-- Diccionario
table.insert(components.active[3], {
	provider = spell_lang,
	enabled = function()
		return vim.o.spell
	end,
	icon = "暈 ", -- Puedes cambiar el icono si lo deseas
	hl = {
		fg = colors.red,
		style = "bold",
	},
	right_sep = " ",
})

-- Configuración de Feline
feline.setup({
	components = components,
	colors = {
		bg = colors.bg,
		fg = colors.fg,
	},
})
