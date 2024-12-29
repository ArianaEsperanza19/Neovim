local M = {}

M.show_keymaps = function()
  local keymaps = [[
    Command to Clear Clipboard Contents:
       <leader>bp: :let @*="" | let @+="" | let @=""<CR>

    Open or Close Terminal:
        Normal Mode <Ctrl+\>: :lua ToggleTerminal()<CR>
        Terminal Mode <Ctrl+\>: <Ctrl+\><Ctrl+n>:lua ToggleTerminal()<CR>

    Accept Codeium Suggestions:
      <F3>: codeium#Accept()
  ]]

  vim.api.nvim_echo({{keymaps, "Normal"}}, true, {})
end

return M

