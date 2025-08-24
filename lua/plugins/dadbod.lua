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
		end,
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
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
