local M = {}

M.show_keymaps = function()
  local keymaps = [[
    Special Characters in Insert Mode:
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

  local Terminal  = require('toggleterm.terminal').Terminal
  local keymap_term = Terminal:new({
    cmd = "echo \""..keymaps.."\" | less",
    direction = "float",
    hidden = true,
  })
  keymap_term:toggle()
  -- vim.api.nvim_echo({{keymaps, "Normal"}}, true, {})
end

return M

