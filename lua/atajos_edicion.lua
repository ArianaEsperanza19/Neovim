local M = {}

M.show_keymaps = function()
  local keymaps = [[
    Crear Nuevas Líneas Sin Cambiar de Modo:
       <leader>o: o<Esc>
       <leader>O: O<Esc>

    Formatear con LSP: 
      <leader>F: 
      :lua vim.lsp.buf.format({ bufnr = bufnr, filter = function(client) return client.name == "null-ls" end })<CR>
    Aceptar sugerencias de Codeium:
    <f3>: codeium#Accept()
  ]]

  vim.api.nvim_echo({{keymaps, "Normal"}}, true, {})
end

return M

