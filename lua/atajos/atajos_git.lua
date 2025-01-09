local M = {}

M.show_keymaps = function()
  local keymaps = [[
  -- Gitsigns
  -- Watch current hunk (enter to leave)
  <leader><F4>: :Gitsigns preview_hunk<CR>

  -- Next hunk
  ]c: :Gitsigns next_hunk<CR>
  -- Previous hunk
  [c: :Gitsigns prev_hunk<CR>

  -- Show current line blame
  <F4>: :Gitsigns toggle_current_line_blame<CR>

  -- Reset current buffer
  :Gitsigns reset_buffer<CR>
  -- Reset buffer to all
  :Gitsigns reset_buffer_index<CR>
  -- Show differences in buffer
  :Gitsigns diffthis<CR>
  :Gvimdiffsplit <bratch o commit><CR>
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
