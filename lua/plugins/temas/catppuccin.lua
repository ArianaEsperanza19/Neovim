return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "auto", -- latte, frappe, macchiato, mocha
		background = { -- :h background
			light = "latte", -- Cambiado a "latte" para modo claro
			dark = "mocha", -- Cambiado a "mocha" para modo oscuro
		},
		highlight_overrides = {
			all = function(colors)
				return {
					NvimTreeNormal = { fg = colors.none },
					CmpBorder = { fg = "#3e4145" },
				}
			end,
			latte = function(colors)
				return {
					Normal = { fg = colors.mantle, bg = colors.base }, -- Fondo más equilibrado
					Comment = { fg = colors.overlay0, style = { "italic" } }, -- Comentarios más suaves
					LineNr = { fg = colors.overlay1 }, -- Números de línea más claros
					StatusLine = { fg = colors.text, bg = colors.surface0 }, -- Mejor contraste en la barra de estado
				}
			end,
			frappe = function(colors)
				return {
					Normal = { fg = colors.text, bg = colors.base }, -- Fondo más oscuro para mejor contraste
					Comment = { fg = colors.overlay1, style = { "italic" } }, -- Comentarios con tono más suave
					CursorLine = { bg = colors.surface0 }, -- Resaltar la línea actual con un tono más definido
					StatusLine = { fg = colors.text, bg = colors.surface1 }, -- Mejora el contraste en la barra de estado
				}
			end,
			macchiato = function(macchiato)
				return {
					LineNr = { fg = macchiato.overlay1 },
				}
			end,
			mocha = function(mocha)
				return {
					Comment = { fg = mocha.flamingo },
				}
			end,
		},
		transparent_background = true, -- Desactiva el color de fondo (true si usas fondos transparentes)
		show_end_of_buffer = false, -- Muestra los caracteres '~' después del final del buffer
		term_colors = true, -- Activa los colores del terminal (recomendado para una mejor integración)
		dim_inactive = {
			enabled = true, -- Atenuar el fondo de ventanas inactivas
			shade = "light", -- Opciones: "dark" o "light"
			percentage = 0.15, -- Porcentaje de atenuación
		},
		no_italic = false, -- Forzar que no se usen estilos en cursiva
		no_bold = false, -- Forzar que no se usen estilos en negrita
		no_underline = false, -- Forzar que no se usen estilos subrayados
		styles = { -- Estilos para grupos de resaltado generales (:h highlight-args):
			comments = { "italic" }, -- Comentarios en cursiva
			conditionals = { "italic" },
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
			-- miscs = {}, -- Descomenta para desactivar estilos predefinidos
		},
		color_overrides = {}, -- Personaliza los colores si es necesario
		custom_highlights = {}, -- Resaltados personalizados
		default_integrations = true, -- Habilita integraciones por defecto
		integrations = {
			cmp = true, -- Integración con nvim-cmp
			gitsigns = true, -- Integración con gitsigns.nvim
			nvimtree = true, -- Integración con nvim-tree.lua
			treesitter = true, -- Integración con nvim-treesitter
			aerial = true, -- Integración con aerial.nvim
			notify = true, -- Desactiva la integración con notify.nvim
			leap = true, -- Integración con leap.nvim
			mini = {
				enabled = true, -- Integración con mini.nvim
				indentscope_color = "", -- Color personalizado para mini.indentscope
			},
			-- Para más integraciones consulta la documentación oficial:
			-- https://github.com/catppuccin/nvim#integrations [[1]]
			-- Colocar en init
			-- vim.cmd([[colorscheme catppuccin]]),
		},
	},
}
