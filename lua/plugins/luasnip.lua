-- INFO: LuaSnip is a highly flexible and extensible snippet plugin for Neovim, written in Lua. It allows users to define and use code snippets efficiently, helping to speed up the coding process by providing reusable templates that can be quickly expanded. LuaSnip supports various programming languages and integrates seamlessly with other plugins, enhancing overall productivity.

return {
	{
		"hrsh7th/nvim-cmp", -- Plugin principal de nvim-cmp
		event = "InsertEnter", -- Cargar nvim-cmp cuando entres en modo insert
		dependencies = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp", -- Fuente de completado para LSP
			"hrsh7th/cmp-buffer", -- Fuente de completado para el buffer actual
			"hrsh7th/cmp-path", -- Fuente de completado para rutas de archivos
			"L3MON4D3/LuaSnip", -- Snippets con LuaSnip
			"saadparwaiz1/cmp_luasnip", -- Fuente de completado para LuaSnip
			"rafamadriz/friendly-snippets", -- Snippets predefinidos
		},
		config = function()
			-- Importar cmp y sus dependencias
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- Configurar LuaSnip
			luasnip.config.set_config({
				history = true, -- Guarda el historial de snippets
				updateevents = "TextChanged,TextChangedI", -- Actualiza snippets al cambiar el texto
				enable_autosnippets = true, -- Habilita snippets automáticos
			})

			-- Ruta a tu carpeta de snippets
			local snippet_paths = vim.fn.stdpath("config") .. "/luasnippets/"

			-- Cargar snippets en formato Lua
			require("luasnip.loaders.from_lua").lazy_load({ paths = snippet_paths })

			-- Cargar snippets en formato VSCode
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = { snippet_paths }, -- Usa la misma ruta para ambos tipos de snippets
			})

			-- Configurar nvim-cmp
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Aceptar el elemento seleccionado
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- Completado desde LSP
					{ name = "luasnip" }, -- Completado desde LuaSnip
					{ name = "buffer" }, -- Completado desde el buffer actual
					{ name = "path" }, -- Completado para rutas de archivos
				}),
			})
		end,
	},
}
