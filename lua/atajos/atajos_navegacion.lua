local M = {}

M.show_keymaps = function()
  local keymaps = [[
    Clear Search Highlight:
       <leader>h: :nohlsearch<CR>

    Go to end
    <leader>.: $
    Go to beginning
    <leader>,: ^

    Ir a linea: nG

    Visual Navigation:
       <leader>j: gj
       <leader>k: gk

    Go to top from visible scream
    <Shift>h: Up
    <Shift>l: Down

    Buffer Navigation:
    -- Key mapping to switch to the next buffer
    z<right>: :bnext<CR>
    z<left>: :bprevious<CR>
    -- Key mapping to close the current buffer with saving changes
    z<down>: :bd<CR>
    -- Key mapping to close the current buffer without saving changes
    zx<down>: :bd!<CR>
    -- Open vertical window
    <C>wv
    -- Open horizontal window
    <C>ws
    -- Close window
    <C>wc
    -- Move through windows
    <C>wk : up
    <C>wj : down
    <C>wh : left
    <C>wl : right
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

