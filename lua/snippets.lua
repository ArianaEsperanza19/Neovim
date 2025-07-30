-- snippets.lua

-- Requiere LuaSnip
local luasnip = require("luasnip")

-- Configurar LuaSnip
luasnip.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
})

-- Cargar tus propios snippets desde un directorio específico
require("luasnip.loaders.from_vscode").lazy_load({
	paths = { "~/.config/nvim/luasnippets" },
})
require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "~/.config/nvim/luasnippets" } }) -- Carga snippets de formato Snipmate
