local M = {}

M.show_keymaps = function()
  local keymaps = [[

    Hide Warnings:
    <leader>td: <cmd>lua require("diagnostics").toggle_diagnostics()<CR>

    Command to Clear Clipboard Contents:
       <leader>bp: :let @*="" | let @+="" | let @=""<CR>
        
    Save Current File:
      <C-s> 
      :w<CR> (Normal Mode)
      : <Esc>:w<CR>a (Insert Mode)
      : <Esc>:w<CR>gv (Visual Mode)

    Save and Quit:
      <leader><ESC>: :x<CR> (Normal Mode)

    Quit Without Saving:
      z<ESC>: :q<CR> (Normal Mode)

    Open or Close Terminal:
        Normal Mode <Ctrl+\>: :lua ToggleTerminal()<CR>
        Terminal Mode <Ctrl+\>: <Ctrl+\><Ctrl+n>:lua ToggleTerminal()<CR>

    Accept Codeium Suggestions:
      <F3>: codeium#Accept()

  ]]

  vim.api.nvim_echo({{keymaps, "Normal"}}, true, {})
end

return M
