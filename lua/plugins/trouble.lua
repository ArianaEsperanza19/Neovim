-- INFO: trouble is a Neovim plugin that provides a unified interface for managing diagnostics, references, and other code-related lists, making it easier to navigate and fix issues in your code. For optimal performance, it requires nvim-lspconfig and nvim-treesitter to be installed.
-- ~/.config/nvim/lua/plugins/trouble.lua

return {
	{
		"folke/trouble.nvim", -- Plugin principal de Trouble
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- Dependencia opcional para iconos
		},
		config = function()
			-- Importar Trouble
			local trouble = require("trouble")

			-- Configurar Trouble
			trouble.setup({
				icons = { -- Configuración de los íconos
					error = "",
					warning = "",
					hint = "",
					information = "",
					other = "",
				},
				fold_open = "v", -- Icono para plegar abierto
				fold_closed = ">", -- Icono para plegar cerrado
				action_keys = { -- Asignaciones para keybindings
					close = "q", -- Cierra la ventana de Trouble
					cancel = "<esc>", -- Cancela la vista previa y cierra la lista de elementos
					refresh = "r", -- Refresca la lista de elementos
					jump = { "<cr>", "<tab>" }, -- Ir al item
					open_split = { "<c-x>" }, -- Abrir en horizontal
					open_vsplit = { "<c-v>" }, -- Abrir en vertical
					open_tab = { "<c-t>" }, -- Abrir en una nueva pestaña
					jump_close = { "o" }, -- Ir al item y cerrar la ventana
					toggle_mode = "m", -- Cambia entre "document" y "workspace"
					toggle_preview = "P", -- Mostrar vista previa del item
					hover = "K", -- Mostrar información hover
					preview = "p", -- Preview del item
					close_folds = { "zM", "zm" }, -- Cerrar todos los plegados
					open_folds = { "zR", "zr" }, -- Abrir todos los plegados
					toggle_fold = { "zA", "za" }, -- Alternar entre abrir y cerrar el plegado
					previous = "k", -- Ir al item anterior
					next = "j", -- Ir al siguiente item
				},
				indent_lines = true, -- Mostrar líneas de sangría
				auto_open = false, -- Abrir Trouble automáticamente cuando hay diagnósticos
				auto_close = false, -- Cerrar Trouble automáticamente cuando no hay diagnósticos
				auto_preview = false, -- Previsualizar automáticamente el item
				auto_jump = { "lsp_definitions" }, -- Saltar automáticamente al resultado si hay solo uno
				auto_fold = false, -- Plegar automáticamente la lista de items
				signs = {
					-- Iconos de diagnóstico
					error = "",
					warning = "",
					hint = "",
					information = "",
					other = "",
				},
				use_diagnostic_signs = true, -- Usar signos de diagnóstico de LSP si están disponibles
				treesitter = false,
				ensure_installed = { "markdown_inline" }, -- Instalar con treesitter si no están instalados
			})

			-- Configuración de colores para resaltar errores en rojo
			vim.cmd([[
        highlight TroubleError guifg=#FF0000
      ]])
		end,
	},
}
