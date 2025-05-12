-- INFO: Treesitter enhances the code editing experience by providing advanced syntax highlighting, incremental parsing, and improved code navigation. It supports multiple programming languages and allows for precise code refactoring and manipulation using Abstract Syntax Trees (AST).
-- En caso de problemas con los parser ejecuta: rm -rf ~/.local/share/nvim/site/pack/*/start/nvim-treesitter/parser

return {
	{
		"nvim-treesitter/nvim-treesitter", -- Plugin de Tree-sitter
		-- build = ":TSUpdate", -- Actualiza los parsers automáticamente
		dependencies = {
			"windwp/nvim-ts-autotag", -- Dependencia para autotag
		},
		config = function()
			-- Usar pcall para manejar errores
			local status_ok, configs = pcall(require, "nvim-treesitter.configs")
			if not status_ok then
				vim.notify("Error al cargar nvim-treesitter", vim.log.levels.ERROR)
				return
			end

			-- Configurar Tree-sitter
			configs.setup({
				ensure_installed = {
					"bash",
					"lua",
					"python",
					"javascript",
					"html",
					"css",
					"markdown",
					"markdown_inline",
					"json",
					"c",
					"php",
					"regex",
					"typescript", -- Agregado TypeScript
					"yaml", -- Agregado YAML
				}, -- Añade los lenguajes que necesites
				-- Deshabilita el lenguaje `tact`
				ignore_install = { "tact" },
				highlight = {
					enable = true, -- Habilitar resaltado de sintaxis
					additional_vim_regex_highlighting = false, -- Desactivar resaltado regex adicional para evitar conflictos
				},
				indent = {
					enable = true, -- Habilitar indentación basada en Tree-sitter
				},
				autotag = {
					enable = true, -- Habilitar autocompletado de etiquetas HTML/XML
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn", -- Iniciar la selección incremental
						node_incremental = "grn", -- Seleccionar el siguiente nodo
						scope_incremental = "grc", -- Seleccionar el siguiente ámbito
						node_decremental = "grm", -- Selección decreciente de nodo
					},
				},
				textobjects = {
					select = {
						enable = true,
						keymaps = {
							["af"] = "@function.outer", -- Seleccionar todo el bloque de una función
							["if"] = "@function.inner", -- Seleccionar el interior de una función
							["ac"] = "@class.outer", -- Seleccionar toda la clase
							["ic"] = "@class.inner", -- Seleccionar el interior de una clase
						},
					},
				},
			})
		end,
	},
}
