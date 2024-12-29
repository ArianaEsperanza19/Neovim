-- LuaSnip is a highly flexible and extensible snippet plugin for Neovim, written in Lua. It allows users to define and use code snippets efficiently, helping to speed up the coding process by providing reusable templates that can be quickly expanded. LuaSnip supports various programming languages and integrates seamlessly with other plugins, enhancing overall productivity.
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

