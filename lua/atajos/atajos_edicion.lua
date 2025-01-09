-- local M = {}
--
-- M.show_keymaps = function()
--   local keymaps = [[
--     Create New Lines Without Changing Mode:
--       <leader>o: o<Esc>
--       <leader>O: O<Esc>
--
--     Move line or selection:
--       m+Up: Move line/selection up
--       m+Down: Move line/selection down
--       Note: Keep in mind that if there is text directly in the upper or lower line, it will just swap the lines.
--
--     Paste Over Selection with Clipboard Content:
--       <C-v>: "_dP (Visual Mode)
--
--     Format with LSP:
--       <leader>F:
--       :lua vim.lsp.buf.format({ bufnr = bufnr, filter = function(client) return client.name == "null-ls" end })<CR>
--
--   ]]
--
--   vim.api.nvim_echo({{keymaps, "Normal"}}, true, {})
-- end
--
-- return M

local M = {}

M.show_keymaps = function()
  local keymaps = [[
    Create New Lines Without Changing Mode:
      <leader>o: o<Esc>
      <leader>O: O<Esc>

    Move line or selection:
      m+Up: Move line/selection up
      m+Down: Move line/selection down
      Note: Keep in mind that if there is text directly in the upper or lower line,
      it will just swap the lines.

    Paste Over Selection with Clipboard Content:
      <C-v>

    Format with LSP:
      <leader>F

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

