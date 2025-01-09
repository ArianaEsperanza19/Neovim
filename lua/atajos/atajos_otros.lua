local M = {}

M.show_keymaps = function()
  local keymaps = [[

    Hide Warnings:
    <leader>td: <cmd>lua require("diagnostics").toggle_diagnostics()<CR>

    Command to Clear Clipboard Contents:
       <leader>bp: :let @*="" | let @+="" | let @=""<CR>

    Execute current file
    <leader>rr

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
        Normal Mode <Ctrl+\>: :ToggleTerm()<CR>

    Accept Codeium Suggestions:
      <F1><F1>: codeium#Accept()
    Open Codeium Chat:
      <F3>: Codeium Chat

  ]]

  local Terminal  = require('toggleterm.terminal').Terminal
  local keymap_term = Terminal:new({
    cmd = "echo \""..keymaps.."\" | less",
    direction = "float",
    hidden = true,
  })
  keymap_term:toggle()
end

return M

