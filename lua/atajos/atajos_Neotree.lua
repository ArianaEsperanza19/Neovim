local M = {}

M.show_keymaps = function()
  local keymaps = [[
    File Manipulation in Neotree:
        -- Key mapping to open Neotree
        <leader>m: :NvimTreeToggle<CR>
        -- Default shortcuts to manipulate files
        a: Create a new file
        d: Delete file
        r: Rename file
        c: Copy file
        p: Paste file
        x: Cut file
        y: Copy file name
        <C-n>: Navigate to the next node
        <C-p>: Navigate to the previous node
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


