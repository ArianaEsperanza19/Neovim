-- INFO: This configuration integrates Dadbod with Neovim to manage and interact with databases seamlessly.
-- It requires the Dadbod plugin and proper keymaps to execute database commands.
-- Make sure to install Dadbod and set keymaps to effectively use this configuration.
-- URL -> mysql://root@localhost/test

return {
	{
		"tpope/vim-dadbod", -- Plugin principal de Dadbod
		cmd = { "DB", "DBUIToggle" }, -- Cargar el plugin solo cuando se ejecute DB o DBUIToggle
		config = function()
			-- Definir alias de bases de datos como variables globales
			vim.g.larapp = "mysql://root@localhost:3306/Larapp"
			vim.g.fgestor = "mysql://root@localhost/Fgestor"

			vim.b.db_queries = {
				-- Alias para ver todos los usuarios
				tablas = "show tables;",
			}
		end,
	},
	{
		"kristijanhusak/vim-dadbod-ui", -- Interfaz gráfica para Dadbod
		dependencies = { "tpope/vim-dadbod" }, -- Dependencia requerida para Dadbod
		cmd = { "DBUIToggle" }, -- Cargar el plugin solo cuando se ejecute DBUIToggle
		config = function()
			-- Configuración de vim-dadbod-ui
			vim.g.db_ui_use_nerd_fonts = 1 -- Usa iconos de Nerd Fonts
			vim.g.db_ui_show_database_icon = 1 -- Muestra íconos de bases de datos
			vim.g.db_ui_win_position = "left" -- Posición de la ventana
			vim.g.db_ui_auto_execute_table_helpers = 1 -- Ejecuta automáticamente consultas básicas
		end,
	},
	{
		"kristijanhusak/vim-dadbod-completion", -- Completado para consultas SQL
		ft = { "sql", "mysql", "plsql" }, -- Cargar el plugin solo para archivos SQL
		dependencies = { "hrsh7th/nvim-cmp" }, -- Dependencia para autocompletado
		config = function()
			-- Configuración de cmp (autocompletado)
			local cmp = require("cmp")
			cmp.setup({
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- Completado basado en LSP
					{ name = "buffer" }, -- Completado basado en el buffer actual
					{ name = "vim-dadbod-completion" }, -- Completado para consultas SQL
				}),
			})
		end,
	},
}
