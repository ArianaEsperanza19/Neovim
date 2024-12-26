local M = {}

M.show_keymaps = function()
  local keymaps = [[
    Crear Nuevas Líneas Sin Cambiar de Modo:
       <leader>o: o<Esc>
       <leader>O: O<Esc>

    Mover línea o selección:
      m+Up: Mover línea/selección hacia arriba
      m+Down: Mover línea/selección hacia abajo
      Nota: Ten en cuenta que si hay texto directamente en la linea superior o inferior, solo intercambiara las lineas.

    Formatear con LSP: 
      <leader>F: 
      :lua vim.lsp.buf.format({ bufnr = bufnr, filter = function(client) return client.name == "null-ls" end })<CR>
  ]]

  vim.api.nvim_echo({{keymaps, "Normal"}}, true, {})
end

return M

