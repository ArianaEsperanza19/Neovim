-- Configurar LuaSnip
-- Requiere LuaSnip
local luasnip = require('luasnip')
-- Configuración de LuaSnip



-- Configurar LuaSnip 
luasnip.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
     })

-- Si tienes tus propios snippets, puedes cargarlos así:
require('luasnip/loaders/from_vscode').lazy_load({
  paths = { "./luasnippets" }
})

