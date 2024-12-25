local M = {}

M.show_keymaps = function()
  local keymaps = [[
    Comando para Borrar el Contenido del Portapapeles:
       <leader>bp: :let @*="" | let @+="" | let @=""<CR>

    Abrir o Cerrar la Terminal:
        Normal Mode <Ctrl+\>: :lua ToggleTerminal()<CR>
        Terminal Mode <Ctrl+\>: <Ctrl+\><Ctrl+n>:lua ToggleTerminal()<CR>
  ]]

  vim.api.nvim_echo({{keymaps, "Normal"}}, true, {})
end

return M

