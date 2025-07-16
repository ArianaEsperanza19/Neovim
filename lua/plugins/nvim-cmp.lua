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
				mapping = {
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then -- Si el menú de completado está abierto
							cmp.select_next_item() -- Selecciona el siguiente ítem
						elseif luasnip.expand_or_jumpable() then -- Si hay un snippet para expandir o para saltar
							luasnip.expand_or_jump() -- Expande el snippet o salta al siguiente placeholder
						else
							fallback() -- Si no hay completado ni snippet, inserta un tab normal
						end
					end, { "i", "s" }), -- 'i' para modo insert, 's' para modo select (después de expandir un snippet)

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then -- Para saltar al placeholder anterior
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() and cmp.get_selected_entry() then
							cmp.confirm({ select = true }) -- Confirma la entrada seleccionada (incluyendo snippets)
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump() -- Si no hay menú, pero hay un snippet, expándelo
						else
							fallback() -- Si no hay completado ni snippet, inserta una nueva línea
						end
					end, { "i", "s" }),
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
