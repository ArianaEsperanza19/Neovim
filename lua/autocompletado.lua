-- autocompletado.lua

-- Requiere los módulos necesarios
local cmp = require("cmp")
local lspconfig = require("lspconfig")
local luasnip = require("luasnip")

-- Configuración de nvim-cmp
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- Expande los snippets con LuaSnip
		end,
	},
	mapping = {
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
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
		-- { name = 'cmdline' },
	},
})

-- Configuración del cliente LSP para usar con cmp-nvim-lsp
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Ejemplo de configuración para un servidor LSP (ajusta según tus necesidades)
lspconfig["pyright"].setup({ capabilities = capabilities })
-- Cargar configuración de snippets
require("snippets")

-- Cargar configuración de snippets
require("luasnip")
