-- INFO: nvim-cmp is a completion plugin for Neovim that provides a powerful and highly configurable autocomplete experience. It supports a wide variety of completion sources, including LSP servers, buffers, file paths, snippets, and more. This plugin greatly enhances productivity by offering contextual and accurate suggestions as you type.

return {
	{
		"hrsh7th/nvim-cmp", -- Plugin principal de nvim-cmp
		event = "InsertEnter", -- Cargar nvim-cmp cuando entres en modo insert
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- Fuente de completado para LSP
			"hrsh7th/cmp-buffer", -- Fuente de completado para el buffer actual
			"hrsh7th/cmp-path", -- Fuente de completado para rutas de archivos
			"hrsh7th/cmp-cmdline", -- Fuente de completado para la línea de comandos
			"L3MON4D3/LuaSnip", -- Snippets con LuaSnip
			"saadparwaiz1/cmp_luasnip", -- Fuente de completado para LuaSnip
		},
		config = function()
			-- Importar los módulos necesarios
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- Configuración de nvim-cmp
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- Expande los snippets con LuaSnip
					end,
				},
				completion = {
					autocomplete = false,
				},
				mapping = {
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-c>"] = cmp.mapping.close(),

					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = false,
					}),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "cmdline" },
				}),
			})

			-- Configuración para autocompletado en línea de comandos
			cmp.setup.cmdline(":", {
				sources = {
					{ name = "path" },
					{ name = "cmdline" },
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig", -- Plugin principal de LSP
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- Integración entre nvim-cmp y LSP
		},
		config = function()
			-- Importar los módulos necesarios
			local lspconfig = require("lspconfig")
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			-- -- Ejemplo de configuración para un servidor LSP (ajusta según tus necesidades)
			-- lspconfig["pyright"].setup({
			--     capabilities = capabilities,
			-- })
		end,
	},
}
