-- LuaSnip is a highly flexible and extensible snippet plugin for Neovim, written in Lua. It allows users to define and use code snippets efficiently, helping to speed up the coding process by providing reusable templates that can be quickly expanded. LuaSnip supports various programming languages and integrates seamlessly with other plugins, enhancing overall productivity.

-- Requiere LuaSnip
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

-- Configuración de nvim-cmp para usar LuaSnip
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- Asegúrate de incluir esta línea
		{ name = "buffer" },
	},
})
