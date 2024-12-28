local M = {}

M.show_keymaps = function()
  local keymaps = [[
    Create New Lines Without Changing Mode:
       <leader>o: o<Esc>
       <leader>O: O<Esc>

    Move line or selection:
      m+Up: Move line/selection up
      m+Down: Move line/selection down
      Note: Keep in mind that if there is text directly in the upper or lower line, it will just swap the lines.

    Format with LSP:
      <leader>F:
      :lua vim.lsp.buf.format({ bufnr = bufnr, filter = function(client) return client.name == "null-ls" end })<CR>
  ]]

  vim.api.nvim_echo({{keymaps, "Normal"}}, true, {})
end

return M

