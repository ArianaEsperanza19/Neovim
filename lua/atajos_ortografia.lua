local M = {}

M.show_spell_keymaps = function()
  local spell_keymaps = [[
    Atajos y Comandos para Corrección Ortográfica:

    1. Corrección Ortográfica:
       - `z=`: Ver sugerencias de palabras mal escritas
       - `zg`: Agregar palabra al diccionario
       - `zug`: Deshacer agregar palabra al diccionario
       - `zw`: Marcar palabra como mal escrita
       - `zuw`: Deshacer marcar palabra como mal escrita
    
    2. Comandos para Cambiar el Idioma de Corrección Ortográfica:
       - `:SpellLangEn`: Cambia el idioma de corrección ortográfica a inglés
       - `:SpellLangEs`: Cambia el idioma de corrección ortográfica a español
       - `:DisableSpell`: Desactiva la corrección ortográfica
    
    3. Comandos Útiles:
       - `:set spell`: Activar la corrección ortográfica
       - `:set nospell`: Desactivar la corrección ortográfica
       - `]s`: Saltar a la siguiente palabra mal escrita
       - `[s`: Saltar a la palabra mal escrita anterior
  ]]

  vim.api.nvim_echo({{spell_keymaps, "Normal"}}, true, {})
end

return M


