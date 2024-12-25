local M = {}

M.show_keymaps = function()
  local keymaps = [[
    Caracteres Especiales en Modo Inserción:
       Alt+n: ñ
       Alt+a: á
       Alt+Shift+a: Á
       Alt+e: é
       Alt+Shift+e: É
       Alt+i: í
       Alt+Shift+i: Í
       Alt+o: ó
       Alt+Shift+o: Ó
       Alt+u: ú
       Alt+Shift+u: Ú
       Ctrl+e: ĕ
       F2+/: ¿
  ]]

  vim.api.nvim_echo({{keymaps, "Normal"}}, true, {})
end

return M

